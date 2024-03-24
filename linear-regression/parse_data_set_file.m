function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_data_set_file implementation

  file = fopen(file_path, 'r');

  dims = sscanf(fgetl(file), '%d');
  lines = dims(1);
  cols = dims(2);


  Y = zeros(lines, 1);
  InitialMatrix = cell(lines, cols + 1);

  for i = 1:lines

    line = fgetl(file);

    data = strsplit(line);

    Y(i) = str2double(data{1});

    % InitialMatrix
    for j = 2:cols + 1
      InitialMatrix{i, j} = data{j};
    end
  end

  fclose(file);

endfunction
