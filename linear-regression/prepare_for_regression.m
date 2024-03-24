function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  % TODO: prepare_for_regression implementation

  FeatureMatrix = zeros(size(InitialMatrix, 1), size(InitialMatrix, 2));

  % string to num
  for i = 1:size(InitialMatrix, 1)
    x = 1; % index of col of FeatureMatrix

    for j = 2:size(InitialMatrix, 2)

      if strcmp(InitialMatrix{i, j},"yes")
        FeatureMatrix(i, x++) = 1;

      elseif strcmp(InitialMatrix{i, j},"no")
        FeatureMatrix(i, x++) = 0;

      elseif strcmp(InitialMatrix{i, j},"semi-furnished")
        FeatureMatrix(i, x++) = 1;
        FeatureMatrix(i, x++) = 0;

      elseif strcmp(InitialMatrix{i, j},"unfurnished")
        FeatureMatrix(i, x++) = 0;
        FeatureMatrix(i, x++) = 1;

      elseif strcmp(InitialMatrix{i, j},"furnished")
        FeatureMatrix(i, x++) = 0;
        FeatureMatrix(i, x++) = 0;

      else

        FeatureMatrix(i, x++) = str2num(InitialMatrix{i, j});

      end
    end
  end

endfunction
