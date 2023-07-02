function [B,U,V] = bidiagonalization(A)
%%
%   Input:
%       - A :   Input matrix A ( m x n matrix, m>= n)
%
%   Outputs: 
%       - B :   bidiagonal matrix B ( n x n) 
%       - U :   orthogonal matrix U ( m x m ) 
%       - V :   orthogonal matrix V ( n x n )
%%
[m,n] = size(A);

U = eye(m);
V = eye(n);


for i=1:n
    x=A(i:m,i);
    [v,beta] = householder(x);
    % left trafo matrix
    A(i:m,i:n)=A(i:m,i:n)-beta*v*(v'*A(i:m,i:n));
    % Store householder trafo matrix
    U(i:m,:) = U(i:m,:) - beta*v*(v'*U(i:m,:));
    
    if i+1 <= n
        x=A(i,i+1:n)';
        [v,beta] = householder(x);
        % right Householdertrafo A*V
        A(i:m,i+1:n)=A(i:m,i+1:n)-beta*(A(i:m,i+1:n)*v)*v';
        %Store householder trafo
        V(:,i+1:n) = V(:,i+1:n) - beta*(V(:,i+1:n)*v)*v';
    end
end

B=A(1:n,1:n);

end

