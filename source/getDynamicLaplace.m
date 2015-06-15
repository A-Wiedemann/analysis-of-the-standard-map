function DLTilde = getDynamicLaplace(a,b,K)
% GETDYNAMICLAPLACE - returns the matrix of the discretized dynamic
% laplace operator
%
% Inputs:
%    a - left boundary of frequencies of the fourier basis
%    b - right boundary of frequencies of the fourier basis
%    K - intensity of the kicks
%
% Example:
%    DLTilde = getDynamicLaplace(-5,5,2);
    
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
    
    
    P = getTransferOperator(a,b,K);
    
    DLTilde = (DTilde + (P^2)'*DTilde*P^2)/2;
end
