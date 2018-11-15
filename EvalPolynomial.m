
% [y] = EvalPolynomial(w, x)
%
% This function evaluates a polynomial with weights w at inputs x 
%
% w - weights (coefficients) for the polynomial model 
%     (as estimated by FitPolynomialRegression.m).  
%     Weights are ordered such that the j'th element of w is 
%     the linear coefficient of the j'th-order monomial, x^{j}
% x - 1-column vector which contains the inputs
%
% y - 1-column vector which is predicted by the polynomial model given 
%     by the estimated weights w and inputs x
%

function [y] = EvalPolynomial(w, x)
  % Get the amount of rows in the w column vector
  rows = size(w,1);
  % Populate the B matrix with x; the monomials go from being raised
  % from 0 to rows-1
  B = x.^(0:rows-1);
  % Multiply B and w to get a column vector output y
  y = B*w