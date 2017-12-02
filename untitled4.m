M=[1 -9; 0 10]
E=[1 -1/sqrt(2); 0 1/sqrt(2)]
M*E
D= inv(E)*M*E
[E, D] = eig(M)