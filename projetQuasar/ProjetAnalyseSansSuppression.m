close all
clear all

%chargement et suppression des données 
File = load('quasar_X.txt');
X = File;
[noml,nomc]= size(X);
n = size(X,1);
somme=0;
somme1=0;

%moyenne 
for i=1:n
    somme = somme + X(i, 1);
end

 moyenne = somme/n;
 
%ecart type
for i=1:n
    somme1 = somme1 + (X(i,1) - moyenne)^2;
end
ecart_type = sqrt(somme1 /(n-1));

%calculer vecteur des moyennes
moy = mean(X);

%X = X-repmat(moy,size(X,1),1);

Xc = X-repmat(moy,n,1);
mean(Xc);
%vecteur des ecarts-types
etc = std(Xc);
Xs = Xc./repmat(etc,n,1);
std(Xs);

% calculer la matrix de variance covariance V, pas la peine de
    V = (Xs.'*Xs)/(n-1);  
    
% pour ordonner les valeurs propres utiliser la fonction SORT
    %Les matrice de vecteur propres 
    [E,D] = eig(V);
    [info,ind] = sort(diag(D),'descend');
    E = E(:, ind);   
% Matrice valeurs propre E   
    D=diag(info);
        
 %calcul du pourcentage de l'information
    InfoX = info(1)/sum(info)*100  
    InfoY = info(2)/sum(info)*100 
    InfoZ = info(3)/sum(info)*100 
    InfoT = info(4)/sum(info)*100 
  
% Analyse de donnees
 P = Xs*E*D^(-1/2);
 
 F = E*D^(-1/2);
%visualiser plan
    ax = gca;
    ax.XAxisLocation = 'origin';
    hold on
    ax.YAxisLocation = 'origin';
    hold on
    ax.XDir = 'normal';
    hold on
    ax.YDir = 'normal';
   
variables = {'R.A.','Dec.','z','Radio','Xray','Mi','u_mag','sig_u','g_mag','sig_g','r_mag','sig_r','i_mag','sig_i','z_mag','sig_z','J_mag','sig_J','H_mag','sig_H','K_mag','sig_K'};

%plot(F(:,1),F(:,2),'.');
biplot(F(:,1:4))
text(F(:,1),F(:,2),variables);

hold on
[x,y,z] = cylinder(1,200);

plot(x(1,:),y(1,:))
hold on
axis([-1 1 0 inf])

axis equal
 
 
 
 
% plot(P(:,1),P(:,2),'.');
% %text(P(:,1),P(:,2),Xs);    
% hold on
% [x,y] = cylinder(1,18);
% plot(x(1,:),y(1,:));
% hold on
% 
% axis equal