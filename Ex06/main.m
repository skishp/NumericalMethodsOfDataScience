clear all
close all
clc
s = [1 1 1 2 5 3 6 4 7 8 8 8]';
t = [2 3 4 5 3 6 4 7 2 6 7 5]';
weights = [100 10 10 10 10 20 10 30 50 10 70 10]';

weighted_egdes = [s, t, weights];

mst = kruskal_algorithm(weighted_egdes, 12);

G = graph(s,t, weights);
[T, pred] = minspantree(G);

figure(1)
p = plot(G, 'EdgeLabel', G.Edges.Weight);
highlight(p, T)

T = graph(mst(:,1), mst(:,2), mst(:,3));
figure(2)
p = plot(G, 'EdgeLabel', G.Edges.Weight);
highlight(p, T)

s = [1 1 1 2 5 3 6 4 7 8 8 8]';
t = [2 3 4 5 3 6 4 7 2 6 7 5]';
weights = [100 10 10 10 10 20 10 30 50 20 70 10]';

weighted_egdes = [s, t, weights];

mst = kruskal_algorithm(weighted_egdes, 12);

G = graph(s,t, weights);
[T, pred] = minspantree(G);

figure(3)
p = plot(G, 'EdgeLabel', G.Edges.Weight);
highlight(p, T)

T = graph(mst(:,1), mst(:,2), mst(:,3));
figure(4)
p = plot(G, 'EdgeLabel', G.Edges.Weight);
highlight(p, T)