function [label] = normalized_spectral_clustering_shi_malik_2(data,k)
% Compute similarity matrix (weight matrix)
n = size(data,1);
D = zeros(n);
sigma =2;
for i=1:n
    for j=1:n

        if i == j
            D(i,j) = 0;
        else
            dist = norm(data(i,:)-data(j,:));
            %D(i,j) = exp(-dist^2/(2*sigma^2));
            if dist < 0.1
                D(i,j) =exp(-dist^2/2*sigma^2);
            else
                D(i,j) = 0;
            end
        end
    end
end

W = D;

S = diag(sum(W, 2));
L = S - W;


[eig_vec, ~] = eigs(L,k,10^-6);
eig_vec = normalize(eig_vec);
[idx,~] = kmeans(eig_vec,k);

label = idx;


end