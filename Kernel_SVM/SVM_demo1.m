clear ; close all; clc
load('data1.mat');
% separatable case
plotData(X, y);
C = 0.5;
model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);
visualizeBoundaryLinear(X, y, model);
% adding some chaos
y2=[y;0;0;1;1];
X2=[X;2 3.7;3 3.2;2.5 3;1.7 3.2];
plotData(X2, y2);
C = 0.5;
model = svmTrain(X2, y2, C, @linearKernel, 1e-3, 20);
visualizeBoundaryLinear(X2, y2, model);