close all
clear all

%chargement et suppression des données 
File = load('quasar_X.txt');
[nl,nc]= find((File == -1)|(File == 0)|(File == -9));
File (nl,:)=[];

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
Xc = X-repmat(moy,n,1);
mean(Xc);

%vecteur des ecarts-types
etc = std(Xc);
Xs = Xc./repmat(etc,n,1);
std(Xs);

% calculer la matrix de variance covariance V, pas la peine de
% standadisee,on est en compression
    V = (Xs.'*Xs)/(n-1);          
    
    
% pour ordonner les valeurs propres utiliser la fonction SORT
    %Les matrice de vecteur propres 
    [E,D] = eig(V);
    [info,ind] = sort(diag(D),'descend');
    E = E(:, ind);
% Matrice valeurs propre E
    
    D=diag(info);
    
 %calcul du pourcentage de l'information
    InfoX = info(1)/sum(info)*100;
    InfoY = info(2)/sum(info)*100 ;
    InfoZ = info(3)/sum(info)*100 ;
    InfoT = info(4)/sum(info)*100 ;
    InfoTotal = InfoX + InfoY + InfoZ +InfoT;  
    
% Analyse de donnees
 P = Xs * E * D^(-1/2);
 
 %hist(Xs( : ,1),100);
 
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
   
biplot(F(:,2:3));

%biplot(F(:,1),F(:,2),'o');  

% radius =1;
% [x,y,z,]=cylinder(radius,200);
% 
% plot(x(1,:),y(1,:))
% axis([-2 2 0 inf])
% axis equal 


%plot(F(:,1),F(:,3),'.');

%plot(F(:,1),F(:,4),'.');

%axis([-1 1 -1 1]);
