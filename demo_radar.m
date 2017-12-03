function demo_radar 
 
% DEMO 1 
P = [30 18 23 52 69 ; 20 45 38 85 34].'; 
L = [0 0 0 0 0 ; 100 100 100 100 100].'; 
color = [1 0 0 ; 0 0 1]; 
str = {'Perf' 'Rapidité' 'Communauté' 'Simplicité' 'Portabilité'}; 
bg = 'tight'; 
 
figure('numbertitle','off','name','Radar Demo 1') 
ax = axes; 
radar(P,L,color,str,bg,ax); 
 
% DEMO 2 
P = [2.3 8.8 2.7 5.9 0.1 2.7 2.9 ; 1.2 9.8 1.8 4.7 7.5 1.4 3.7].'; 
L = [-1.5 12 0 0 -4 -1.5 5 ; 3 4  3 10 12 3 0].'; 
color = [0 0.7059 0.9451 ; 0 0 1]; 
str = {'CR' 'EM' 'CO' 'IN' 'EX' 'PA' 'FP'}; 
bg = 'circle'; 
 
figure('color','w','numbertitle','off','name','Radar Demo 2') 
 
[p,h,t] = radar(P,L,color,str,bg); 

set(p(1),'edgecolor','none','facecolor',[1 0.9686 0.9216]) 
set(p(2:3),'linewidth',3) 
set([t{1:2}],'fontsize',8) 
legend(p(2:3),{'2006' '2005'})