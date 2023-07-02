function[cos, sin] = determine_givens(x,i,k)
%%
%   Input: 
%       - x:    x = (x_1, ..., x_n)^T in R^n
%       - i:    1<= i <= n
%       - i:    1<= k <= n
%   
%   Output: 
%       - cos:  cos(theta)
%       - sin:  sin(theta)
%%
if i>=k
    error('i is larger then k, chose i<k')
end
cos = x(i)/sqrt(x(i)^2 + x(k)^2);
sin = -x(k)/sqrt(x(i)^2 + x(k)^2);
end