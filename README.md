# open3D KUKA Demo

## Notes
- Pressing ```CTRL+Shift+V``` inside VS Code will open a much more legible preview of this markdown file
- The Kuka IIWA 7 Teach Pendant Touchscreen has **awful** responsiveness. You've been warned...

## Setting up the Kuka IIWA 7

1. Ensure all necessary connections are made for the following parts:
   - KUKA IIWA 7
     - X31 (Robot) to X21 (Controller) - Custom Cable
     - X651 (Robot) to X650 (Controller) - Custom Cable
     - 120 VDC to K1 (Controller) - Custom Cable
     - REALSENSE D405 Camera to Camera Mount - 2x M3 screws
   - Teach Pendant
     - Teach Pendant to X19 (Controller) - Tethered Cable
   - Demo PC
     - Ethernet (PC) to X66 (Controller) - Ethernet Cable
     - USB (PC) to D405 (Camera) - Custom USB Cable
     - Power to Demo PC - PC Power Cable
     - Keyboard to Demo PC - Tethered Cable/USB
     - Mouse to Demo PC - Tethered Cable/USB

## Initializing the hardware

1. Power on the Kuka IIWA 7
   - Press the Green Rocker Switch located below the cabling connections
1. Wait for the teach pendant software to show green/connection
   - It will show ```waiting for cyclic connection...``` prior to being ready
   - Turning key from vertical to horizontal and back may be necessary if connection is not made automatically
1. Put the robot in T1 mode
   - The robot can now be "wrangled" using the grey button at the end of the robot arm
   - If you do not see the T1/T2/Auto modes, move the physical key to the horizontal position
1. Stretch out the robot from the shipping/curled state via wrangling
   
## Demo Setup
### Starting the Kuka IIWA SmartServo Software
1. Set the Teach Pendant key into the horizontal position
2. Click the ```Auto``` Button
   - It will turn blue, but the bubble will not show selected
1. Set the Teach Pendant key into the vertical position
2. Select the ```Applications``` dropdown from the top menu bar, and select the ```ROSSmartServo``` option
3. Press the physical green right arrow (play) button to start the ROSSmartServo software on the IIWA
   - The screen should display some messages, including:
   - ```Initializing ROS tool.```
   - ```Waiting for ROS Master to connect at 172.31.1.150```

### Starting the ROSCORE
1. Open a new command line terminal
2. Launch a roscore using the roscore command below
   -```roscore```
3. On the Teach Pendant, Select the ```ROSSmartServo``` button from the top menu bar
4. Verify messages appear indicating the ROS Master has been connected, most importantly:
   - ```Starting the ROS control loop```

## Running the Demo
### Initial Steps
1. Double click the ```Open3D Demo``` shortcut on the desktop
   - RVIZ will start and the robot motion will begin
### Repeatable Steps

These steps can be repeated as often as necessary, to demonstrate the 3D reconstruction process. The robot will continue to move along the path, and the start capture, stop capture, and view mesh can happen at any point.

1. Double click the ```Start Capture``` shortcut on the desktop to begin capturing a mesh
   - This will begin building up a mesh and will continue until you run the Stop Capture script
   - It will print the following to the terminal: ```/open3d_yak: Start Reconstruction```
1. To stop the data collection, double click the ```Stop Capture``` shortcut on the desktop
   - Inside the terminal, you will see several messages
   - ```/open3d_yak: Stop Reconstruction```
   - ```Generating mesh```
   - ```Mesh Generated```
   - **Do not proceed to the next step until the ```Mesh Generated``` message has been published to the terminal**
1. View the mesh by double clicking on the ```View Mesh``` shortcut on the desktop

## Troubleshooting the Demo
### Issues

**1. ISSUE #1 - Roscore is started but the ROSSmartServo application doesn't give any indication of connecting to it.**
   - This occasionally happens when the robot sits idle for some time
   - Two potential fixes:
   1. Restart the ROSSmartServo Application
      - Ensure the teach pendant key is in the vertical position
      - Select the ```ROSSmartServo``` button from the top menu bar
      - Hit the physical red stop button
      - Select the ```Applications``` button from the top menu bar, and hit the ROSSmartServo checkbox
        - This can take several tries, as the teach pendant touchscreen responsiveness is low
        - Should receive messages indicating the ROS nodes are stopping, and the ROSSmartServo screen should dissapear
      - Restart the application following the steps listed in the **Starting the Kuka IIWA SmartServo Software** section
      - Relaunch roscore following the steps listed in the **Starting the ROSCORE** section and verify the connection is made
   2. Restart the KUKA IIWA 7 Controller
      - Power cycle using the Green Rocker Switch and follow the steps from **Initializing the hardware**

**1. ISSUE #2 - RVIZ starts, but the robot is in all zeros position (straight up) and nothing is moving**
   - Verify the ROSSmartServo application is running and connected
   - If not, go through the steps for **ISSUE #1** to debug
   - If it is, open a new terminal and paste the following:
     ```bash
     cd ~/open3d_demo_ws
     source devel/setup.bash
     rostopic list
     ```
   - Verify that the `/iiwa/...` topics are listed there
     - If not, restart the ROSSmartServo using the steps listed in **ISSUE #1**
     - If it is, restart the KUKA IIWA 7 Controller
      - Power cycle using the Green Rocker Switch and follow the steps from **Initializing the hardware**
     
