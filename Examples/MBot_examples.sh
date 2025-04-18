#!/bin/bash

pathDatasetMBot='/Datasets/MBot'

#------------------------------------
# Monocular Examples
#------------------------------------
# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_7 ./MBot_TimeStamps/maze_0415_FRB_7.txt dataset-MBot_mono

# some img missing
# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_6 ./MBot_TimeStamps/maze_0415_FRB_6.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_5 ./MBot_TimeStamps/maze_0415_FRB_5.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_4 ./MBot_TimeStamps/maze_0415_FRB_4.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_3 ./MBot_TimeStamps/maze_0415_FRB_3.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_2 ./MBot_TimeStamps/maze_0415_FRB_2.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB ./MBot_TimeStamps/maze_0415_FRB.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/square_0410_FRB ./MBot_TimeStamps/square_0410_FRB.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/square_0410_home ./MBot_TimeStamps/square_0410_home.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/square_0410_home_kernel ./MBot_TimeStamps/square_0410_home.txt dataset-MBot_mono



#------------------------------------
# Monocular-Inertial Examples
#------------------------------------
# echo "Launching MH01 with Monocular-Inertial sensor"
# ./Monocular-Inertial/mono_inertial_euroc ../Vocabulary/ORBvoc.txt ./Monocular-Inertial/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_5 ./MBot_TimeStamps/maze_0415_FRB_5.txt dataset-MBot_monoi

echo "Launching MH01 with Monocular-Inertial sensor"
./Monocular-Inertial/mono_inertial_euroc ../Vocabulary/ORBvoc.txt ./Monocular-Inertial/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_3 ./MBot_TimeStamps/maze_0415_FRB_3.txt dataset-MBot_monoi
