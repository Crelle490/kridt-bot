## Launch three packages to run Gazebo
## From template: https://github.com/joshnewans/articubot_one/blob/adb08202d3dafeeaf8a3691ddd64aa8551c40f78/launch/launch_sim.launch.py

import os

from ament_index_python.packages import get_package_share_directory


from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription, DeclareLaunchArgument
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration

from launch_ros.actions import Node



def generate_launch_description():

    package_name='kridtbot' 

    #### Launch 1: Launch the robot state publisher
    rsp = IncludeLaunchDescription(
                PythonLaunchDescriptionSource([os.path.join(
                    get_package_share_directory(package_name),'launch','rsp.launch.py'
                )]), launch_arguments={'use_sim_time': 'true'}.items()
    )




    #### Launch 2: Launch Gazebo and run
    # Find world file
    default_world = os.path.join(get_package_share_directory(package_name), 'worlds', 'empty.world')

    world = LaunchConfiguration('world')
    world_arg = DeclareLaunchArgument('world', default_value=default_world, description='Gazebo world file')

    # Launch Gazebo with World
    gazebo = IncludeLaunchDescription(
                PythonLaunchDescriptionSource([os.path.join(
                    get_package_share_directory('ros_gz_sim'), 'launch', 'gz_sim.launch.py'
                )]),launch_arguments={'gz_args': ['-r -v4 ', world], 'on_exit_shutdown': 'true'}.items()
             )




    #### Launch 3: Spawn the robot in Gazebo
    spawn_entity = IncludeLaunchDescription(
                PythonLaunchDescriptionSource([os.path.join(
                    get_package_share_directory('ros_gz_sim'), 'launch', 'gz_spawn_model.launch.py'
                )]),launch_arguments={'topic':'robot_description', 'name': 'kridt_bot', 'x': '5.0', 'y': '5.0', 'z': '0.5'}.items()
             )

    # Launch all
    return LaunchDescription([
        rsp,
        world_arg,
        gazebo,
        spawn_entity,
    ])
