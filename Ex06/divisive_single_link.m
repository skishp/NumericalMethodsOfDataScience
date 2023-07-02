function clusters = divisive_single_link(data,Kmax)
    n = length(data(:,1));
    % Initialisierung des Ausgangsclusters
    clusters = ones(n,1);

    %find distance matrix A
    A = pdist(data, 'euclidean');
    weights = squareform(A);

    G = graph(weights);
    weighted_egdes = G.Edges{:,:};
    mst = kruskal_algorithm(weighted_egdes, length(weighted_egdes(:,1)));
    [~,I] = sort(mst(:,3), 'descend');
    mst = mst(I,:);
%     T = graph(mst(:,1), mst(:,2), mst(:,3));
%     figure(1)
%     p = plot(G, 'EdgeLabel', G.Edges.Weight);
%     highlight(p, T)
%    
    figure(1)
    hold off
    gscatter(data(:,1),data(:,2),clusters);
    hold on
    legend off
    for i=1:length(mst(:,1))
        plot([data(mst(i,1),1), data(mst(i,2),1)], [data(mst(i,1),2), data(mst(i,2),2)],'K' )
        pause(0.01)
    end
    hold off
    for t=1:Kmax-1
            mst(1,:) = [];
            T = graph(mst(:,1), mst(:,2), mst(:,3));
            clusters = conncomp(T);
            figure(1)
            gscatter(data(:,1),data(:,2),clusters);
            hold on
            legend off
            for i=1:length(mst(:,1))
                plot([data(mst(i,1),1), data(mst(i,2),1)], [data(mst(i,1),2), data(mst(i,2),2)],'K' )
                pause(0.01)
            end
            hold off
    end
    

end