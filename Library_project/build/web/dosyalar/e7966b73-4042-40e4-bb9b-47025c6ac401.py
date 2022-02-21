# -*- coding: utf-8 -*-
"""
Created on Fri Jun 25 09:49:55 2021

@author: casper
"""


import cv2

resim = cv2.imread('doga.jpg')
resim_2 = cv2.imread('doga - Kopya.jpg')
resim_3 = cv2.imread('doga_whatsap.jpeg')


h = resim.shape[0]
w = resim.shape[1]

d_1 = []
d_2 = []

for i in range(2,3):
    for j in range(3,6):
        #print(resim[i,j,0])
        #print(resim_2[i,j,0])
        print(resim_3[i,j,0])
        
        
        d_1.append(resim[i,j,0])  #256 bölmeye gerek yok
        d_2.append(resim_2[i,j,0])
        

hesap_1 = d_1[0] / d_1[1]
hesap_2 = d_2[0] / d_2[1]

if hesap_1 == hesap_2:
    print("aynı")
    

# roi = img1[310:370 ,272:330] # 310:370 y ekseni , 272:330 x ekseni
    
"""

-Not : Normal mantıkta red,green,blue geçerli iken görüntü işleme alanında BGR (blue,green,red) geçerlidir.
       Bu yüzden değer olarak; blue ➡️0 , green ➡️ 1 ,red ➡️ 2'yi temsil etmektedir. 
       

-resmi gri yapmak için : cv2.imread('cicek.png',0)

- (Y , X) 
-resmin bir bölmünün alınması : ve fotografta başka bir bölgeye eklenmesi   
    img1[310:390,172:230] = ROI
    cv2.imshow('resim', img1)
    cv2.waitkey(0)
    cv2.destroyAllWindows()
    
    
"""
    
 