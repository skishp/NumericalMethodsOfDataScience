function [B] = apply_givens(A,i,k,cos,sin,dir)
%%
%   Input: 
%       - A:    Input Matrix A 
%       - i:    1<= i <= n
%       - k:    1<= k <= n
%       - cos:  cos = determine_viens(x)(1)
%       - sin:  sin = determine_givens(x)(2)
%       - dir:  dir either left oder right (matrixmultp.)
%
%   Output:
%       - B:    B=G*A or B=A*G
%%

if dir ~= 'l' && dir ~= 'r'
    error('dir is neither l or r')
end

% G = eye(size(A));
% G(i,i) = cos;
% G(k,k) = cos;
% G(i,k) = sin;
% G(k,i) = -sin;


if dir == 'l'
    B = A;
    B(i,:) = cos * A(i,:) - sin * A(k,:);
    B(k,:) = sin * A(i,:) + cos * A(k,:);
%     G = G.';
%     B(i,:) = G(i,:)*A;
%     B(k,:) = G(k,:)*A;
end
if dir == 'r'
    B = A';
    A = A';
    B(:,i) = cos * A(:,i) - sin * A(:,k);
    B(:,k) = sin * A(:,i) + cos * A(:,k);
%     B(:,i) = (A')*G(:,i);
%     B(:,k) = (A')*G(:,k);
end

end