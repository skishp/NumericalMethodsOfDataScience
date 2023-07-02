%%  EXERCISE 4 BIDIAGONALIZATION
% Testing for correctnis contains following calculation
% U * U'    = I 
% V * V'    = I 
% U * A * V = B

%%  testing m = n 
A = rand(4,4)
[B,U,V] = bidiagonalization(A)
V*V'
U*U'
U*A*V


%%  testing m>n
A = rand(5,4)
[B,U,V] = bidiagonalization(A)
V*V'
U*U'
U*A*V


%%  testing m >> n 
A = rand(50,10)
[B,U,V] = bidiagonalization(A)
V*V'
U*U'
U*A*V


%% Part D
% for this chose k = 1 
%Idea: Set all i+1 indices to i so that we change the not only after i+1 to
%zero
%Problem: We will give the A(1:m,:) values,which are zero, a value =/ 0. 
A = rand(4,4)
[B, U, V] = four_d(A,1)
