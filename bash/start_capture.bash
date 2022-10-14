#!/usr/bin/env bash

source /home/open3d_demo/open3d_demo_ws/devel/setup.bash
rosservice call /start_reconstruction "tracking_frame: 'camera_color_optical_frame'
relative_frame: 'world'
translation_distance: 0.0
rotational_distance: 0.0
live: true
tsdf_params:
  voxel_length: 0.002
  sdf_trunc: 0.007
  min_box_values: {x: 0.475, y: 0.19, z: 0.515}
  max_box_values: {x: 0.725, y: 0.36, z: 0.725}
rgbd_params: {depth_scale: 1000.0, depth_trunc: 0.25, convert_rgb_to_intensity: false}"
