function [label] = normalized_spectral_clustering_shi_malik(data,k)
% Compute similarity matrix (weight matrix)
n = size(data,1);
D = zeros(n);
for i=1:n
    for j=1:n
       D(i,j) = norm(data(i,:)-data(j,:));
    end
end
W = zeros(n);
for i =1:n
    [~,idx] = mink(D(i,:),10);
    W(i,idx) = D(i,idx);
end


%W = exp(-D.^2/2);
S = diag(sum(W, 2));
L = S - W;



[eig_vec, ~] = eigs(L,k,10^-6);
eig_vec = normalize(eig_vec);
[idx,~] = kmeans(eig_vec,k);

label = idx;


end
