%% Exercise 1
A = rand(5,5);
x = A(1,:);
i = 1;
k = 5;
[cos, sin] = determine_givens(x,i,k);

B = apply_givens(A,i,k,cos,sin,'l');