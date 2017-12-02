%soit les matrices des 5 etapes

E1=1/10;
E2=1/8;
E3=1/6;
E4=1/4;

dt=min([1/E1,1/E2,1/E3,1/E4])/100;

tmax=([1/E1,1/E2,1/E3,1/E4])*10;


M=[1-(E1+E2+E3+E4)*dt 0 0 0 0; 0 E1*dt 0 0 0; 0 0 E3*dt 0 0 ; 0 0 E3*dt 1 0; E3*dt 0 0 0 1];


%calcul de nmax
nmax = round(tmax/dt);

N = zeros(5, nmax);
