function f = plotEigenfunction(DO,a,b,j)
% PLOTEIGENFUNCTION - plots the corresponding eigenfunction of the j-th nearest eigenvalue to 1
% 
% Inputs:
%    DO - matrix of discretized operator
%    a - left boundary of frequencies of the fourier basis
%    b - right boundary of frequencies of the fourier basis
%    j - index specifying which eigenfunction is plotted
%
% Example:
%    PTilde = getTransferOperator(-5,5,2);
%    plotEigenfunction(PTilde,-5,5,2);
    
    n = b-a+1;
    
    [V,~] = eig(DO);
    EV  = eig(DO);

    [~,I] = sort(abs(EV-1));
    
    v = V(:,I(j));
    
    v = reshape(v,n,n);
    
    f = @(p,theta) 0;
    for k_1 = a:b
        for k_2 = a:b
            f = @(p,theta) f(p,theta) + v(k_1-a+1,k_2-a+1) * exp(1i*(p*k_1+theta*k_2));
        end
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
    
    title(['\lambda = ',num2str(EV(j))]);
end