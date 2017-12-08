set1 = [1,2; 3,4; 5,6];
set2 = [10,20; 30,40; 50,60];
figure; 
plot(set1(:,1),set1(:,2),'b+',set2(:,1),set2(:,2),'g+','no')
hold on
x = [set1(:,1) set2(:,1)].';
y = [set1(:,2) set2(:,2)].';
plot(x,y,'r')
hold off
drawnow 