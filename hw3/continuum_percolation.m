%[p_largest theta] = continuum_percolation(pts,radius,plot_flag) outputs
% the probability to belong to the largest cluster (p_largest) and the
% percolation probability (theta). The inputs are the nodes coordinates 
%(pts in meters) and the communication range (m).
% If the plot flag == 1, The largest cluster is plotted.
% NB the radius is assuned to be larger than 1!!!
% Course: Networks out of Control, EPFL.
% Date : May 2016

function  [p_largest theta] = continuum_percolation(pts,radius,plot_flag)
n = length(pts); %nb of pts

%Distances matrix
D = pdist(pts,'euclidean');
D(D<radius) = 1;
D(D>radius) = 0;

%Adjacency matrix
A = sparse(squareform(D));

%Largest Component
[ci sizes] = components(A);
[size_largest_cluster id_largest_cluster] = max(sizes);
p_largest = size_largest_cluster/(n);

% Path existence
[c index_most_l_node] = min(pts(:,1));
[c index_most_r_node] = max(pts(:,1));
index = find(ci==id_largest_cluster);% Index of the nodes/sites belonging to the largest cluster
path = ~isempty(find(index==index_most_l_node,1))& ~isempty(find(index==index_most_r_node,1));

% Percolation probability
theta = p_largest*path;

%Plot
if(plot_flag)
plot(pts(:,1),pts(:,2),'b.',pts(index,1),pts(index,2),'r.')
end

end
