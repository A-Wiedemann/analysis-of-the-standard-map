%% Phasenraum für verschiedene Werte von K
% Zuerst werden m gleichverteilte Zufallszahlen in $[0,2\pi)$ erzeugt.
% Diese werden als Startpunkte von allen Graphen verwendet. Schließlich 
% werden n Iterationen von der Standardabbildung durchgeführt.

K = [2];
d = length(K);

% Anzahl der Startwerte
m = 20;

% Anzahl der Iterationen
n = 10000;

X = 2*pi*rand(m,2);

X = repmat(X,1,d);
Y = zeros(n*m,d*2);

Y(1:m,:) = X;

for k = 1:d
    
    % In X werden die Startwerte gespeichert.
    X = Y(1:m,[1 2]);
    
    for l = 1:n-1
         p       = X(:,1);
         theta   = X(:,2);
         
         % In X wird das Ergebnis der Anwendung der Standardabbildung
         % gespeichert.
        
         X       = [p + K(k) * sin(theta),theta + p + K(k)* sin(theta)];
         
         Y((l*m+1):((l+1)*m),[2*k-1,2*k]) = X;
    end
end%%

R = 3; r = 1;
X = Y(:,[1 2]);
T = [(R+r*cos(X(:,1))).*cos(X(:,2)),(R+r*cos(X(:,1))).*sin(X(:,2)),r*sin(X(:,1))];
Z = [R*cos(X(:,2)),R*sin(X(:,2)),X(:,1)];
X = mod(X,2*pi);

%% 
X = Y(:,[1 2]);
T = [(R+r*cos(X(:,1))).*cos(X(:,2)),(R+r*cos(X(:,1))).*sin(X(:,2)),r*sin(X(:,1))];
Z = [R*cos(X(:,2)),R*sin(X(:,2)),X(:,1)];
X = mod(X,2*pi);

figure();
plot(X(:,1),X(:,2),'.','MarkerSize',2,'MarkerEdgeColor','b');
set(gca,'xlim',[0 2*pi()],'ylim',[0 2*pi()]);
xlabel('p');
ylabel('\theta');

figure();
plot3(T(:,1),T(:,2),T(:,3),'.','MarkerSize',2,'MarkerEdgeColor','g');

figure();
plot3(Z(:,1),Z(:,2),Z(:,3),'.','MarkerSize',2,'MarkerEdgeColor','r');
