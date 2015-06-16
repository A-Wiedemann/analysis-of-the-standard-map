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
    
    
    DTilde = zeros(n,n,n,n);
    
    for k_1 = a:b
        for k_2 = a:b
            DTilde(k_1-a+1,k_2-a+1,k_1-a+1,k_2-a+1) = -k_1^2-k_2^2;
        end
    end
    
    DTilde = reshape(DTilde,n^2,n^2);
    
    P = getTransferOperator(a,b,K);
    
    DLTilde = (DTilde + (P^2)'*DTilde*P^2)/2;
end
