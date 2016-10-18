function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
theta_part1 = theta(1);
theta_part2 = theta(2:end);
X_part1=X(:,1);
X_part2=X(:,2:end);
y_part1=y(1);
y_part2=y(:,2:end);

reg_cost = (lambda/(2*m))* sum(theta_part2.^2);
J = ((1/m) * sum(-y.*log(sigmoid(X*theta))-((1-y).*log(1-sigmoid(X*theta))))) + reg_cost;

grad(1) =  (X_part1'*(sigmoid(X*theta)-y)) /m;

% grad(1) =  (X_part1*(sigmoid(X_part1*theta_part1)-y_part1)) /m;
grad(2:end) = ((X_part2'*(sigmoid(X*theta)-y))./m) + (lambda/m).*theta_part2;


% =============================================================

end
