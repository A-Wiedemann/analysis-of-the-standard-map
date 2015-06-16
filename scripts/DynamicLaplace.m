clear; clc;
cd('../source/');

%% Eigenvalues
DL = getDynamicLaplace(-7,7,2);

EV = eig(DL);
[~,I] = sort(EV,'descend');
plot(EV(I),'+','color','green');

%% Eigenfunctions
% plot corresponding eigenfunctions of nearest eigenvalues to 1
plotEigenfunction(DL,-7,7,2);
plotEigenfunction(DL,-7,7,3);
plotEigenfunction(DL,-7,7,4);

cd('../scripts');