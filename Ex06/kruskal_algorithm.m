function mst = kruskal_algorithm(weighted_edges, num_vertices)
    % initalise and sort
    mst = [];
    [~, I] = sort(weighted_edges(:,3));
    weighted_edges = weighted_edges(I,:);

    % loop over all egdes
    while ~isempty(weighted_edges)
        % mst with added shortest edge
        tmp = [mst; weighted_edges(1,:)];

        % remove shortest edge
        weighted_edges(1,:) = [];

        % if we do not have a cycle we append the edge
        if isempty(allcycles(graph(tmp(:,1), tmp(:,2), tmp(:,3))))
            mst = tmp;
        end
    end
end