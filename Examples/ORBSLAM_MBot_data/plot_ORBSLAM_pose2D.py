import matplotlib.pyplot as plt
import numpy as np
import argparse
from mpl_toolkits.mplot3d import Axes3D
from matplotlib.animation import FuncAnimation
import cv2
import lcm
from mbot_lcm_msgs import pose2D_t
from mbot_lcm_msgs import mbot_img_t
from mbot_lcm_msgs import mbot_imu_t

def main():

    ## -------------  ARGUMENT PARSER  ------------ ##
    parser = argparse.ArgumentParser()

    # Add parameters (arguments)
    parser.add_argument('-lidar', '--lidar', type=str, help="ground truth from LiDAR SLAM", required=True)
    parser.add_argument('-orbslam', '--orbslam', type=str, help="pose estimation from ORBSLAM", required=True)
    # Usage: python3 plot_ORBSLAM_pose3D.py -lidar ../0419_rec_logs/rec4.log -orbslam f_dataset-MBot_mono_rec_4.txt
    
    args = parser.parse_args()
    
    ## -------------  LOAD LiDAR-SLAM POSE  ------------ ##
    time_lidar = []
    x_lidar = []
    y_lidar = []

    x_odom = []
    y_odom = []

    log = lcm.EventLog(args.lidar, "r")
    for event in log:
        if event.channel == "SLAM_POSE":
            # Decode the data from the event
            msg = pose2D_t.decode(event.data)
            time_lidar.append(msg.utime)
            x_lidar.append(msg.x)
            y_lidar.append(msg.y)

        if event.channel == "MBOT_ODOMETRY":
            # Decode the data from the event
            msg = pose2D_t.decode(event.data)
            x_odom.append(msg.x)
            y_odom.append(msg.y)

    ## -------------  LOAD ORB-SLAM POSE  ------------ ##
    try:
        data = np.loadtxt(args.orbslam, delimiter=' ')
    except Exception as e:
        print(f"Error loading file: {e}")
        return

    # Extract time, x, y, z columns
    try:
        time_orbslam = data[:, 0]/1000
        x_orbslam = data[:, 3]
        y_orbslam = -data[:, 1]
        #y_orbslam = data[:, 1]  # for Flipped
    except IndexError as e:
        print(f"Error extracting columns: {e}")
        return
    
    ## ------------- Calculate RMSE and STD of ORM-SLAM  ------------ ##
    matched_lidar_x = np.interp(time_orbslam, time_lidar, x_lidar)
    matched_lidar_y = np.interp(time_orbslam, time_lidar, y_lidar)

    # Calculate RMS error
    rms_error_x = np.sqrt(np.mean((np.array(matched_lidar_x) - np.array(x_orbslam))**2))
    rms_error_y = np.sqrt(np.mean((np.array(matched_lidar_y) - np.array(y_orbslam))**2))

    # Calculate standard deviation
    std_dev_x = np.std(np.array(matched_lidar_x) - np.array(x_orbslam))
    std_dev_y = np.std(np.array(matched_lidar_y) - np.array(y_orbslam))

    ## -------------  Plot x, y  versus time using scatter plot  ------------ ##
    fig = plt.figure(figsize=(8, 6))
    ax = fig.add_subplot(111)
    ax.plot(x_lidar, y_lidar, label="Ground Truth (LiDAR SLAM)", color='red', linestyle='-')
    ax.plot(x_odom, y_odom, label="Odometry Pose", color='brown', linestyle='--')
    ax.plot(x_orbslam, y_orbslam, label="ORB-SLAM Pose", color='blue')
    ax.set_xlabel("X Position (m)")
    ax.set_ylabel("Y Position (m)")
    ax.set_title("ORB-SLAM Pose vs Ground Truth")

    # Display standard deviation on the plot
    plt.text(0.55, 0.6, f"RMS Error x: {rms_error_x:.4f}\nRMS Error y: {rms_error_y:.4f}\nStd Dev x: {std_dev_x:.4f}\nStd Dev y: {std_dev_y:.4f}\n", 
         transform=plt.gca().transAxes, fontsize=10, verticalalignment='bottom', horizontalalignment='right')

    ax.legend()
    ax.grid()
    # Save the plot as an image
    plt.savefig("orbslam_mono_rec6.png", dpi=300, bbox_inches='tight')
    plt.show()

if __name__ == "__main__":
    main()