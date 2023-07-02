function [label] = spectral_clustering_fiedler_4(data)
% Compute similarity matrix (weight matrix)
n = size(data,1);
D = zeros(n);
for i=1:n
    for j=1:n

        if i == j
            D(i,j) = 0;
        else
            dist = norm(data(i,:)-data(j,:));
            D(i,j) = dist;
        end
    end
end

W = D;

S = diag(sum(W, 2));
L = S - W;



[eig_vec, ~] = eigs(L,2,10^-6);
fiedler = eig_vec(:,2);
%[idx,~] = kmeans(fiedler,2);
label = fiedler;
x = label<0;
y = label>0;
label(x) = 1;
label(y) = 2;

end