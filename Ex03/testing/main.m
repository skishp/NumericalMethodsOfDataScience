%% Ex 01
A = rand(50,40);
tic 
B = gkr_algorithm(A,0.03);
toc
tic 
C = svd(A);
toc

D = eye(10);
D(5,5) = 0;
D(5,6) = 1;
O = gkr_algorithm(D,0.03);

F= ones(10);
F(5,5) = 0;
F(5,6) = 1;
G = gkr_algorithm(F,0.003);
T = svd(F);


%% testing
Z = create_bidiagonalmatrix(10);
Z(10,10) = 0;
Y = gkr_algorithm(Z,0.003);
U = svd(Z);

Z_0 = create_bidiagonalmatrix(10);
for i=1:1:10
    Z_0(i,i) = 0;
end
Y_0 = gkr_algorithm(Z_0,0.003);
U_0 = svd(Z_0);