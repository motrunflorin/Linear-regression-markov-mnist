function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation

   Error = 0;
   h = zeros(rows(Theta), 1);
   m = length(Y);
   h = FeatureMatrix * Theta(2:end);

   Error = sum((Y - h) .^ 2) / m + lambda * sum(abs(Theta));


endfunction
