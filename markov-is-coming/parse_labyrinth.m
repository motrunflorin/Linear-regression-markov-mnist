function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

  % TODO: parse_labyrinth implementation

    file = fopen(file_path, 'rt');

    dim = fscanf(file, '%d', 2);
    lines_len = dim(1);
    rows_len = dim(2);

    Labyrinth = zeros(lines_len, rows_len);

    for i = 1:lines_len
        row = fscanf(file, '%d', rows_len);
        Labyrinth(i, :) = row';
    end

    fclose(file);

endfunction
