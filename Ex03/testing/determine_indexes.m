function[p,q] = determine_indexes(B)
n = size(B,1);
bi_di = diag(B,1);

epsilon = 0.000001;
bi_di(abs(bi_di)<epsilon) = 0;

q = n - find(bi_di,1,"last") -1;
 
if true== isempty(q)
    q = n;
    p = 0;
else
    bi_di = bi_di(1:end-q);
    p = find(~bi_di,1,"last");
    if true == isempty(p)
        p = 0;
    end
end
end