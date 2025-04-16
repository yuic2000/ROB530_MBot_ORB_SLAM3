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
    parser.add_argument('-gt', '--groundtruth', type=str, help="ground truth from LiDAR SLAM", required=True)
    parser.add_argument('-orbslam', '--orbslam', type=str, help="pose estimation from ORBSLAM", required=True)
    # Usage: python3 plot_ORBSLAM_pose3D.py -gt ../0415_maze_logs/test_maze3.log -orbslam kf_dataset-MBot_mono_0415_3.txt
    
    args = parser.parse_args()
    
    ## -------------  LOAD LiDAR-SLAM POSE  ------------ ##
    x_gt = []
    y_gt = []

    log = lcm.EventLog(args.groundtruth, "r")
    for event in log:
        if event.channel == "SLAM_POSE":
            # Decode the data from the event
            msg = pose2D_t.decode(event.data)
            x_gt.append(msg.x)
            y_gt.append(msg.y)

    ## -------------  LOAD ORB-SLAM POSE  ------------ ##
    try:
        data = np.loadtxt(args.orbslam, delimiter=' ')
    except Exception as e:
        print(f"Error loading file: {e}")
        return

    # Extract time, x, y, z columns
    try:
        time = data[:, 0]
        x_orbslam = data[:, 3]
        y_orbslam = -data[:, 1]
    except IndexError as e:
        print(f"Error extracting columns: {e}")
        return

    ## -------------  Plot x, y  versus time using scatter plot  ------------ ##
    fig = plt.figure(figsize=(10, 6))
    ax = fig.add_subplot(111)
    ax.plot(x_gt, y_gt, label="Ground Truth (LiDAR SLAM)", color='red', linestyle='--')
    ax.plot(x_orbslam, y_orbslam, label="ORB-SLAM Pose", color='blue')
    ax.set_xlabel("X")
    ax.set_ylabel("Y")
    ax.set_title("ORB-SLAM Pose vs Ground Truth")
    ax.legend()
    ax.grid()

    plt.show()

if __name__ == "__main__":
    main()