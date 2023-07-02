function[err] = test_golub_kahan_svd_step(n)

B = create_bidiagonalmatrix(n);

%% your implemented svd step

B_your_impl = golub_kahan_svd_step(B);

%% control solution

T = B'*B;

mu = eig(T(n-1:n,n-1:n));
if abs(mu(1)-T(n,n)) < abs(mu(2)-T(n,n))
    mu = mu(1);
else
    mu = mu(2);
end

[Q,R] = qr(T-mu*eye(n,n));

T_control = R*Q + mu*eye(n,n);

%% error

err = norm(   );

end