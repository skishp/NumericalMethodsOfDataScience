function [centers] = k_means_seeding(data,K)

x = size(data);

%initilize first rand center
centers = zeros(K, 2);
index = randi(x(1));
centers(1, : ) = data(index, : );

% calculate squared distances to the initial available center
data(index,:) = [];
D = pdist2(data, centers(1,:)).^2;

for i = 2:K
    prob = D/sum(D);
    %take weighted random number
    value = randsample(data(:,1),1,true,prob);
    index = find(data(:,1)==value,1);
    centers(i,:) = data(index, : );

    %calculate new distanes
    data(index,:) = [];
    D = pdist2(data,centers(i,:)).^2;

end