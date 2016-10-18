function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    theta = theta-((alpha*  (X'*(X*theta-y)))   /m);
%     theta(1,1) = theta(1,1)-((alpha*sum(X*theta-y))/m);
%      theta(2,1) = theta(2,1)-(alpha*((X(:,2)')*(X*theta-y))/m);
%      theta = theta - ((alpha*(X(:,2).*(X*theta-y)))/m);

%     theta_input=theta;
%     for i = 1:length(theta)
%         theta(i,1) = theta(i,1) - alpha*(X(:,i)'*(X*theta_input-y))/m;
%     end

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end