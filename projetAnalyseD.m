
%Lecture du tableau et calcul des dimensions 
File = load('quasar_X.txt');
[nl,nc]=size(File);
X = File;

%vecteur des moyennes
moy = mean(X);

%vecteur des ecarts-types
ect = std(X);

%Centrage des données
VUNIT = linspace(1,1,nl);
y= X-(VUNIT * moy);

%Matrice diagonale
D = diag(ect)^-1;

%Matrice des données centrées et reduites
z=y*D ;

%Matrice des corrélations
V= (z'*z)/nl;

%Vecteurs propres et valeurs propres 

[E,D] = eig(v);
%classer par ordre decroissante nos valeurs propres
 [info,ind] = sort(diag(D),'descend');
 
 %Coordonnées des quasars sur les axes
 
 coord= Z * E;








