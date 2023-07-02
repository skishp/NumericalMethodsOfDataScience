function[B] = zero_row(B,j)
[n,m] = size(B);
for i=1:1:n-j
x = B(:,j+i);
[cos,sin] = determine_givens(x,j+i,j);
B = apply_givens(B,j+i,j,cos,sin,'l');
end
end