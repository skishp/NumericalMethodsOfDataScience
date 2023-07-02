function[B] = create_bidiagonalmatrix(n)

B = zeros(n,n);

for i=1:n
    B(i,i) = rand(1);
    if i < n
        B(i,i+1) = rand(1);
    end
end

end