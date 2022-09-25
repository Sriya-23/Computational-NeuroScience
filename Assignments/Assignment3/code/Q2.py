#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov  8 09:52:29 2021

@author: vsriya23
"""
#importing required libraries

import numpy as np
import math
import matplotlib as mp


#%%
def visualise_matrix(V_fin, i, title):
    V_fin = (V_fin + 1)/2
    mp.pyplot.figure(i)

    cmap = 'gray'
    mp.pyplot.imshow(V_fin, cmap = cmap)
    # mp.pyplot.savefig(title)
    

#%%
#Processing the text file to create V array and W matrix


file = open('ball.txt', 'r')

lines = file.readlines()

V_vis = np.array([line.rstrip('\n').split(',') for line in lines], dtype = np.int32)



patch = np.zeros(V_vis.shape)

patch[1:40, 40:80] = V_vis[1:40, 40:80]

V_fin = np.reshape(V_vis,(9000,1))

visualise_matrix(patch, 1, 'Q2_patch')
n = 50 # number of iterations
RMS = np.array([])
V = np.reshape(patch, (9000, 1)) # imput for learning
lamb = 15 
q = V_fin.T
W = V_fin @ V_fin.T/9000  # according to hebbian learning rule

visualise_matrix(V_vis, 2, 'Q2_ball')
U = np.reshape(patch, (9000, 1))


#using discrete hopfield network
for i in range(1,n):
    
    U = U + (-U + W@V)*0.01
    V = np.reshape(np.array(list(map(math.tanh, lamb *U))), (9000,1))
    diff = (np.subtract(V_fin, V))
    sq_diff_sum = math.sqrt(np.sum(np.square(diff)))/9000
    print(sq_diff_sum)
    
    RMS = np.append(RMS, sq_diff_sum)
    
        
    
V_learnt = np.reshape(V, V_vis.shape)

visualise_matrix(V_learnt, 3, 'Q2_ball_prediction.png')

mp.pyplot.figure(4)
mp.pyplot.plot(RMS)  

mp.pyplot.title('RMS')  
mp.pyplot.xlabel('iterations')
mp.pyplot.ylabel('RMS')