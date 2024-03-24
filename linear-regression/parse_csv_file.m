function [Y, InitialMatrix] = parse_csv_file(file_path)
%function [line] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation

  file = fopen(file_path, 'r');

  % read the header
  header = strsplit(fgetl(file), ',');
  cols = length(header) - 1;

  % read lines to get the number of rows
  lines = 0;
  while ~feof(file)

    fgetl(file);
    lines = lines + 1;

  end
  fseek(file, 0, 'bof');


  Y = zeros(lines, 1);
  InitialMatrix = cell(lines, cols + 1);

  % ignore the header
  line = fgetl(file);

  for i = 1:lines

    line = fgetl(file);
    data = strsplit(line, ',');
    Y(i) = str2double(data{1});

    for j = 2:cols + 1
      InitialMatrix{i, j} = data{j};

    end
  end

  fclose(file);
endfunction

