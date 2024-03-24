function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation

    Theta = zeros(m, 1); % initialize the coefficients to zero

  for i = 1:iter % iterate for a fixed number of iterations
      hypothesis = FeatureMatrix * Theta; % compute the predicted values
      error = hypothesis - Y; % compute the error
      gradient = (1/n) * FeatureMatrix' * error; % compute the gradient
      Theta = Theta - alpha * gradient; % update the coefficients
  end

endfunction
