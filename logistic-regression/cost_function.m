% COST function.
% It shows how accurate our model is based on current model parameters.
% It computes cost and gradient for logistic regression with regularization.
function [cost, gradients] = cost_function(X, y, theta, lambda)
    % X - training set.
    % y - training output values.
    % theta - model parameters.
    % lambda - regularization parameter.

    % Initialize number of training examples.
    m = length(y); 

    % Initialize variables we need to return. 
    cost = 0;
    gradients = zeros(size(theta));

    % Calculate hypothesis.
    predictions = hypothesis(X, theta);

    % Calculate regularization parameter.
    % Remmber that we should not regularize the parameter theta_zero.
    theta_cut = theta(2:end, 1);
    regularization_param = (lambda / (2 * m)) * (theta_cut' * theta_cut);
    
    % Calculate cost function.
    cost = (-1 / m) * (y' * log(predictions) + (1 - y)' * log(1 - predictions)) + regularization_param;

    % Calculate gradient steps.
    gradients = (1 / m) * (X' * (predictions - y)) + (lambda / m) * theta;
    % We should not regularize the parameter theta_zero.
    gradients(1) = (1 / m) * (X(:, 1)' * (predictions - y));
end
