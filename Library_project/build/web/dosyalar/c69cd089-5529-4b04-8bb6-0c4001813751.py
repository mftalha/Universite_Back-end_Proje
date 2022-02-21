# -*- coding: utf-8 -*-
"""
Created on Tue Jun 29 18:12:01 2021

@author: casper
"""

import cv2 

rsm_n = cv2.imread("yol.jpeg")
rsm_p = cv2.imread("yol_p.jpg")
rsm_p_2 = cv2.imread("yol_p_2.jpg")
rsm_p_o_1 = cv2.imread("yol_p_o_1.jpg")




print(rsm_n.shape)


hsp_1 = (rsm_p[50,5,2] / rsm_p[50,6,2])
hsp_2 = (rsm_p_2[50,5,2] / rsm_p_2[50,6,2])

"""
print("bura")
print(rsm_p[10,5,0])
print(rsm_p[10,6,0])
"""

#print(hsp_1)
#print(hsp_2)

if hsp_1 == hsp_2:
    print("uzay")
 
  
for i in range(8):
    for j in range(700):
        
        print(rsm_p[i,j,0],end = ",")
    print(" ")
    print(" ")

print("ttt")

for i in range(1):
    for j in range(630):
        
        print(rsm_p_o_1[i,j,0],end = ",")
    print(" ")
    print(" ")


    
#hsp_1 = rsm_p[4,3,0] / rsm_p[4,4,0]
#hsp_2 = rsm_p_o_1[4,3,0] / rsm_p_o_1[4,4,0]

#print(hsp_1)
#print(hsp_2)
        