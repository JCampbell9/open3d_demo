#!/usr/bin/env bash

export ROS_IP=172.31.1.150
export ROS_MASTER_URI=http://$ROS_IP:11311
source /opt/ros/noetic/setup.bash
source /home/open3d_demo/.bashrc
source /home/open3d_demo/open3d_demo_ws/devel/setup.bash
roslaunch open3d_demo demo.launch sim_robot:=false
