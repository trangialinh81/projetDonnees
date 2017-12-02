Donnees = xlsread('quasar.txt', 'onglet', 'matrice des donnees');
 
% Les lignes suivantes permettent d'attribuer chaque polluant à la colonne
% qui lui correspond dans la base de données. Par exemple, pour le PM10, la 
% colonne qui lui correspond dans la base de données est la colonne 2
 
PM10    = Donnees(:,2); %micro_g/m3
NO2     = Donnees(:,3); %micro_g/m3
NO      = Donnees(:,4); %micro_g/m3
CO      = Donnees(:,5); %micro_g/m3
O3      = Donnees(:,6); %micro_g/m3
Trafic  = Donnees(:,7); %nombre de voitures
Tmin    = Donnees(:,8); %°C
Tmax    = Donnees(:,9); %°C
Pluie   = Donnees(:,10); %mm
Insol   = Donnees(:,11); %h
Vent    = Donnees(:,12); %m/s
 
% Cette ligne permet de définir les variables.
 
Variables = ['PM10    '; 'NO2     '; 'NO      '; 'CO      '; ...
             'O3      '; 'Trafic  '; 'Tmin    '; 'Tmax    '; ...
             'Pluie   ';'Insol    '; 'Vent    '];
         
% Cette commande permet de convertir les données numériques correspondant
% aux individus en chaîne de caractère.
 
Individus = num2str(Donnees(:,1));
 
% Donnes (:,2:12) correspondant à la matrice de données.
Donnees = Donnees(:,2:12);
 
% Les lignes qui suivents permettent de réaliser des boîte à moustaches
% (boxplot)sur nos variables.
 
figure('Name','Polluants micro-g/m3 année 2009','NumberTitle','off');
boxplot(Donnees(:,1:5),'orientation','horizontal','labels',Variables(1:5,1:5));
figure('Name','Trafic année 2009','NumberTitle','off');
boxplot(Trafic,'orientation','horizontal','labels','Trafic');
figure('Name','Tmin année 2009','NumberTitle','off');
boxplot(Tmin,'orientation','horizontal','labels','T min');
figure('Name','Tmax année 2009','NumberTitle','off');
boxplot(Tmax,'orientation','horizontal','labels','T max');
figure('Name','Pluie année 2009','NumberTitle','off');
boxplot(Pluie,'orientation','horizontal','labels','Pluie');
figure('Name','Insol année 2009','NumberTitle','off');
boxplot(Pluie,'orientation','horizontal','labels','Insol');
 
% La commande suivante permet de réaliser l'analyse en composantes
% principales: [COEFF,scores,latent,tsquare]=princomp(X).
% COEFF correspond à une matrice dont chaque colonne contient les
% coefficients pour une composantes principales.
% scores est la représentation de X dans l'espace des composantes
% principales.
% latent renvoie un vecteur contenant les valeurs propres de la matrice
% de covariance X.
% tsquare renvoie au test statistique d'Hotteling pour chaque point.
% princomp(zscore(X))permet de réaliser l'analyse en composantes
% principales sur des valeurs standardisées.
 
[vect_propres,scores,val_propres,t2] = princomp(zscore(Donnees));
 
% La commande suivante permet de réaliser le graphe des valeurs propres.
 
figure('Name','Spectre des valeurs propres','NumberTitle','off'); 
bar(val_propres);
 
% Et ceci nous donne les inerties cumulées des valeurs propres.
 
cumsum(val_propres)./sum(val_propres);
 
% Cette commande permet de réaliser la carte factorielle des individus sur 
% les deux axes principaux.
 
figure('Name','individus','NumberTitle','off'); 
plot(scores(:,1),scores(:,2),'r+');
text(scores(:,1),scores(:,2),Individus); 
a  = axis;
xl = a(1);xu = a(2);yl = a(3);yu = a(4);
xlabel('1ère Composante Principale')
ylabel('2nde Composante Principale')
hold on
line([xl xu],[0 0])
line([0 0],[yl yu])
 
% Cette commande permet de réaliser le cercle des corrélations variables
% sur les deux axes principaux.
 
figure('Name','Variables','NumberTitle','off'); 
plot(vect_propres(:,1),vect_propres(:,2),'.');
text(vect_propres(:,1),vect_propres(:,2),Variables);    
hold on
[x,y,z] = cylinder(1,200);
plot(x(1,:),y(1,:))
hold on
line([-1 1],[0 0])
line([0 0],[-1 1])
axis equal
 

