function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix

	% path -> the states chosen by the algorithm

  % TODO: heuristic_greedy implementation

   visited = zeros(size(Adj, 1), 1);

   path = [start_position];

   visited(start_position) = 1;

   while ~isempty(path)
    position = path(end);

    if position == (size(Adj,1) - 1)
      return;
    endif

    neighs = find(Adj(position,:) & ~visited');

    if isempty(neighs)
      path = path(1:end-1);

    else

      [~, max_prob_idx] = max(probabilities(neighs, end));
      neigh = neighs(max_prob_idx);

      visited(neigh) = 1;
      path = [path; neigh];

    endif
  endwhile

endfunction
