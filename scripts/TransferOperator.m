clear; clc;
cd('../source/');

%% Eigenvalues
% plot of unit circle in the complex plane
plot(exp(1i*linspace(0,2*pi,1000)),'b','LineWidth',2);
axis([-1.2,1.2,-1.2,1.2]);
axis equal;

% discrete transfer operator
P = getPTilde(-7,7,2);
EV = eig(P);

% plot eigenvalues of P
hold on;
plot(EV,'+','color',[0,0.6,0]);
hold off;


%% Eigenfunctions
% sorted indices of eigenvalues
[~,I] = sort(abs(EV-1));

% Plotting of corresponding eigenfunctions
plotEigenfunction(P,-7,7,I(2));
% frame=getframe(gcf);
% G=frame2im(frame);
% imwrite(G,'test.png','XResolution',300);
% % me2im(frame);
% set(gca,'LooseInset',get(gca,'TightInset'))
% set(gcf, 'Position', [50 50 size(getframe(gcf), 2) size(getframe(gcf), 1)]);
% saveas(gcf,'test4.png')

plotEigenfunction(P,-7,7,I(3));
plotEigenfunction(P,-7,7,I(4));

cd('../scripts');
