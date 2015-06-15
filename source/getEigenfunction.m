function f = getEigenfunction(A,a,b,j)
% GETEIGENFUNCTION - converts the j-th eigenvector of A to the eigenfunction
%
n = sym(b-a+1);

syms p theta;

[V,~] = eig(A);

f(p,theta) = 0*p^0+0*theta^0;

for i = 1:n^2
    [k_1, k_2] = quorem(i-1,n);
    k_1 = k_1 + a;
    k_2 = k_2 + a;
    
    e_k(p,theta) = exp(1i*(k_1*p+k_2*theta));
    
    c(p,theta) = real(V(i,j) * e_k);
        
    f(p,theta) = f + c;
end

f(p,theta) = real(f);
ezcontour(f,[0,2*pi],[0,2*pi]);