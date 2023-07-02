%% Exercise 1
%% a 
% nearest neighbor
close all 
clear all
data = create_half_moon_dataset(500);
data = data';
label = spectral_clustering_fiedler(data);

figure;
gscatter(data(:,1),data(:,2),label);



%% a
% Gaussian
close all 
clear all
data = create_half_moon_dataset(500);
data = data';
label = spectral_clustering_fiedler_2(data);

figure;
gscatter(data(:,1),data(:,2),label);

%% a
% 1/dist , dist < thresh
close all 
clear all
data = create_half_moon_dataset(500);
data = data';
label = spectral_clustering_fiedler_3(data);

figure;
gscatter(data(:,1),data(:,2),label);

%% a
% dist
close all 
clear all
data = create_half_moon_dataset(500);
data = data';
label = spectral_clustering_fiedler_4(data);

figure;
gscatter(data(:,1),data(:,2),label);
%% a
% knn
clear all;
close all;
points = 100;
theta = rand(100,1)*2*pi;
radius = sqrt(rand(points,1));

x_1 = 0.2*radius.*cos(theta) + cos(theta);
y_1 = 0.2*radius.*sin(theta) + sin(theta);
x_2 = 0.1*radius.*cos(theta) + 0.1*cos(theta);
y_2 = 0.1*radius.*sin(theta) + 0.1*sin(theta);
data = [x_1,y_1; x_2, y_2];
label= spectral_clustering_fiedler(data);

figure
gscatter(data(:,1),data(:,2),label);
% idx = spectralcluster(data',2);
% figure;
% gscatter(data(1,:),data(2,:),idx)

%% a
% gaussian

clear all;
close all;
points = 500;
theta = rand(500,1)*2*pi;
radius = sqrt(rand(points,1));

x_1 = 0.2*radius.*cos(theta) + cos(theta);
y_1 = 0.2*radius.*sin(theta) + sin(theta);
x_2 = 0.1*radius.*cos(theta) + 0.1*cos(theta);
y_2 = 0.1*radius.*sin(theta) + 0.1*sin(theta);
data = [x_1,y_1; x_2, y_2];
label= spectral_clustering_fiedler_2(data);

figure
gscatter(data(:,1),data(:,2),label);
% idx = spectralcluster(data',2);
% figure;
% gscatter(data(1,:),data(2,:),idx)

%% b
% knn
clear all
close all
points = 200;
theta = rand(200,1)*2*pi;
radius = sqrt(rand(points,1));

x_1 = 0.2*radius.*cos(theta) + cos(theta);
y_1 = 0.2*radius.*sin(theta) + sin(theta);
x_2 = 0.1*radius.*cos(theta) + 0.1*cos(theta);
y_2 = 0.1*radius.*sin(theta) + 0.1*sin(theta);
data = [x_1,y_1; x_2, y_2];
label = normalized_spectral_clustering_shi_malik(data,2);

figure;

gscatter(data(:,1),data(:,2),label);


%% b
%knn
close all 
clear all
data = create_half_moon_dataset(500);
data = data';
label = normalized_spectral_clustering_shi_malik(data,2);

figure;
gscatter(data(:,1),data(:,2),label);

%% b
%knn
close all 
clear all
N = 100;  
r1 = 2;   
r2 = 5;   
theta = linspace(0,2*pi,N)';
X1 = r1*[cos(theta),sin(theta)]+ rand(N,1); 
X2 = r2*[cos(theta),sin(theta)]+ rand(N,1);
data= [X1;X2]; 
figure;
label = normalized_spectral_clustering_shi_malik(data,2);
gscatter(data(:,1),data(:,2),label);

%% b
%knn
close all 
clear all

data = generate_spiral(1000,3,0.05);
label = normalized_spectral_clustering_shi_malik(data,3);
figure;
gscatter(data(:,1),data(:,2),label);

%% b
% gaussian

close all 
clear all
N = 100;  
r1 = 2;   
r2 = 5;   
theta = linspace(0,2*pi,N)';
X1 = r1*[cos(theta),sin(theta)]+ rand(N,1); 
X2 = r2*[cos(theta),sin(theta)]+ rand(N,1);
data= [X1;X2]; 
figure;
label = normalized_spectral_clustering_shi_malik_2(data,2);
gscatter(data(:,1),data(:,2),label);

%% b
% gaussian
close all 
clear all

data = generate_spiral(1000,3,0.05);
label = normalized_spectral_clustering_shi_malik_2(data,3);
figure;
gscatter(data(:,1),data(:,2),label);