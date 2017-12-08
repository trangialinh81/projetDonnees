
%charger l'image pour la visualiser
Yini= single(imread('/home/tp-home010/kkoffi1/Documents/imageAnalyse.jpg'));
Itot=size(Yini,1);
Ctot = size(Yini, 2);
image(uint8(Yini))
title('image initialise')
axis

%transformation de la matrice Yini en matrice X  (codage)
n= Itot * Ctot;

%X = zeros(n, 3); 

X= reshape(Yini, n, 3);


%verifier que Yfin est égale a Yini (decodage)

%yfin = zeros(Itot, Ctot, 3);

Yfin = reshape(X, Itot, Ctot, 3);

figure(2)

image(uint8(Yfin))


% regarder que le rouge
Yfin(:, :, 2) = 0;    % enlever le vert 

Yfin(:, :, 3) = 0;    %enlever le bleu 

figure(3)

image(uint8(Yfin))

%matrice covariance V

V = (X' * X )/(n - 1);


% calcul des matrices vecteurs propres  E et valeurs propres D

 [E , D] = eig(V);
 
 [info, ind] = sort(diag(D), 'descend'); %ordonner les éléments de la diagonale par ordre decroissant
 
 %matrices vecteurs propres  E
 E = E(:, ind);
 
 %matrices valeurs propres D
 D= diag(info);
 
%calcul de la matrice P
P= X * E ;

%calcul de X à partir de P sans compression 
X = P * E' ;

%construction  de la matrice Yfin à partir de la matrice X
Yfin = reshape(X, Itot, Ctot, 3);
figure(4)
image(uint8(Yfin))


%Avec comprerssion(uniquement P1 et P2)
 tE = E';
 P = X * E(:, 1:2); 
 X = P * tE(1:2, :); 
 Yfin = reshape(X, Itot, Ctot, 3);
figure(5)
image(uint8(Yfin))




 


