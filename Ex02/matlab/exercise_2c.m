clear
clc

%% create matrix with fastly decaying singular values

s_fast = rand(10,1).*(10.^(1:-1:-8))';
s_fast = sort(s_fast,'descend');
U = rand(10,10); [U,~] = qr(U);
V = rand(10,10); [V,~] = qr(V);

A_fast = U*diag(s_fast)*V;

%% create matrix with slowly decaying singular values

s_slow = rand(10,1);
s_slow = sort(s_slow,'descend');
U = rand(10,10); [U,~] = qr(U);
V = rand(10,10); [V,~] = qr(V);

A_slow = U*diag(s_slow)*V;

%% error between s and singular values of A

err_svd_fast = norm(svd(A_fast) - s_fast);
err_svd_slow = norm(svd(A_slow) - s_slow);

%% error between s and square roots of eigenvalues of A^T*A
T_fast = A_fast'*A_fast;
ev_fast = abs(flipud(eig(T_fast)));
err_ev_fast = norm(sqrt(ev_fast) - s_fast);

T_slow = A_slow'*A_slow;
ev_slow = abs(flipud(eig(T_slow)));
err_ev_slow = norm(sqrt(ev_slow) - s_slow);

%% condition of matrices
cond_A_fast = cond(A_fast);
cond_A_slow = cond(A_slow);
cond_T_fast = cond(T_fast);
cond_T_slow = cond(T_slow);