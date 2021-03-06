function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
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
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

theta2 = theta(2:end,:);
theta1 = theta(1,:);
X1 = X(:,1);
X2 = X(:,2:end);
y1 = y(1);
y2 = y(2:end);
additional_cost = (lambda/(2*m))* sum(theta2.^2);
additional_grad = ((lambda/m).*theta2);

J = (1/m) * sum(-y.*log(sigmoid(X*theta)) - (1-y).*log(1-(sigmoid(X*theta)))) + additional_cost;


grad(1) = (1/m).* (X1'*(sigmoid(X*theta)-y));

a= (sigmoid(X*theta));
% b= X2*a
% size(a)
% size(X2)
grad(2:end) =  (1/m).* (X2'*(sigmoid(X*theta)-y))+additional_grad;

% grad = (1/m).* (X*(sigmoid(X*theta)-y));





% =============================================================

grad = grad(:);

end
