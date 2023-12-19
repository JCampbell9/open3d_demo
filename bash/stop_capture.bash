#!/usr/bin/env bash

source /home/jmcampbell/workspaces/tpr_local/devel/setup.bash
rosservice call /stop_reconstruction "archive_directory: ''
results_directory: '/home/jmcampbell/workspaces/tpr_local/open3d_archive/results'" 

