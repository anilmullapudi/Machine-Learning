function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
% X*theta'
% sum((X*theta'),2)
% (sum((X*theta'),2)-y)
% sum((sum((X*theta'),2)-y).^2)
% sum((theta(2:end).^2))

J = (sum(((X*theta)-y).^2)/(2*m)) + ((lambda/(2*m))*sum((theta(2:end).^2)))

theta1 = theta(1);
theta2 = theta(2:end);
X1=X(:,1);
X2=X(:,2:end);
grad(1) = (X1'*((X*theta)-y))/m;

grad(2:end) = ((X2'*((X*theta)-y))/m) + ((lambda/m)*theta2)




% =========================================================================

grad = grad(:);

end
