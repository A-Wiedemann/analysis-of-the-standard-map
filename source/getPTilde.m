function PTilde = getPTilde( a,b,K )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    n = b-a+1;
    
    getIndex1 = @(i) double(idivide(i-1,int32(n)) + a);
    getIndex2 = @(i) mod(i-1,n) + a;
    
    
    PTilde = zeros(n^2,n^2);
    
    for i = 1:n^2
        k_1 = getIndex1(i);
        k_2 = getIndex2(i);
        
        for j = 1:n^2
            l_1 = getIndex1(j);
            l_2 = getIndex2(j);
          
            if k_1-l_2==l_1
                PTilde(i,j) = besselj(l_2-k_2,-k_1*K);
            else
                PTilde(i,j) = 0;
            end
        end
    end
end


