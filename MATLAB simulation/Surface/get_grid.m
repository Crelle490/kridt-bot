npts_y = 200;
npts_x = 200;
grid_surface = stl_to_gridsurface("mars_terrain.stl",npts_x,npts_y,'plot');

save("grid_surface","grid_surface")