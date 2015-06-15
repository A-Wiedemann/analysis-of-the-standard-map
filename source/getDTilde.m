function DHat = getDTilde(a,b,K)
% GETDHAT - returns the matrix of the discretized dynamic laplace operator
%   
    n = b-a+1;
    
    getIndex1 = @(i) double(idivide(i-1,int32(n)) + a);
    getIndex2 = @(i) mod(i-1,n) + a;
    
    
    DTilde = zeros(n^2,n^2);
    
    for i = 1:n^2
        k_1 = getIndex1(i);
        k_2 = getIndex2(i);
        
        for j = 1:n^2
            l_1 = getIndex1(j);
            l_2 = getIndex2(j);
          
            if (k_1 == l_1) && (k_2 == l_2)
                DTilde(i,j) = -k_1^2-k_2^2;
            end
        end
    end
    
    
    PTilde = getPTilde(a,b,K);
    
    DHat = (DTilde + PTilde'*DTilde*PTilde);
end
