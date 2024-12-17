%% Two circular point clouds resembeling a wheel

% Wheel radius
r = 173/2; % [mm]

% Wheel width
w = 52.24;

n = 100;

theta = 0:2*pi/n:2*pi;
theta = theta(1:end-1);

x = cos(theta).*r;
x = x';
y = sin(theta).*r;
y = y';
z = ones(length(x)*2,1);
z(1:length(x)) = 0;
z(length(x)+1:length(x)*2) = z(length(x)+1:length(x)*2)*w;

point_cloud = [x,y,z(1:length(x));x,y,z(length(x)+1:length(x)*2)];

close all

plot3(point_cloud(:,1),point_cloud(:,2),point_cloud(:,3),'o')
axis equal

clearvars n r theta w x y z

save("wheel_point_cloud.mat","point_cloud")