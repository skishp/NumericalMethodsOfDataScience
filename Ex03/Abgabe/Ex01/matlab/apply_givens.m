% i,k          indexes of the rotation
% cos,sin      values that build up the Givens rotation
% dir          decides if rotation is multiplied from the left or the right


function[B] = apply_givens(A,i,k,cos,sin,dir)

[m,n] = size(A);
B = A;

if dir == 'l'
    for c = 1:n
        B(i,c) = A(i,c)*cos - A(k,c)*sin;
        B(k,c) = A(i,c)*sin + A(k,c)*cos;
    end

elseif dir == 'r'
    for r = 1:m
        B(r,i) = A(r,i)*cos - A(r,k)*sin;
        B(r,k) = A(r,i)*sin + A(r,k)*cos;
    end
    
end

end