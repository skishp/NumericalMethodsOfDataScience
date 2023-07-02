function [clusters] = k_means_algorithm(data,clusters, centers, K, max_iter,tol)

%create vector with lenght of data
x = size(data);
for i = 1:max_iter
    for l =1:x(1)
        k = sum((centers - data(l,:)).^2,2);
        [~,clusters(l)] = min(k);
    end
    current_centers = zeros(size(centers));
    for t = 1:K
        if ~isempty(data(clusters==t,:))
            current_centers(t,:) = mean(data(clusters==t,:),1);
        else 
            current_centers(t,:) = data(randi(x(1)),:);
        end
    end
    if max(vecnorm(current_centers - centers,2,2)) < tol
        break;
    end
    centers = current_centers;
end

end