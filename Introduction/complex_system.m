clear ; close all; clc
load('complex.mat');
plotData(X, y);
% SVM Parameters
C = 1; sigma = 0.1;
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
visualizeBoundary(X, y, model);