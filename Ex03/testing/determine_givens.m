% x           vector to be rotated
% i,k         indexes of rotation
% cos,sin     values that build up the Givens rotation


function[cos,sin] = determine_givens(x,i,k)

    z = sqrt(x(i)^2+x(k)^2);
    cos = x(i)/z;
    sin = -x(k)/z;
end