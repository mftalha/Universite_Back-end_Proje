# -*- coding: utf-8 -*-
"""
Created on Wed Aug 18 16:43:45 2021

@author: casper
"""

#histogram en son hal ***

import cv2
import numpy as np

img_1 = cv2.imread("deneme_2.jpg")
img_2 = cv2.imread("deneme_1_940x470.png")

h_1 = img_1.shape[0]
w_1 = img_1.shape[1]

h_2 = img_2.shape[0]
w_2 = img_2.shape[1]


d_1 = np.zeros(256)
d_2 = np.zeros(256)
d_3 = np.zeros(256)
d_4 = np.zeros(256)

toplam = 256
kontrol_2 = 0


x = h_1 * w_1
y = h_2 * w_2

if y > x:
    sonuc = y / x
else :
    sonuc = x / y        


for i in range(h_1):
    for j in range(w_1):
           a=img_1[i,j,0]
           d_1[a]+=1
           #toplam_1+=1
           

for i in range(h_2):
    for j in range(w_2):
           a=img_2[i,j,0]
           d_2[a]+=1
           #toplam_2+=1
          
for i in range(len(d_1)): #d.size
    if d_1[i] == 0 or d_2[i] == 0 :  
        if(y > x) :
            d_1[i] = 10
            d_2[i] = 350
        else :
            d_1[i] = 350
            d_2[i] = 10
            
        toplam-=1
        
    
    if y > x:
        d_3[i] = d_2[i] / d_1[i]
    else :
        d_3[i] = d_1[i] / d_2[i]
    
        
    z = sonuc - d_3[i]
    if z < 0:
        z*= -1
    if z < 0.7:
        kontrol_2+=1
    
                  
print("sonuc =",kontrol_2,"/",toplam)

oran=toplam / kontrol_2
print(oran)

if(oran < 1.5):
    print("aynı foto")
else :
    print("farklı foto")