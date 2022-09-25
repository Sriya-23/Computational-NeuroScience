#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov  8 11:12:15 2021

@author: vsriya23
"""


#importing required libraries

import numpy as np
import math
import matplotlib as mp
#%%
def visualise_matrix(V_fin, i, title):
    V_fin = (V_fin + 1)/2
    V_fin = np.reshape(V_fin, (90, 100))
    mp.pyplot.figure(i)

    cmap = 'gray'
    mp.pyplot.imshow(V_fin, cmap = cmap)
    mp.pyplot.title(title)
    mp.pyplot.savefig(title+ '.png')
#%%
def Process_txtfile(title):
    file = open(title, 'r')
    lines = file.readlines()
    V_vis = np.array([line.rstrip('\n').split(',') for line in lines], dtype = np.float)
    patch = np.zeros(V_vis.shape)

    patch[1:45, 30:80] = V_vis[1:45, 30:80]
    patch = np.reshape(patch,(9000,1))
    V_fin = np.reshape(V_vis,(9000,1))
    
    return patch, V_fin
#%%

def plot_RMS(RMS, fignum, title):
    mp.pyplot.figure(fignum)
    mp.pyplot.plot(RMS)  
    
    mp.pyplot.title(title)  
    mp.pyplot.xlabel('iterations')
    mp.pyplot.ylabel('RMS')
    mp.pyplot.savefig(title + '.png')


#%%
def Run_Hopfield_Net(patch, V_fin, W, n):
    RMS = np.array([])
    #n = 50 # number of iterations
    RMS = np.array([])
    V = np.reshape(patch, (9000, 1)) # imput for learning
    lamb = 15 
    U = np.reshape(patch, (9000, 1))
    
    
    for i in range(1,n):
    
        U = U + (-U + W@V)*0.01
        V = np.reshape(np.array(list(map(math.tanh, lamb *U))), (9000,1))
        diff = (np.subtract(V_fin, V))
        sq_diff_sum = math.sqrt(np.sum(np.square(diff)))/9000
        print(sq_diff_sum)
        
        RMS = np.append(RMS, sq_diff_sum)
    
    return V, RMS
#%%


#normal
patchb, V_finb = Process_txtfile('ball.txt')
patchc, V_finc = Process_txtfile('cat.txt')
patchm, V_finm = Process_txtfile('mona.txt')

W = (V_finb @ V_finb.T + V_finc @ V_finc.T + V_finm @ V_finm.T)/9000  # according to hebbian learning rule
visualise_matrix(V_finb, 1, 'ball')
visualise_matrix(V_finc, 2, 'cat')
visualise_matrix(V_finm, 3, 'mona')

visualise_matrix(patchb, 4, 'patch_ball')
visualise_matrix(patchc, 5, 'patch_cat')
visualise_matrix(patchm, 6, 'patch_mona')



Vball_learnt, RMS_ball = Run_Hopfield_Net(patchb, V_finb, W, 50)
Vcat_learnt, RMS_cat= Run_Hopfield_Net(patchc, V_finc, W, 50)
Vmona_learnt, RMS_mona = Run_Hopfield_Net(patchm, V_finm, W, 50)

visualise_matrix(Vball_learnt, 7, 'Ball_network_pred')
visualise_matrix(Vcat_learnt, 8, 'Cat_network_pred')
visualise_matrix(Vmona_learnt, 9, 'Mona_network_pred')

plot_RMS(RMS_ball, 10, 'ball_RMS')
plot_RMS(RMS_cat, 11, 'cat_RMS')
plot_RMS(RMS_mona, 12, 'mona_RMS')

# 25%
in_25 = np.random.permutation(range(9000*9000))[:int(0.25*9000*9000)]

W_lin = np.reshape(W, (9000*9000, 1))

for i in range(0, len(in_25)):
    W_lin[in_25[i]] = 0
W_25 = np.reshape(W_lin, (9000, 9000))
Vb_25, RMSb_25 = Run_Hopfield_Net(patchb, V_finb, W_25, 100)
Vc_25, RMSc_25 = Run_Hopfield_Net(patchc, V_finc, W_25, 100)
Vm_25, RMSm_25 = Run_Hopfield_Net(patchm, V_finm, W_25, 100)


visualise_matrix(Vb_25, 13, 'ball_pred_25')
visualise_matrix(Vc_25, 14, 'cat_pred_25')
visualise_matrix(Vm_25, 15, 'mona_pred_25')


plot_RMS(RMSb_25, 16, 'RMS_ball_25')
plot_RMS(RMSc_25, 17, 'RMS_cat_25')
plot_RMS(RMSm_25, 18, 'RMS_mona_25')

#50%

in_50 = np.random.permutation(range(9000*9000))[:int(0.5*9000*9000)]

W_lin = np.reshape(W, (9000*9000, 1))

for i in range(0, len(in_50)):
    W_lin[in_50[i]] = 0
W_50 = np.reshape(W_lin, (9000, 9000))

Vb_50, RMSb_50 = Run_Hopfield_Net(patchb, V_finb, W_50, 100)
Vc_50, RMSc_50 = Run_Hopfield_Net(patchc, V_finc, W_50, 100)
Vm_50, RMSm_50 = Run_Hopfield_Net(patchm, V_finm, W_50, 100)


visualise_matrix(Vb_50, 19, 'ball_pred_50')
visualise_matrix(Vc_50, 20, 'cat_pred_50')
visualise_matrix(Vm_50, 21, 'mona_pred_50')

plot_RMS(RMSb_50, 22, 'RMS_ball_50')
plot_RMS(RMSc_50, 23, 'RMS_cat_50')
plot_RMS(RMSm_50, 24, 'RMS_mona_50')



# 80%
in_80 = np.random.permutation(range(9000*9000))[:int(0.8*9000*9000)]

W_lin = np.reshape(W, (9000*9000, 1))

for i in range(0, len(in_50)):
    W_lin[in_80[i]] = 0
W_80 = np.reshape(W_lin, (9000, 9000))


Vb_80, RMSb_80 = Run_Hopfield_Net(patchb, V_finb, W_80, 100)
Vc_80, RMSc_80 = Run_Hopfield_Net(patchc, V_finc, W_80, 100)
Vm_80, RMSm_80 = Run_Hopfield_Net(patchm, V_finm, W_80, 100)


visualise_matrix(Vb_80, 25, 'ball_pred_80')
visualise_matrix(Vc_80, 26, 'cat_pred_80')
visualise_matrix(Vm_80, 27, 'mona_pred_80')


plot_RMS(RMSb_80, 28, 'RMS_ball_80')
plot_RMS(RMSc_80, 29, 'RMS_cat_80')
plot_RMS(RMSm_80, 30, 'RMS_mona_80')