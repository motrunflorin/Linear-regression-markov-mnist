function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Link -> the link matrix associated to the given labyrinth

  % TODO: get_link_matrix implementation


  Adj = get_adjacency_matrix(Labyrinth);

  nodes_len = size(Adj, 1);
  Link = zeros(nodes_len);

  for i = 1:nodes_len

      neighs = find(Adj(i, :));
      neighs_len = length(neighs);

      if neighs_len > 0
         Link(i, neighs) = 1 / neighs_len;
        end
  end

endfunction
