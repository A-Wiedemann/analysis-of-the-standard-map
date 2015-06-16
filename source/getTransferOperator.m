function PTilde = getTransferOperator(a,b,K)
% GETTRANSFEROPERATOR - returns the matrix of the discretized
% transfer operator
%    
% Inputs:
%    a - left boundary of frequencies of the fourier basis
%    b - right boundary of frequencies of the fourier basis
%    K - intensity of the kicks
%
% Example:
%    PTilde = getTransferOperator(-5,5,2);
    
    n = b-a+1;
    
    PTilde = zeros(n,n,n,n);
    
    for k_1 = a:b
        for l_1 = a:b
            l_2 = k_1-l_1;
            if l_2 >= a && l_2 <= b
                PTilde(k_1-a+1,:,l_1-a+1,l_2-a+1) = besselj(l_2-(a:b),-k_1*K);
            end
        end
    end
    
    PTilde = reshape(PTilde,n^2,n^2);
end