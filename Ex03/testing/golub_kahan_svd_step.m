function [B] = golub_kahan_svd_step(B)
n = size(B,1);
T = B'*B;
mu = eig(T(n-1:n,n-1:n));
%get the shift para. mu from T(n-1:n,n-1:n)
if abs(mu(1)-T(n,n)) < abs(mu(2)-T(n,n))
    mu = mu(1);
else
    mu = mu(2);
end
%x = T-mu*I(:,1)
x = [B(1,1)^2 - mu;
    B(1,1)*B(1,2)];
[c,s] = determine_givens(x,1,2);
B = apply_givens(B,1,2,c,s,'r');

for i = 1:n-1
    % U_i from 'l'
    [c,s] = determine_givens(B(:,i),i,i+1); %k = i+1
    B = apply_givens(B,i,i+1,c,s,'l');
    if i > 1
        % V_i from 'r'
        [c,s] = determine_givens(B(i-1,:),i,i+1);
        B = apply_givens(B,i,i+1,c,s,'r');
    end

end

end

