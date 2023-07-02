clear all 
close all

% points = 50;
% mat = eye(2);
% first = [0 0];
% second = [6 6];
% third = [15 15];
% data_point = [];
% 
% set_1 = mvnrnd(first,mat,points);
% set_2 = mvnrnd(second,mat,points);
% set_3 = mvnrnd(third,mat,points);
% data_points = [set_1;set_2; set_3];

data_points =create_half_moon_dataset(100);
data_points = data_points';
indices = divisive_single_link(data_points ,2);

n = length(data_points(:,1));
clusters1 = ones(n,1);
figure(2)
gscatter(data_points(:,1),data_points(:,2),clusters1 );

figure(3)
gscatter(data_points(:,1),data_points(:,2),indices);