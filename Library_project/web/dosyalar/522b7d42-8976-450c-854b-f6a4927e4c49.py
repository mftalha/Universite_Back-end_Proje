# -*- coding: utf-8 -*-
"""
Created on Tue Aug 17 16:12:46 2021

@author: casper
"""

#doga 2 ,farklı yöntem

import cv2
import math


img = cv2.imread("doga.jpg")

img_filt_3 = cv2.imread("doga_filt_3.jpg") # 7 ,6

img_filt_4 = cv2.imread("doga_filt_4.jpg") # 4 ,5

img_filt_5 = cv2.imread("doga_filt_5.jpg") # 4 ,0

img_filt_6 = cv2.imread("doga_filt_6.jpg") # 5 

img_filt_7 = cv2.imread("doga_filt_7.jpg") # 7

img_filt_8 = cv2.imread("doga_filt_8.jpg") # 7

img_filt_9 = cv2.imread("doga_filt_9.jpg") # 7

img_filt_10 = cv2.imread("doga_filt_10.jpg") # -1

img_filt_11 = cv2.imread("doga_filt_11.jpg") # 6 

img_filt_12 = cv2.imread("doga_filt_12.jpg")  # 4

img_filt_13 = cv2.imread("doga_filt_13.jpg") #- 2

img_filt_14 = cv2.imread("doga_filt_14.jpg") #+ 5

img_filt_15 = cv2.imread("doga_filt_15.jpg") # 2

img_kopy_1 = cv2.imread("doga - Kopya.jpg") #kopya 7

img_kopy_what_1 = cv2.imread("doga_whatsap.jpeg") # 7

img_boy_1  = cv2.imread("ssd_1080x810.jpg") # 2

img_boy_2  = cv2.imread("olcek_1080x810.jpg") # 3

img_boy_3  = cv2.imread("yol_1080x810.jpg")  # 2 

img_boy_4  = cv2.imread("deneme_1_1080x810.png") # 4

img_boy_5  = cv2.imread("deneme_2_1080x810.jpg") # 4

img_boy_6  = cv2.imread("deneme_3_1080x810.jpg") # 1

img_boy_7  = cv2.imread("deneme_4_1080x810.jpg") # 4

img_1 = img

img_2 = img_filt_12

h = img_1.shape[0]
h = h/7 
y=h
h=h/5
c=h+(y/2)
y = math.floor(y)
h = math.floor(h)
c = math.floor(c)

w = img_1.shape[1]
w = w/7 
x=w 
w=w/5
v=w+(x/2)
x = math.floor(x)
w = math.floor(w)
v = math.floor(v)

konturol =0

for i in range(7):
    
    print(i,". hes =")
    
    deg_1 = img_1[h,w,0]
    deg_2 = img_1[h,w+1,0]
    deg_3 = img_2[h,w,0]        
    deg_4 = img_2[h,w+1,0]
    
    while deg_1 == 0 or deg_2 ==0 or deg_3== 0 or deg_4 ==0:
        h+=4                
        w+=4
        
        if(h >= img_1.shape[0]-1):
            h = c
        if(w >= img_1.shape[1]-1):
            w = v
            
        deg_1 = img_1[h,w,0]
        deg_2 = img_1[h,w+1,0]
        deg_3 = img_2[h,w,0]
        deg_4 = img_2[h,w+1,0]
            
        
        
    while deg_1 == deg_2 or deg_3 == deg_4 :
        
        h+=4                
        w+=4
        
        if(h>= img_1.shape[0]-1):
            h = c
        if(w >= img_1.shape[1]-1):
            w = v
            
        deg_1 = img_1[h,w,0]
        deg_2 = img_1[h,w+1,0]
        deg_3 = img_2[h,w,0]
        deg_4 = img_2[h,w+1,0]
        
        while deg_1 == 0 or deg_2 ==0 or deg_3== 0 or deg_4 ==0 :
            
            h+=4                
            w+=4
        
            if(h>= img_1.shape[0]-1):
                h = c
            if(w >= img_1.shape[1]-1):
                w = v
            
            deg_1 = img_1[h,w,0]
            deg_2 = img_1[h,w+1,0]
            deg_3 = img_2[h,w,0]
            deg_4 = img_2[h,w+1,0]
                              
        
       
    deg_1_2 = (deg_1 - deg_2) 
    
    
    deg_3_4 = (deg_3 - deg_4) 
    
    
    if deg_1_2 < 0 :
        deg_1_2*=-1
        
    if deg_3_4 < 0 :
        deg_3_4*=-1
        
    print(deg_1_2)
    print(deg_3_4)
    
    if deg_1_2 > deg_3_4 :
        sonuc = deg_1_2 - deg_3_4 
    else :
        sonuc = deg_3_4 - deg_1_2 
 
    
    if sonuc <= 2 : #0.6
        print("aynı")
        konturol =konturol+1
    else:
        print("farklı")
        
    h+=y
    w+=x
    
    if(h>= img_1.shape[0]-1):
            h = c
    if(w >= img_1.shape[1]-1):
            w = v
    
    print("")


print("")
print("")
print("konturol:",konturol,"/","7")