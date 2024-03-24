function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns

	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation


 decoded_path = zeros(length(path), 2);

  for i = 1:length(path)
    row = ceil(path(i) / cols);
    col = mod(path(i) - 1, cols) + 1;
    decoded_path(i, :) = [row, col];
  end

  decoded_path = decoded_path(1:end - 1, :);

endfunction
