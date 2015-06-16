clear; clc;
cd('../source/');

%% Eigenvalues
% plot of unit circle in the complex plane
plot(exp(1i*linspace(0,2*pi,1000)),'b','LineWidth',2);
axis([-1.2,1.2,-1.2,1.2]);
axis equal;

% discrete transfer operator
P = getTransferOperator(-7,7,2);
EV = eig(P);

% plot eigenvalues of P
hold on;
plot(EV,'+','color',[0,0.6,0]);
hold off;


%% Eigenfunctions
% plot corresponding eigenfunctions of nearest eigenvalues to 1 
plotEigenfunction(P,-7,7,2);
plotEigenfunction(P,-7,7,3);
plotEigenfunction(P,-7,7,4);

cd('../scripts');
