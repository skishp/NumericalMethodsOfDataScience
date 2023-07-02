%% Ex 3a)

data = rand(20,2);
figure;
h = gscatter(data(:,1),data(:,2));
xdata = get(h, 'xdata');
points = numel(data(:,1));
for i = 1:points
    text(xdata(i), data(i,2)+0.03, num2str(i), 'HorizontalAlignment', 'center');
end

figure;
tree = linkage(data,'single','euclidean');
dendro = dendrogram(tree);


%% Ex 3b)
%%info
x_1 = 0.1 + 0.3*rand(5,2);
x_2 = 0.6 + 0.4*rand(5,2);

x_3 = 0.6 + 0.4*rand(5,1);
y_3 = 0.4*rand(5,1);
x_3 = [x_3 y_3];

x_4 = 0.4*rand(5,1);
y_4 = 0.6 + 0.4*rand(5,1);
x_4 = [x_4 y_4];

data = [x_1;x_2;x_3;x_4;-x_1;-x_2;-x_3;-x_4];
x = size(data);
figure;
h = gscatter(data(:,1), data(:,2));
xdata = get(h, 'xdata');
points = numel(data(:,1));
for i = 1:points
    text(xdata(i), data(i,2)+0.08, num2str(i), 'HorizontalAlignment', 'center');
end

figure; 
tree = linkage (data, 'single', 'euclidean');
dendrogram(tree)


%% missleading information

data = [0,0; 0,1; 1,1; 1,0; 1,2;2,3;0,4];

figure; 
gscatter(data(:,1),data(:,2));

tree = linkage(data,'single', 'euclidean');
figure; 
dendrogram(tree)

%% no info at all
data = [0,0; 0,1; 1,1; 1,0; 1,2];

figure; 
gscatter(data(:,1),data(:,2));

tree = linkage(data,'single', 'euclidean');
figure; 
dendrogram(tree)

%% Ex 3c
%% halfmoon Set
data = create_half_moon_dataset(50);
data = data';
tree = linkage(data, 'single', 'euclidean');
figure;
dendrogram(tree);

figure;
gscatter(data(:,1),data(:,2));

%% non convex
points = 100;
theta = rand(100,1)*2*pi;
radius = sqrt(rand(points,1));

x_1 = 0.2*radius.*cos(theta) + cos(theta);
y_1 = 0.2*radius.*sin(theta) + sin(theta);
x_2 = 0.2*radius.*cos(theta) + 0.3*cos(theta);
y_2 = 0.2*radius.*sin(theta) + 0.3*sin(theta);
data = [x_1,y_1; x_2, y_2];
figure;
gscatter(data(:,1),data(:,2));

figure;
tree = linkage(data,'single','euclidean');
dendrogram(tree)