function[B] = golub_kahan_svd_step(B)

[n,~] = size(B);

%% determine shift
if n == 2
    T = [B(n-1,n-1)^2, B(n-1,n-1)*B(n-1,n);
        B(n-1,n-1)*B(n-1,n), B(n,n)^2 + B(n-1,n)^2];
else
    T = [B(n-1,n-1)^2 + B(n-2,n-1)^2, B(n-1,n-1)*B(n-1,n);
        B(n-1,n-1)*B(n-1,n), B(n,n)^2 + B(n-1,n)^2];
end

mu = eig(T);
if abs(mu(1)-T(2,2)) < abs(mu(2)-T(2,2))
    mu = mu(1);
else
    mu = mu(2);
end

%% apply Givens rotations

y = B(1,1)^2 - mu;
z = B(1,1)*B(1,2);

for k=1:n-1
    
    [cos,sin] = determine_givens([y;z],1,2);
    B = apply_givens(B,k,k+1,cos,sin,'r');
    
    y = B(k,k);
    z = B(k+1,k);
    
    [cos,sin] = determine_givens([y;z],1,2);
    B = apply_givens(B,k,k+1,cos,sin,'l');
    
    if k < n-1
        y = B(k,k+1);
        z = B(k,k+2);
    end
    
end

end