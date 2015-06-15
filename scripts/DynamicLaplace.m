clear; clc;
cd('../source/');

%% Eigenvalues
DL = getDHat(-7,7,2);

EV = eig(DL);
[~,I] = sort(EV,'descend');
plot(EV(I),'+','color','green');

%% Eigenfunctions
plotEigenfunction(DL,-7,7,I(2));
plotEigenfunction(DL,-7,7,I(3));
plotEigenfunction(DL,-7,7,I(4));

cd('../scripts');