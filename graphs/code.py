


# here I'll add some useful code blocks that helped me with constructing and exploring graphs



#This is the base for constructing a graph in pytorch


# https://pytorch-geometric.readthedocs.io/en/latest/get_started/introduction.html

import torch
from torch_geometric.data import Data

# Define node features
node_features = torch.tensor([[1, 2], [3, 4], [5, 6]], dtype=torch.float)

# Define edge indices
edge_index = torch.tensor([[0, 1, 1, 2], [1, 0, 2, 1]], dtype=torch.long)

# Create the graph
data = Data(x=node_features, edge_index=edge_index)

print(data)
