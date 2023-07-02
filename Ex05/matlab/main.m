%% 1b) 
%idea use 4 points in square, use points left bottom and top right as
%center
data = [0 0; 1 0; 1 1; 0 1];
x= size(data);
clusters = zeros(x(1),1);
centers = [0 0; 1 1];
indices = k_means_algorithm(data,clusters,centers, 2 ,10, 0.003);
figure;
gscatter(data(:,1),data(:,2),indices);
title("non-intuitive")

%same idea, add point on upperhalf 
data = [0 0;0.5 0.6; 1 0; 1 1; 0 1];
x= size(data);
clusters = zeros(x(1),1);
centers = [0 0; 1 1];
indices = k_means_algorithm(data,clusters,centers, 2 ,10, 0.003);
figure;
gscatter(data(:,1),data(:,2),indices);
title("non-intuitive")

%intuitive solution, by using center points between halfs. 
data = [0 0;0.5 0.6; 1 0; 1 1; 0 1];
x= size(data);
clusters = zeros(x(1),1);
centers = [0.5 0; 0.5 1];
indices = k_means_algorithm(data,clusters,centers, 2 ,10, 0.003);
figure;
gscatter(data(:,1),data(:,2),indices);
title("intuitive")

%% 1c)
data = create_half_moon_dataset(2000);
data = data';
x= size(data);
clusters = zeros(x(1),1);

gscatter(data(:,1),data(:,2));
centers = [1 -1.5;0 1.5];
indices = k_means_algorithm(data,clusters, centers,2,1,0.0003);
figure;
gscatter(data(:,1),data(:,2),indices);
title("center = [1 -1;0 1.5]")

centers = [-1.5 0; 2.5 0];
indices = k_means_algorithm(data,clusters, centers,2,1,0.0003);
figure;
gscatter(data(:,1),data(:,2),indices);
title("center = [-1.5 0;2.5 0]")

centers = [0 0; 0 1];
indices = k_means_algorithm(data, clusters, centers,2,1,0.0003);
figure;
gscatter(data(:,1),data(:,2),indices);
title("center = [0 0;1 0]")

centers = [-1 0; 0 0];
indices = k_means_algorithm(data, clusters, centers,2,1,0.0003);
figure;
gscatter(data(:,1),data(:,2),indices);
title("center = [-1 0;0 0]")

%% 1d)
% data creation
data = create_dataset_ex1d();
data = data'; 

x= size(data);
clusters = zeros(x(1),1);

centers = [-1 -1;1 1;3 3];
colors = ['r','g','b','c'];

%optimal center points, max_iter 1
indices = k_means_algorithm(data,clusters, centers,3,1,0.0003);
figure;
gscatter(data(:,1), data(:,2),indices);
title('max_iter = 1, "optimal center points')

%optimal center points, max_iter 2
indices = k_means_algorithm(data,clusters, centers,3,2,0.0003);
figure;
gscatter(data(:,1), data(:,2),indices);
title('max_iter = 2, "optimal center points"')

% random center, max_iter 60
m = size(data);
centers = data(randi(m(1)),:);
indices = k_means_algorithm(data,clusters, centers,3,60,0.0003);
figure;
gscatter(data(:,1), data(:,2),indices);
title('random center, max_iter 60')

%% 2b)
data = [0 0; 1 0; 1 1; 0 1];
x= size(data);
clusters = zeros(x(1),1);
centers = k_means_seeding(data,2);
indices = k_means_algorithm(data,clusters,centers, 2 ,10, 0.003);
figure;
gscatter(data(:,1),data(:,2),indices);
title("non-intuitive")

%same idea, add point on upperhalf 
data = [0 0;0.5 0.6; 1 0; 1 1; 0 1];
x= size(data);
clusters = zeros(x(1),1);
centers = k_means_seeding(data,2);
indices = k_means_algorithm(data,clusters,centers, 2 ,10, 0.003);
figure;
gscatter(data(:,1),data(:,2),indices);
title("non-intuitive")

%% 2c
x_1 = 0.1 + 0.3*rand(100,2);
x_2 = 0.6 + 0.4*rand(100,2);

x_3 = 0.6 + 0.4*rand(100,1);
y_3 = 0.4*rand(100,1);
x_3 = [x_3 y_3];

x_4 = 0.4*rand(100,1);
y_4 = 0.6 + 0.4*rand(100,1);
x_4 = [x_4 y_4];

data = [x_1;x_2;x_3;x_4;-x_1;-x_2;-x_3;-x_4];
x = size(data);
figure;
gscatter(data(:,1), data(:,2));

%initializing storage for iterations and obj_function
runs = 100; 
objec_function_seed_mat = zeros(runs,1);
objec_function_rand_mat = zeros(runs,1);
iter_seed_mat = zeros(runs,1);
iter_rand_mat = zeros(runs,1);

clusters = zeros(x(1),1);
K = 8;
%looping over k_means runs
for i = 1: runs
    centers = -1 +2*rand(K,2);
    [indices_1, iter_rand_mat(i), objec_function_rand_mat(i)] = k_means_algorithm_2(data,clusters,centers,K,50,0.003);
    centers = k_means_seeding(data,K);
    [indices_2, iter_seed_mat(i), objec_function_seed_mat(i)] = k_means_algorithm_2(data,clusters,centers,K,50,0.003);
end
%plot final run of rand
figure;
gscatter(data(:,1),data(:,2),indices_1);
title("rand");

%plot final run of seed
figure;
gscatter(data(:,1),data(:,2),indices_2);
title("seed");

%calc average
avg_o_f_seed = mean(objec_function_seed_mat);
avg_it_seed = mean(iter_seed_mat);
avg_o_f_rand = mean(objec_function_rand_mat);
avg_it_rand = mean(iter_rand_mat);

%printing statements
fprintf('k means seeding:\n');
fprintf('Avg obj func:%.4f\n',avg_o_f_seed);

fprintf('k means iter seeding:\n');
fprintf('Iterations: %.4f\n',avg_it_seed);

fprintf('k means without seeding:\n');
fprintf('Avg obj func:%.4f\n',avg_o_f_rand);


fprintf('k means iter with out seeding:\n');
fprintf('Iterations: %.4f\n',avg_it_rand);