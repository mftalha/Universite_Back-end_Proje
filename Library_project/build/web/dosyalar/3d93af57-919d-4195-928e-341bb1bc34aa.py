# -*- coding: utf-8 -*-
"""
Created on Sun Aug 15 16:29:38 2021

@author: casper
"""

import cv2 

import math


img = cv2.imread("doga.jpg")

img_filt_3 = cv2.imread("doga_filt_3.jpg")

img_filt_4 = cv2.imread("doga_filt_4.jpg")

img_filt_5 = cv2.imread("doga_filt_5.jpg")

img_filt_6 = cv2.imread("doga_filt_6.jpg")

img_filt_7 = cv2.imread("doga_filt_7.jpg")

img_filt_8 = cv2.imread("doga_filt_8.jpg")

img_filt_9 = cv2.imread("doga_filt_9.jpg")

img_filt_10 = cv2.imread("doga_filt_10.jpg") #-

img_filt_11 = cv2.imread("doga_filt_11.jpg")

img_filt_12 = cv2.imread("doga_filt_12.jpg")  #5

img_filt_13 = cv2.imread("doga_filt_13.jpg") #-

img_filt_14 = cv2.imread("doga_filt_14.jpg") #+   5

img_filt_15 = cv2.imread("doga_filt_15.jpg")

img_kopy_1 = cv2.imread("doga - Kopya.jpg") #kopya 

img_kopy_what_1 = cv2.imread("doga_whatsap.jpeg")

img_boy_1  = cv2.imread("ssd_1080x810.jpg")

img_boy_2  = cv2.imread("olcek_1080x810.jpg")

img_boy_3  = cv2.imread("yol_1080x810.jpg")

img_boy_4  = cv2.imread("deneme_1_1080x810.png")

img_boy_5  = cv2.imread("deneme_2_1080x810.jpg") #

img_boy_6  = cv2.imread("deneme_3_1080x810.jpg")

img_boy_7  = cv2.imread("deneme_4_1080x810.jpg") #

img_1 = img_boy_1

img_2 = img_boy_3


h = img_1.shape[0]
h = h/7 
y=h
h=h/5
y = math.floor(y)
h = math.floor(h)


w = img_2.shape[1]
w = w/7 
x=w 
w=w/5
x = math.floor(x)
w = math.floor(w)

konturol =0

print("")

for i in range(7):
    
    deg_1 = img_1[h,w,0]
    while deg_1 == 0:   #deg_1 = 0 sa a,b değerlerini değiştiriyorum,sonra deg_1 değerini güncelliyorum
        h+=4
        w+=4
        deg_1 = img_1[h,w,0]
        
    deg_2 = img_1[h,w+1,0]
    while deg_2 == 0: #deg_2 = 0 sa a,b değ. değiştirip ,deg_1 ve deg_2 değerlerini güncelliyorum
        h+=4
        w+=4
        deg_1 = img_1[h,w,0]
        deg_2 = img_1[h,w+1,0]
           
    
    while deg_1 == deg_2:   #deg_1,deg_2 aynı oldugunda 1 çıkıyor ve diğer resimde düzse ondada 1 çıkıp 
        h+=4                #aynı oranlardan benzer diyor , resimler aynı olmasada
        w+=4
        deg_1 = img_1[h,w,0]
        deg_2 = img_1[h,w+1,0]
        
    deg_1_2 = deg_1 / deg_2

    print(i,". hes =")
    print(deg_1_2)

    deg_3 = img_2[h,w,0]
    if deg_3 == 0:
        deg_3 = 0.0100
        
    deg_4 = img_2[h,w+1,0]
    if deg_4 == 0:
        deg_4 = 0.0001
    deg_3_4 = deg_3 / deg_4
    
    #print("deg_3",deg_3)
    #print("deg_4",deg_4)
    print(deg_3_4)

    
    
    if deg_1_2 > deg_3_4 :
        sonuc = deg_1_2 - deg_3_4 
    else :
        sonuc = deg_3_4 - deg_1_2 
 
    if sonuc <= 0.16 : #0.6
        print("aynı")
        konturol =konturol+1
    else:
        print("farklı")
        
    h+=y
    w+=x
    
    print("")

print("")
print("")
print("konturol:",konturol,"/","7")

