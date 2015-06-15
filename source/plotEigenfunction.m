function f = plotEigenfunction( PTilde,a,b,j )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    n = b-a+1;
    
    [V,~] = eig(PTilde);
    EW  = eig(PTilde);

    getIndex1 = @(i) double(idivide(i-1,int32(n)) + a);
    getIndex2 = @(i) mod(i-1,n) + a;
    
    f = @(p,theta) 0;
    
    for i = 1:n^2
        k_1 = getIndex1(i);
        k_2 = getIndex2(i);
  
        f = @(p,theta) f(p,theta) + V(int32(i),int32(j)) * 1/2/pi * ...
            exp(1i*(p*k_1+theta*k_2));
    end
    
    [P,Theta] = meshgrid(0:.01:2*pi,0:.01:2*pi);
    
    figure();
    % contourf(P,Theta,real(f(P,Theta)), [0 0]);
    % colormap winter;
    % xlabel('p');
    % ylabel('\theta');
    
    % surf(P,Theta,real(f(P,Theta)),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
    surf(P,Theta,abs(f(P,Theta)),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
    axis vis3d off
    set(gca,'CameraPosition',[pi pi 6],'CameraTarget',[pi pi 0]);
    colormap(jet);
    axis tight;
    
    title(['\lambda = ',num2str(EW(j))]);
end