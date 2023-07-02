%% Excersie 1
%a
%initialize random vector and calc y= G^Tx
x_a = rand(5,1);
G = eye(5,5);
i = 1;
k = 5;
[cos,sin] = determine_givens(x_a,i,k);

G(i,i) = cos;
G(k,k) = cos;
G(i,k) = sin;
G(k,i) = -sin;


y_a = (G')*x_a;

%%  b)
%Solution: multiply with G(i,k) i= row, k=col 
i = 2;
k = 4;
x_b = rand(5,2);
G = eye(5,5);
[cos,sin] = determine_givens(x_b,i,k);

G(i,i) = cos;
G(k,k) = cos;
G(i,k) = sin;
G(k,i) = -sin;

y_b = (G')* x_b

%%  c)
%   1.  as we can see by y_b, only the ith row, 
%   and kth row change
%   2.  use vector multiplication instead of matrix 
%   3.  2*n 

%% d) 
% Idea, use multiplication from right
x_d = rand(5,2);
i = 1; 
k= 4;
G = eye(5,5);
[cos,sin] = determine_givens(x_d, i, k)

G(i,i) = cos;
G(k,k) = cos;
G(i,k) = sin;
G(k,i) = -sin;

y_d = (x_d')*G

%% e)
A = rand(6,5);
i = 1;
k = 5; 

x = A(:,2);
[cos, sin] = determine_givens(x,i,k);
B = apply_givens(A,i,k,cos,sin,'l')
C = apply_givens(A,i,k,cos,sin,'r')

%% f)
% If we have band matrix we can use the elements
% of the matrix, and not the whole vector