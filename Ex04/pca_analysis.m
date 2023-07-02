%% Exercise 02
%% d)

load("fisheriris.mat");
data  = meas; 

%Standardize the features
data = zscore(data);

%Compute the Covariance Matrix
covMat = cov(data);

%eigenvectors and eigenvalue
[eigenvectors, eigenvalues] = eig(covMat);

%sorting eigenvalues and eigenvectors
[~,idx] = sort(diag(eigenvalues), 'descend');
eigenvectors = eigenvectors(:,idx);


%principal components
principal_components = data * eigenvectors;

%variance through eigenvalues as percentage
variance = diag(eigenvalues) / sum(diag(eigenvalues)) * 100;

%% e)

% Plot the variances
figure;
bar(variance);
title('Variance Explained by Principal Components');
xlabel('Principal Component');
ylabel('Significance of Varaince (%)');

% Plot the pca
figure;
gscatter(principal_components(:,1), principal_components(:,2), species);
title('Principal Components');
xlabel('Component 1');
ylabel('Component 2');
legend('Location', 'best');

