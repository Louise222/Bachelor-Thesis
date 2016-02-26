theta=linspace(0,2*pi,200);
x1=cos(theta)+0.1*randn(1,200);
y1=sin(theta)+2+0.1*randn(1,200);
x2=2*cos(theta)+0.1*randn(1,200);
y2=2*sin(theta)+2+0.1*randn(1,200);
x3=1.5*cos(theta);
y3=1.5*sin(theta)+2;
% Figure 1
figure
plot(x2,y2,'ko','MarkerFaceColor','y','MarkerSize', 7);
hold on;
plot(x1,y1,'k+','LineWidth', 1, 'MarkerSize',7);
hold on;
plot(x3,y3,'b');
hold off;
% Figure 2
Z1=x1.^2; Z2=y1.^2; Z3=y1;
W1=x2.^2; W2=y2.^2; W3=y2;
figure
plot3(W1,W2,W3,'ko','MarkerFaceColor','y','MarkerSize', 7);
hold on;
plot3(Z1,Z2,Z3,'k+','LineWidth', 1, 'MarkerSize',7);
grid on;
xlabel('Z1'); ylabel('Z2'); zlabel('Z3');
view([22,-40]);
hold off;