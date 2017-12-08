n= 10;
X =rand(n,5);
somme=0;
s=0;

for j= 1:n
  somme = somme+X(j,1);
end

moy= somme/n;

for i= 1:n
    s = s + (X(i,1) - moy)^2;
end

ecar= sqrt(s/(n-1));

vecteurM= mean(X);

mMoy=repmat(vecteurM,n,1);

Xc = X-mMoy;

mean(Xc);
vecteurEcart= std(Xc);

mEcar= repmat(vecteurEcart,n,1);

Xs= Xc./mEcar;
std(Xs);

hist(Xs( : ,1),100);

hist(mMoy);

covV = (X.' * X)/(n-1);
covVc=(Xc.' * Xc)/(n-1);
covVs=(Xs.' * Xs)/(n-1);








 