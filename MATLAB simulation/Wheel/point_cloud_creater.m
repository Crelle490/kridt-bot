point_cloud = mars_rover_terrain_ptcloud_wheel_create("Wheel.STL");

d  =150/2;
point_cloud(:,1) = point_cloud(:,1)-d;
point_cloud(:,3) = point_cloud(:,3)-d;
%%
save("wheel_pc","point_cloud")