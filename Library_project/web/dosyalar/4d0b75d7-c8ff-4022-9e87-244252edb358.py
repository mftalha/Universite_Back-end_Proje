# -*- coding: utf-8 -*-
"""
Created on Sun Aug  8 18:05:20 2021

@author: casper
"""

import cv2
import numpy as np
 
img = cv2.imread('boyut_100.jpg')
bicübik_deme = cv2.imread('boyut_200.png')


bicubic_img = cv2.resize(img,None, fx = 10, fy = 10, interpolation = cv2.INTER_CUBIC)
#bicubic_img = cv2.resize(img,None, fx = 10, fy = 10, interpolation = cv2.INTER_BITS)

for i in range(3):
    for j in range(3):
        print(bicübik_deme[i,j],end =",")
    print("")
    
print("sssssss")

for i in range(3):
    for j in range(3):
        print(bicubic_img[i,j],end =",")
    print("")