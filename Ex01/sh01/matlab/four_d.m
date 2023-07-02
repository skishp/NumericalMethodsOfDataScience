function [B,U,V] =four_d(A,k)
%%
%   Input:
%       - A :   Input matrix A ( m x n matrix, m>= n)
%       - k :   number of Iterations
%
%   Outputs: 
%       - B :   bidiagonal matrix B ( n x n) 
%       - U :   orthogonal matrix U ( m x m ) 
%       - V :   orthogonal matrix V ( n x n )
%     
%     Description:
%         - Basically same algorithm which you can see in bidiagonalization.m 
%         However k is number how many Iterations you will have in the For loop
%         And we try to put the A(1,2) value to zero too, so indicies have changed
%         k has to be k <=n
%         spy((abs(A))>1000*eps) keeps track of the zeros
%
%%
[m,n] = size(A);

U = eye(m);
V = eye(n);
eps = 0.0000001

for i=1:k
    x=A(i:m,i);
    [v,beta] = householder(x);
    % left trafo matrix
    A(i:m,i:n)=A(i:m,i:n)-beta*v*(v'*A(i:m,i:n));
    % Store householder trafo matrix
    U(i:m,:) = U(i:m,:) - beta*v*(v'*U(i:m,:));
    
    if i+1 <= n
        x=A(i,i:n)';
        [v,beta] = householder(x);
        % right Householdertrafo A*V
        A(i:m,i:n)=A(i:m,i:n)-beta*(A(i:m,i:n)*v)*v';
        %Store householder trafo
        V(:,i:n) = V(:,i:n) - beta*(V(:,i:n)*v)*v';
    end
    spy((abs(A))>1000*eps)
end

B=A(1:n,1:n);

end

