close all
clear all

%chargement et suppression des données 
File = load('quasar_X.txt');
%File1 = load('quasar_variables.txt');
[nl,nc]= find((File == -1)|(File == 0)|(File == -9));
File (nl,:)=[];

X = File;
[noml,nomc]= size(X);
n = size(X,1);
somme=0;
somme1=0;
%pca(X)
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
    InfoY = info(2)/sum(info)*100;
    InfoZ = info(3)/sum(info)*100;
    InfoT = info(4)/sum(info)*100;
    InfoTotal = InfoX + InfoY + InfoZ +InfoT;  
    
% Analyse de donnees
 P = Xs * E * D^(-1/2);
 
%plot(P(:,1),P(:,2),'.');
 

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
   
variables = {'R.A.','Dec.','z','Radio','Xray','Mi','u_mag','sig_u','g_mag','sig_g','r_mag','sig_r','i_mag','sig_i','z_mag','sig_z','J_mag','sig_J','H_mag','sig_H','K_mag','sig_K'};


%plot(F(:,1),F(:,2),'.');
biplot(F(:,1:2))
text(F(:,1),F(:,2),variables);

hold on
[x,y,z] = cylinder(1,200);

plot(x(1,:),y(1,:))
hold on
axis([-1 1 0 inf])

%line([-1 1],[0 0])

%line([0 0],[-1 1])

axis equal


%plot(F(:,1:2));
%variables = {'Accel','Disp','HP','MPG','Wgt'};

%biplot(F(:,1:3),'score',p());

%biplot(F(:,1:2));
%text(F(:,ind(1)),F(:,ind(2)),F(:,ind(3)),variables,'Color','red');
%str = {'Fac', 'Cho', 'Dis', 'Com', 'Cou'};

%text(P(:,ind(1)) , F(:,ind(2)), str, 'Color', 'red')

%variables = File1;
% R.A. = x(:,1);
% Dec. = x(:,2);
% z    = x(:,3);
% Radiox = x(:,4);
% Xray = x(:,5);
% Mi   = x(:,6);
% u_mag= x(:,7);
% sig_u= x(:,8);
% g_mag= x(:,9);
% sig_g= x(:,10);
% r_mag= x(:,11);
% sig_r= x(:,12);
% i_mag= x(:,13);
% sig_i= x(:,14);
% z_mag= x(:,15);
% sig_z= x(:,16);
% J_mag= x(:,17);
% sig_J= x(:,18);
% H_mag= x(:,19);
% sig_H= x(:,20);
% K_mag= x(:,21);
% sig_K= x(:,22);
%radius =1;
% %[x,y,z,]=cylinder(radius,200);
% %plot(x(1,:),y(1,:))
% %axis([-1 1 0 inf])
% %axis equal 
% %plot(:,1:2);
% %plot(F);


%axis([-1 1 -1 1]);
