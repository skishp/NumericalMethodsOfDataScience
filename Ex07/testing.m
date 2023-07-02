function [idx, C] = testing(X, k)
% X is the input data matrix
% k is the number of clusters

% Compute the similarity matrix
S = exp(-pdist2(X,X).^2);

% Compute the degree matrix
D = diag(sum(S));

% Compute the Laplacian matrix
L = D - S;

% Compute the first k eigenvectors of L
[V, ~] = eigs(L,k,'sm');

% Normalize each row of V to have unit length
%V = bsxfun(@rdivide,V,sqrt(sum(V.^2,2)));

% Cluster the rows of V using k-means
[idx, C] = kmeans(V,k);
end
