function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation


  Error = 0;
  predictions = zeros(rows(Theta), 1);

  m = length(Y);
  predictions = FeatureMatrix * Theta(2: end);
  Error = sum((predictions - Y) .^ 2) / (2 * m);

endfunction

