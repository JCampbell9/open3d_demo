#!/usr/bin/env bash

export ROS_IP=172.31.1.150
export ROS_MASTER_URI=http://$ROS_IP:11311
source /opt/ros/noetic/setup.bash
source ~/.bashrc
source /home/jmcampbell/workspaces/tpr_local/devel/setup.bash
roslaunch open3d_demo demo.launch sim_robot:=false
