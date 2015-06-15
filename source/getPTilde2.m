function PTilde = getPTilde2(a,b,K)
% GETPTILDE2 - calculates the matrix of the discretized transfer operator
%   
    n = b-a+1;
    
    getIndex1 = @(i) double(idivide(i-1,int32(n)) + a);
    getIndex2 = @(i) mod(i-1,n) + a;
    
    IPhi1 = @(p,theta) p-K*sin(theta-p);
    IPhi2 = @(p,theta) theta-p;
    
    line = linspace(-2*pi,2*pi,64);
    
    [P,Theta] = meshgrid(line,line);
    
    P1 = IPhi1(P,Theta);
    Theta1 = IPhi2(P,Theta);

    PTilde = zeros(n^2,n^2);
    
    for i = 1:n^2
        k_1 = getIndex1(i);
        k_2 = getIndex2(i);

        %e_k = @(p,theta) exp(1i*k_1*p+1i*k_2*theta)*(0<=p)*(p<=2* ...
        %                                                  pi)*(0<= ...
        %                                                  theta)* ...
        %      (theta<=2*pi);
        f = @(p,theta) exp(1i*k_1*(p-K*sin(theta-p))+1i*k_2*(theta- ...
                                                          p)).*(0<= ...
                                                          p).*(p<= ...
                                                          2*pi).*(0<=theta).*(theta<=2*pi);
        
        
        
        
        %X = e_k(P1,Theta1);
        X = f(P,Theta);
        
        Y = fft2(X);
        
        Nsamps = length(X);
        
        delta = (4*pi+1)/64
        Y = delta^2*Y(1:Nsamps/2,1:Nsamps/2);
        F = 1/delta*(0:Nsamps/2-1)/Nsamps;

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
    % 
end
