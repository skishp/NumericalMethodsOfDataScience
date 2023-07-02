function [v, beta] = householder(x) 
%% See algorithm 5.1.1 in Matrix computations (page 236) 
%Reference: Fabian R. Lischka: CS339 Project: The SVD of a Matrix Product
%           August 29, 2003, Scientific Computing and Computational 
%           Mathematics, Standford University. Available via 
%           URL: http://www.fabian-lischka.de/SVDproductShort.pdf
%           Changes have been made in the comments and in line 16 and 17.
%           The output parameter "mu" was omitted. 
%-------------------------------------------------------------------
% Input:    x: an element of R^{m}   
%        
% Output:   v: householder vector of R^{m} with v(1) = 1 
%           beta: parameter, Householder matrix H = I - beta*v*v^T
%-------------------------------------------------------------------
%% Initialization 
m     = length(x); 
sigma = x(2:m)'*x(2:m);
v     = x;
%% Cases 
if isempty(sigma)||sigma == 0 
    if x(1) >= 0 
        beta = 0;
    else
        beta = 2;
    end 
    v(1)     = 1; %set the first value of v to one 
    mu    = abs(x(1)); %sigma is zero 
else 
    mu    = sqrt(x(1)^2 + sigma);
    if x(1) <= 0 
        v(1) = x(1) - mu;
    else 
        v(1) = -sigma/(x(1) + mu);
    end 
    beta     = 2*v(1)^2/(sigma + v(1)^2);
    v        = v./v(1);
end 
end 
        
        
    