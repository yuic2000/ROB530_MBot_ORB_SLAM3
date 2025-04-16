#!/bin/bash

pathDatasetMBot='/Datasets/MBot'

echo "Launching MBot with Monocular sensor"
./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_6 ./Monocular/MBot_TimeStamps/maze_0415_FRB_6.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_5 ./Monocular/MBot_TimeStamps/maze_0415_FRB_5.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_4 ./Monocular/MBot_TimeStamps/maze_0415_FRB_4.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_3 ./Monocular/MBot_TimeStamps/maze_0415_FRB_3.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB_2 ./Monocular/MBot_TimeStamps/maze_0415_FRB_2.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/maze_0415_FRB ./Monocular/MBot_TimeStamps/maze_0415_FRB.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/square_0410_FRB ./Monocular/MBot_TimeStamps/square_0410_FRB.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/square_0410_home ./Monocular/MBot_TimeStamps/square_0410_home.txt dataset-MBot_mono

# echo "Launching MBot with Monocular sensor"
# ./Monocular/mono_euroc ../Vocabulary/ORBvoc.txt ./Monocular/MBot.yaml "$pathDatasetMBot"/square_0410_home_kernel ./Monocular/MBot_TimeStamps/square_0410_home.txt dataset-MBot_mono