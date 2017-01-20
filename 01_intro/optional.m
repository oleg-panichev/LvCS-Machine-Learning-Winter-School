close all; 
clear all;
clc;

p1_x = 1;
p1_y = 1;
p2_x = 800;
p2_y = 600;

rectangle(p1_x, p1_y, p2_x, p2_y);

[u v] = ginput( 4 );
% or
x = ginput(4)';  % note that ginput returns row vectors, hence the transpose