%% Real-world example for kernel SVM

%% Load data
% MNIST database http://yann.lecun.com/exdb/mnist/
train_images = loadMNISTImages('train-images.idx3-ubyte'); %784*60000
train_images = train_images'; %60000*784
train_labels = loadMNISTLabels('train-labels.idx1-ubyte'); %60000*1
test_images = loadMNISTImages('t10k-images.idx3-ubyte');   %784*10000
test_images = test_images';  %10000*784
test_labels = loadMNISTLabels('t10k-labels.idx1-ubyte');   %10000*1
display_network(train_images(1:100,:)'); % Show the first 100 images

%% Preprocessing
% scale the images
train_images_scale = scaledata(train_images,-1,1);
test_images_scale = scaledata(test_images,-1,1);

% looking for parameters
% step1: turn into LIBSVM format
% <label> <index1>:<value1> <index2>:<value2> ...
train_sparse = sparse(train_images_scale);
libsvmwrite('train',train_labels,train_sparse);
% step2: .../tool/subset.py for a subset of data(command line tool)
% >subset.py train 1000 output1 output2
% step3: .../tool/grid.py for searching parameters(command line tool)
% you will also need gnuplot settled
% >grid.py -log2c -2,10,1 -log2g -4,-14,-1 output1
% best parameters for RBF kernel: C=2,g=0.0039

%% Train and Predict
% linear kernel, 5-fold CV
model1 = svmtrain(train_labels, train_images_scale, '-s 0 -t 0 -c 2');
[predicted_label1, accuracy1, decision_values1] = svmpredict(test_labels, test_images_scale, model1);

% Gaussian kernel, 5-fold CV
model2 = svmtrain(train_labels, train_images_scale, '-s 0 -t 2 -g 0.0039 -c 2');
[predicted_label2, accuracy2, decision_values2] = svmpredict(test_labels, test_images_scale, model2);

%% Show wrong-matched digits
% linear kernel
index1 = find(test_labels~=predicted_label1);
display_network(test_images(index1(1:100),:)');
% Gaussian kernel
index2 = find(test_labels~=predicted_label2);
display_network(test_images(index2(1:100),:)');

