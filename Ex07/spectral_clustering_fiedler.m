function [label] = spectral_clustering_fiedler(data)
% Compute similarity matrix (weight matrix)
n = size(data,1);
D = zeros(n);
for i=1:n
    for j=1:n
       %D(i,j) = exp(-norm(data(i,:)-data(j,:))^2/2*sigma^2);
       D(i,j) = norm(data(i,:)-data(j,:));
    end
end
%W = exp(-D.^2/2);
%W = inv(D)
W = zeros(n);
for i =1:n
    [~,idx] = mink(D(i,:),7);
    W(i,idx) = D(i,idx);
end


S = diag(sum(W, 2));
L = S - W;



[eig_vec, ~] = eigs(L,2,10^-14);
fiedler = eig_vec(:,2);
%[idx,~] = kmeans(fiedler,2);
label = fiedler;
x = label<0;
y = label>0;
label(x) = 1;
label(y) = 2;

end
