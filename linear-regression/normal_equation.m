function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights

  % TODO: normal_equation implementation

    m = size(FeaturesMatrix, 1);
  n = size(FeaturesMatrix, 2);

  A = FeaturesMatrix' * FeaturesMatrix;
  b = FeaturesMatrix' * Y;
  x_0 = zeros(n, 1);

  r = b - A * x_0;
  v = r;
  x = x_0;
  tolsquared = tol^2;
  k = 1;

  while k <= iter && r' * r > tolsquared
    tk = r' * r / (v' * A * v);
    x = x + tk * v;
    r_prev = r;
    r = r - tk * A * v;
    bk = r' * r / (r_prev' * r_prev);
    v = r + bk * v;
    k = k + 1;
  endwhile

  if r' * r <= tolsquared
    Theta = x;
  else
    Theta = zeros(n, 1);
  endif

endfunction
