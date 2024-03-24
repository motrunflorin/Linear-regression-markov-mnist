function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Adj -> the adjacency matrix associated to the given labyrinth

  % TODO: get_adjacency_matrix implementation

    [rows, cols] = size(Labyrinth);
    num_states = rows * cols + 2;

    Adj = sparse(num_states, num_states);

    for i = 1:rows
        for j = 1:cols
            curr_state = (i - 1) * cols + j;

            % check for walls
            if bitget(Labyrinth(i, j), 4) == 0 && i > 1 % north
                north_state = curr_state - cols;
                Adj(curr_state, north_state) = 1;
            end

            if bitget(Labyrinth(i,j), 3) == 0 && i < rows % south
                south_state = curr_state + cols;
                Adj(curr_state, south_state) = 1;
            end

            if bitget(Labyrinth(i, j), 2) == 0 && j < cols % east
                east_state = curr_state + 1;
                Adj(curr_state, east_state) = 1;
            end

            if bitget(Labyrinth(i, j), 1) == 0 && j > 1 % west
                west_state = curr_state - 1;
                Adj(curr_state, west_state) = 1;
            end
        end
    end

  % same line and col for win and lose
  Adj(rows * cols + 1, rows * cols + 1) = 1; % WIN
  Adj(rows * cols + 2, rows * cols + 2) = 1; % LOSE

  % WIN
  for j = 1:cols
      if bitget(Labyrinth(1, j), 4) == 0 % north
          Adj(j, rows * cols + 1) = 1;
      end
  end

  for j = 1:cols
      if bitget(Labyrinth(rows, j), 3) == 0 % south
          Adj(j + (rows - 1) * cols, rows * cols + 1) = 1;
      end
  end

  %LOSE
  for i = 1:rows
      if bitget(Labyrinth(i, 1), 1) == 0 % west
          Adj((i - 1) * cols + 1 , rows * cols + 2) = 1;
      end
  end

  for i = 1:rows
      if bitget(Labyrinth(i, cols), 2) == 0 % east
        Adj(i * cols, rows * cols + 2) = 1;
      end
  end

endfunction

