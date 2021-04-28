import torch
import numpy as np
from os.path import dirname, join as pjoin
import scipy.io as sio
import os
from collections import defaultdict

# class MyDataset(Dataset):
#     """custom dataset for .mat images"""
#
#     def __init__(self, list_of_urls):
#         self.list_of_urls = list_of_urls
#
#     def __len__(self):
#         return len(self.list_of_urls)
#
#     def __getitem__(self, index):
#         image_url = self.list_of_urls[index]
#         image = scipy.io.loadmat(image_url)
#         label = ...
#         ...
class EmgMatDataset(Dataset):
    """Create custom dataset from .mat files"""

    def __init__(self, path_of_root):
        path_check = os.listdir(path_of_root)
        assert len(path_check) != 0, "The path for data loader must not empty! Please check your path"
        self.root_path = path_of_root

    def label(self, class):
        self.label_list = class

    def matloader(self, variable_name):
        assert type(variable_name) == str, 'The name of MATLAB matrix must be a string'
        assert type(self.label_list) == list, 'The label must be wrapped as list'
        assert len(self.label_list) != 0, "The list for labels must be provided!"
        #create an empty dictionay with labels as the key
        pool = {key: [] for key in self.label_list}
        root = sorted(os.listdir(self.root_path))
        for i in range(len(root)):
            train_path = path1 + root[i]
            for files in sorted(os.listdir(train_path)):
                EMG = sio.loadmat(train_path + '/' + files)
                data = EMG[variable_name]
                pool[list(pool)[i]].append(data)
        return pool
