function QTilde = getQTilde( a,b,K )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    n = b-a+1;
    
    getIndex1 = @(i) double(idivide(i-1,int32(n+1)) + a);
    getIndex2 = @(i) mod(i-1,n+1) + a;
    
    QTilde = zeros(n^2,n^2);
    
    for i = 1:n^2
        k_1 = getIndex1(i);
        k_2 = getIndex2(i);
        
        for j = 1:n^2
            l_1 = getIndex1(j);
            l_2 = getIndex2(j);
            
%             if k_1 == l_1
%                 
%                 if     k_2 - l_2 == 0
%                     QTilde(i,j) = -2*k_1^2-3*k_2^2+2*k_1*k_2-k_1^2*K^2;
%                 elseif k_2 - l_2 == 1
%                     QTilde(i,j) = -k_1*K-k_1^2*K+2*k_1*k_2*K;
%                 elseif k_2 - l_2 == -1
%                     QTilde(i,j) = k_1*K-k_1^2*K+2*k_1*k_2*K;
%                 elseif abs(k_2 - l_2) == 2
%                     QTilde(i,j) = -0.5*k_1^2*K^2;
%                 end
%                 
%             end

if k_1 == l_1
    if k_2 - l_2 == 0
        QTilde(i,j) = 2*k_1*k_2 - 2*k_1^2 - 3*k_2^2 - k_1^2*K^2;
    elseif k_2 - l_2 == -1
        QTilde(i,j) = 2*k_1*k_2*K + k_1*K - k_1^2*K;
    elseif k_2 - l_2 == 1
        QTilde(i,j) = 2*k_1*k_2*K - k_1*K - k_1^2*K;
    elseif k_2 - l_2 == -2
        QTilde(i,j) = -.5*k_1^2*K^2;
    elseif k_2 - l_2 == 2
        QTilde(i,j) = -.5*k_1^2*K^2;
    end
end

            
        end
        
    end
end

