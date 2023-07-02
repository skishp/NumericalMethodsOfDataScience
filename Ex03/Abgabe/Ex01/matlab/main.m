%% Ex 01 
%% C)
%random mxn matrix
A = rand(50,40);
B = gkr_algorithm(A,0.0003);
C = svd(A);

%Identiy Matrix
a = eye(10);
b = gkr_algorithm(a,0.002);

%one zero element on sup diag
c = create_bidiagonalmatrix(10);
c(5,6)= 0;
d = gkr_algorithm(c,0.001);


% Identiy matrix with one 0 on dig, and non zero on sup dig
F= eye(10);
F(5,5) = 0;
F(5,6) = 1;
G = gkr_algorithm(F,0.0003);
T = svd(F);

% bidiag matrix with 0 in Z(10,10)
Z = create_bidiagonalmatrix(10);
Z(10,10) = 0;
Y = gkr_algorithm(Z,0.0003);
U = svd(Z);

%full zero diag
Z_0 = create_bidiagonalmatrix(10);
for i=1:1:10
    Z_0(i,i) = 0;
end
Y_0 = gkr_algorithm(Z,0.0003);
U_0 = svd(Z);

% %large matrix
% tic
% H = rand(1000,500);
% I = gkr_algorithm(H,0.0003);
% di = sort(diag(I));
% I_svd = svd(H);
% toc

%% D) Time Comparison
% rand 100x50
A = rand(100,50);
tic
B = gkr_algorithm(A,0.002);
toc
tic 
B = svd(A);
toc

% rand 500x250
A = rand(500,250);
tic
B = gkr_algorithm(A,0.002);
toc
tic 
B = svd(A);
toc

% rand 100x50
A = create_bidiagonalmatrix(50);
tic
B = gkr_algorithm(A,0.002);
toc
tic 
B = svd(A);
toc

% rand 500x250
A = create_bidiagonalmatrix(250);
tic
B = gkr_algorithm(A,0.002);
toc
tic 
B = svd(A);
toc
% rand 500x250
A = create_bidiagonalmatrix(500);
tic
B = gkr_algorithm(A,0.002);
toc
tic 
B = svd(A);
toc