% CSCC11 - Introduction to Machine Learning, Fall 2018, Assignment 1
% D. Fleet, B. Chan
%
% [d, trainError, testError] = GetBestPolynomial(xTrain, yTrain, xTest, yTest, h) 
%
% This function takes as input a training dataset (xTrain, yTrain), a test 
% dataset (xTest, yTest), and the maximum degree of polynomials to consider.  
% It then computes the LS optimal weights for all polynomial regression models 
% from degree 1, 2, ... h.  It then computes residual errors for training 
% and testing data.  It then chooses the polynomial order of the best 
% model.
%
% xTrain - 1-column vector of training inputs
% yTrain - 1-column vector of training outputs for inputs xTrain
% xTest - 1-column vector of testing inputs
% yTest - 1-column vector of testing outputs for inputs xTest
% h - the maximum polynomial degree to consider 
% (Note: 1 <= h <= 10)
%
% d - polynomial degree that produces the best model
% eTrain - 1-column vector of length h containing the total squared error
%          on training data from fitted polynomials of degree 1 to h 
%          (in ascending order)
% eTest - 1-column vector of length h containining the total squared error
%         on test data from fitted polynomials of degree 1 to h 
%         (in ascending order)
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TO DO: Complete this function so that it computes the 
%         residual errors of the estimated weights for
%         multiple polynomial models, as well as the degree 
%         of the best polynomial model.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% COMPLETE THIS TEXT BOX:
%
% Code written by: Derek Chiu
%
% Student Name: Derek Chiu
% Student number: 1003439816	
% UtorID: chiuder4
%
% I hereby certify that the work contained here is my own
%
%
% ________Derek Chiu____________
% (sign with your name)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [d, trainError, testError] = GetBestPolynomial(xTrain, yTrain, xTest, yTest, h) 
  % Replace the code below with your code to compute lowest error and its
  % corresponding polynomial order.
  testError = zeros(h, 1);
  trainError = zeros(h, 1);
  d = 0;
  % Variable to keep track of lowest error
  lowest_error = inf;
  
  
  % Loop from powers 1 to h
  for k = 1:h
    % Get the fit from the training data
    w = FitPolynomialRegression(k,xTrain,yTrain);
    % Evaluate the models using the fit
    y1 = EvalPolynomial(w,xTrain);
    y2 = EvalPolynomial(w,xTest);
    % Compute square errors of each model
    errorTrain = norm(y1 - yTrain).^2;
    errorTest = norm(y2 - yTest).^2;
    % Check if current error is smaller than previous
    if errorTest < lowest_error
        lowest_error = errorTest;
        d = k;
    end
    % Update error vectors
    testError(k,1) = errorTest;
    trainError(k,1) = errorTrain;
  end



  % Plot the residual errors
  plot(trainError, 'r');
  hold on
  plot(testError, 'b');
  title('The Residual errors of the models on training (red) and testing errors (blue)');
  
  % TODO: Add any code below