clear ; close all; clc
load('data2.mat');
plotData(X, y);

% Try different SVM Parameters here
C=1; sigma=0.1;

% Train the SVM with Linear kernel
model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);
visualizeBoundaryLinear(X, y, model);
% Train the SVM with Gaussian kernel
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
visualizeBoundary(X, y, model);
% Train the SVM with Log kernel
model= svmTrain(X, y, C, @logKernel,1e-3, 20);
visualizeBoundary(X, y, model);