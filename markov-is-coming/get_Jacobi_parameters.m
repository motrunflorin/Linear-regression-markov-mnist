function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)

  % G -> iteration matrix
	% c -> iteration vector

  [lines, cols] = size(Link);

  G = zeros(lines - 2, cols - 2);
  c = zeros(lines - 2, 1);

  for i = 1:lines - 2
    for j = 1:cols - 2

      if j < cols - 1

        G(i, j) = Link(i, j);
      endif
    endfor

  c(i, 1) = Link(i, cols - 1);

  endfor

 G = sparse(G);
 c = sparse(c);

endfunction
