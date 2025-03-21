
### Prenote

This file will contain the various files I've encountered and how to access them easily in python
The file will also contain new and crazy files as well.


- h5 files : These are gene expression matrix files that are similar to a dictionary and can be loaded as such
    These have extensions .h5
    to read these we can use the h5py library
    '''
    import h5py
    f = h5py.File("/Users/ramprakash/development/bioinformatics/playground/scanpy_loader/data/V1_Human_Lymph_Node/filtered_feature_bc_matrix.h5", 'r')
    print(f.keys())
    '''

- parquet files
    extension - .parquet
    structure is similar to a csv, but used because it is much more optimized
    to read and convert parquet files to csv
    '''
    import pandas as pd
    df = pd.read_parquet('filename.parquet')
    df.to_csv('filename.csv')
    '''

