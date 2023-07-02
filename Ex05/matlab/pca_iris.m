clear
clc
close all

% load data set
data = iris_dataset;
[m,n] = size(iris_dataset);

% normalize mean
data_norm = data-mean(data,2);

% compute svd
[U,S,V] = svd(data_norm);

% compute principal components
T = U'*data_norm;

% compute variances
var = (diag(S).*diag(S))/n;
var_total = sum(var);
var_ratio = var/var_total;
var_cumulated = [0,var_ratio(1),sum(var_ratio(1:2)),sum(var_ratio(1:3)),sum(var_ratio(1:4))];

% plot variances
figure('Name','Cumulative and individual variance');
hold on;
stairs(0:4,var_cumulated);
bar(var_ratio);
set(gca, 'XTick',1:4);
legend('cumulative variance','individual variance');
xlabel('principal components');
ylabel('variance');

% plot first two principal components
figure('Name','First two principal components of all data points');
hold on;
plot(T(1,1:50),T(2,1:50),'*');
plot(T(1,51:100),T(2,51:100),'*');
plot(T(1,101:150),T(2,101:150),'*');
legend('first species','second species','third species');
xlabel('first principal component');
ylabel('second principal component');