function[B] = gkr_algorithm(A,tol)
[U,B,V] = bidiagonalization(A);
[m,n] = size(A);
B = B(1:n,:);

q = 0;
while q<n
    for i=1:1:n-1
        if abs(B(i,i+1)) < tol*(abs(B(i,i))+abs(B(i+1,i+1)))
            B(i,i+1)=0;
        end
    end
    [p,q] = determine_indexes(B);
    if q <n
        B_2 = B(p+1:n-q,p+1:n-q);
        x = diag(B_2);
        x(x<10^-5) = 0;
        if true == any(~x(1:end-1))
            j = find(~x(1:end-1),1,"last");
            B_2 = zero_row(B_2,j);
        else
            B_2 = golub_kahan_svd_step(B_2);
        end
        B(p+1:n-q,p+1:n-q) = B_2;
    end
end
end