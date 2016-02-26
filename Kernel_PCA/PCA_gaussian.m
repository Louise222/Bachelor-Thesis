% Input points before kernel PCA
theta=linspace(0,2*pi,200);
x1=cos(theta)+0.1*randn(1,200);
y1=sin(theta)+0.1*randn(1,200);
x2=2*cos(theta)+0.1*randn(1,200);
y2=2*sin(theta)+0.1*randn(1,200);
%---------------------------------
figure
plot(x1,y1,'k+','LineWidth', 1, 'MarkerSize',7);
hold on;
plot(x2,y2,'ko','MarkerFaceColor','y','MarkerSize', 7);
hold off;

% Output after kernel PCA
---------------------------------
X1=[x1;y1];
Y1=kernelpca_gaussian(X1,2);
xx1=Y1(1,:);
yy1=Y1(2,:);
X2=[x2;y2];
Y2=kernelpca_gaussian(X2,2);
xx2=Y2(1,:);
yy2=Y2(2,:);
% plot figure
figure
plot(xx1,yy1,'k+','LineWidth', 1, 'MarkerSize',7);
hold on;
plot(xx2,yy2,'ko','MarkerFaceColor','y','MarkerSize', 7);
hold off;
