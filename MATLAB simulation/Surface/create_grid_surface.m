%% Creates terrain for veichel simulation

% Step size
dx = 0.05;
dy = 0.05;

% Total length in x- and y-direction
x_stop = 5;
y_stop = 2;


% Determine height data

% Initial strainght distance
straingth_distance = 2;

x_straight = 0:dx:straingth_distance;
z_straight = zeros(1,length(x_straight));

% Both wheeled curved distance and period
n_hils = 2;
f_both = pi/2;
A_both_hils = 0.2;
both_wheel_hils = (n_hils/f_both)*2*pi;

x_hill_both = 0:dx:both_wheel_hils;
z_hill_both = sin(f_both*x_hill_both)*A_both_hils;

% Individual wheel curve
n_hils = 2;
f_ind = pi/2;
A_ind_hils = 0.2;
ind_wheel_hils = (n_hils/f_both)*2*pi;

x_hill_ind = 0:dx:ind_wheel_hils;
z_hill_ind_1 = sin(f_ind*x_hill_ind)*A_ind_hils;
z_hill_ind_2 = zeros(1,length(x_hill_ind));

% Assembel vectros 
x = [x_straight,x_straight(end)+x_hill_both+dx,x_straight(end)+x_hill_both(end)+x_hill_ind+2*dx];

z1 = [z_straight,z_hill_both,z_hill_ind_1];
z2 = [z_straight,z_hill_both,z_hill_ind_2];

y1 = dy:dy:y_stop+dy;
y2 = -y_stop:dy:0;

% Create height map
ny1 = length(y1);
ny2 = length(y2);

z1 = repmat(z1',1,ny1);
z2 = repmat(z2',1,ny2);

grid_surface.xg = x;
grid_surface.yg =  [y2,y1];
grid_surface.z_heights =  [z2,z1];
grid_surface.z_heights_data = grid_surface.z_heights;

[X,Y] = ndgrid(grid_surface.xg,grid_surface.yg);
grid_surface.ptcloud = [X(:) Y(:) grid_surface.z_heights(:)];

%clearvars -except grid_surface
