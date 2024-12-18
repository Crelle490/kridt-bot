%{
    MATLAB simulation of rover

    To get the current configuration of the simulation go to the folder
    Surface and find the script creat_grid_surface.m. Run the script and
    then run this file. An Simscape window will open, run this and the
    simulation will be shown.
    
    Currently velocity control is used to addjust the speed of the rover,
    and the linear actuators are adjusted to ensure zero differential
    angle. This can be observed by running the simulation.
%}
load("Wheel\wheel_point_cloud.mat")
load("Surface\grid_surface.mat")
%open("Simscape_simulation_of_rover.slx")

