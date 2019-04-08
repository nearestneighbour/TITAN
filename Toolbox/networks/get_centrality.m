function cent = get_centrality(mat,paths)
%% Get network betweenness centrality
% For every node calculate the 'betweenness centrality', a measure to
% determine how important the role of a node is in the global network
% structure.
% 
% cent = get_centrality(mat,paths)
% 
% Input:
% mat:      network matrix
% paths:    (optional) cell array with shortest paths, will be computed if
%           missing
% 
% Output:
% cent:     array of centrality values for each node

n = size(mat,1);
if nargin==1
    disp('Computing shortest paths...');
    for i = 1:n
        [~,paths(i,:)] = shortestpath(1./mat,i);
    end
end
cent = zeros(1,n);

for i = 1:n
    for j = 1:n
        paths{i,j} = paths{i,j}(2:end-1);
        cent(paths{i,j}) = cent(paths{i,j}) + 1;
    end
end
cent = cent / (n^2 - n); % Normalize
