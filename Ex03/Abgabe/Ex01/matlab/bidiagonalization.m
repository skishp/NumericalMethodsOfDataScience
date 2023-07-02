function [UB,A,VB] = bidiagonalization(A)

[m,n] = size(A);
UB = eye(m);
VB = eye(n);

for i = 1:n
    
    %% Householder reflection from the left
    x = A(i:m,i);
    [v,beta] = householder(x);
    H = eye(m-i+1)-beta*(v*v');
    A(i:m,i:n) = H'*A(i:m,i:n);
    UB(:,i:m) = UB(:,i:m)*H;
    
    %% Householder reflection from the right
    if (i <= n-2)
        x = A(i,i+1:n)';
        [v,beta] = householder(x);
        H = eye(n-i)-beta*(v*v');
        A(i:m,i+1:n) = A(i:m,i+1:n)*H;
        VB(:,i+1:n) = VB(:,i+1:n)*H;
    end
    
end

end