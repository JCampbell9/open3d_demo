#!/usr/bin/env bash

source /home/jmcampbell/workspaces/tpr_local/devel/setup.bash
rosservice call /start_reconstruction "tracking_frame: 'camera_color_optical_frame'
relative_frame: 'world'
translation_distance: 0.0
rotational_distance: 0.0
live: true
tsdf_params:
  voxel_length: 0.002
  sdf_trunc: 0.007
  min_box_values: {x: 0.0, y: 0.0, z: 0.0}
  max_box_values: {x: 0.0, y: 0.0, z: 0.0}
rgbd_params: {depth_scale: 1000.0, depth_trunc: 0.5, convert_rgb_to_intensity: false}"
