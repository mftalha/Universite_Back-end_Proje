# -*- coding: utf-8 -*-
"""
Created on Mon Aug 23 14:52:44 2021

@author: casper
"""

"""
Created on Mon Aug 23 11:04:41 2021

@author: casper
"""

# main 6. reform  , piksel en son hal *** ,kontrol_7

import cv2
import math
import numpy as np

img_a = cv2.imread("doga.jpg")#b,1

img_b = cv2.imread("main_1_940x470.jpg")#a, 

img_filt_3 = cv2.imread("doga_filt_3.jpg") # 6 ,6 ,7 
  
img_filt_4 = cv2.imread("doga_filt_4.jpg") # 5 ,5 ,6

img_filt_5 = cv2.imread("doga_filt_5.jpg") # 7 ,7 ,7

img_filt_6 = cv2.imread("doga_filt_6.jpg") # 6 ,6 ,5

img_filt_7 = cv2.imread("doga_filt_7.jpg") # 7 ,5 ,6

img_filt_8 = cv2.imread("doga_filt_8.jpg") # 7 ,3 ,5

img_filt_9 = cv2.imread("doga_filt_9.jpg") # 7 ,6 ,7 

img_filt_10 = cv2.imread("doga_filt_10.jpg") # 0 ,0 ,3  # siyah beyazımsı

img_filt_11 = cv2.imread("doga_filt_11.jpg") # 7 ,4 ,7 #3,alg2 ok

img_filt_12 = cv2.imread("doga_filt_12.jpg")  # 6 ,6 ,5 #-

img_filt_13 = cv2.imread("doga_filt_13.jpg") # 5 ,1 ,6 #1

img_filt_14 = cv2.imread("doga_filt_14.jpg") # 4 ,2 ,1  # aşırı bulanık

img_filt_15 = cv2.imread("doga_filt_15.jpg") # 0 ,0 ,0  # siyah beyazımsı

img_kopy_1 = cv2.imread("doga - Kopya.jpg") #kopya 7 ,7 ,7

img_kopy_what_1 = cv2.imread("doga_whatsap.jpeg") # 7 ,7 ,7

img_filt_16 = cv2.imread("main_1_filt_1.jpg")  # 

img_filt_17 = cv2.imread("main_1_filt_2.jpg")  # 

img_filt_18 = cv2.imread("main_1_filt_3.jpg")  # 

img_filt_19 = cv2.imread("main_1_filt_4.jpg")  # 

img_filt_20 = cv2.imread("main_1_filt_5.jpg")  # 

img_filt_21 = cv2.imread("main_1_filt_6.jpg")  # 


img_boy_1  = cv2.imread("deneme_1_940x470.png")# 1

img_boy_2  = cv2.imread("deneme_2_940x470.jpg")# 3 
 
img_boy_3  = cv2.imread("deneme_3_940x470.jpg")# 5

img_boy_4  = cv2.imread("deneme_4_940x470.jpg")# 

img_boy_5  = cv2.imread("yol_940x470.jpg")# 7

img_boy_6  = cv2.imread("olcek_940x470.jpg")# 9  

img_boy_7  = cv2.imread("ssd.jpeg")# 11

img_boy_8  = cv2.imread("boyut.jpg") # 

img_boy_9  = cv2.imread("deneme_5.jpeg")#2 

img_boy_10  = cv2.imread("deneme_6.jpg")# 

img_boy_11  = cv2.imread("deneme_7.jpg")# 

img_boy_12  = cv2.imread("deneme_8.jpg")# 

img_boy_13  = cv2.imread("deneme_9.jpg") # 

img_boy_14  = cv2.imread("deneme_10.jpg")#

img_boy_15  = cv2.imread("deneme_11.jpg")#

img_boy_16  = cv2.imread("doga.jpg")#


img_olc_1  = cv2.imread("deneme_1_1080x810.png")#1

img_olc_2  = cv2.imread("deneme_1.png")#

img_olc_3  = cv2.imread("deneme_2.jpg")#2

img_olc_4  = cv2.imread("deneme_2_1080x810.jpg")#

img_olc_5  = cv2.imread("deneme_3_1080x810.jpg")#3

img_olc_6  = cv2.imread("deneme_3.jpg")#

img_olc_7  = cv2.imread("yol.jpeg")#5

img_olc_8  = cv2.imread("yol_1080x810.jpg")#

img_olc_9  = cv2.imread("olcek.jpg")#6

img_olc_10  = cv2.imread("olcek_1080x810.jpg")#

img_olc_11  = cv2.imread("ssd_940x470.png")#7

img_olc_12  = cv2.imread("ssd_1080x810.jpg")#



img_1 = img_boy_7                    # donus_max = 254 , his_f = 1.7083333333333333
img_2 = img_olc_11 #0.17 sıkıntı         # his_a = 2.190909090909091


#doga.jpg
z= 200
donus_sınır = 0
donus = 0
olcut = 1.7
pp=0

h_1 = img_1.shape[0]
w_1 = img_1.shape[1]

h_2 = img_2.shape[0]
w_2 = img_2.shape[1]

if h_1 > z:
    n_0 =  z / h_1         
else :
    n_0 = h_1 / z  
 
    
if w_1 > z:
    n_1 = z / w_1    
else :
    n_1 = w_1 / z    
 
    
if h_2 > z:
    m_0 = z / h_2      
else :
    m_0 = h_2 / z    
    
 
if w_2 > z:
    m_1 = z / w_2      
else :
    m_1 = w_2 / z

img_1 = cv2.resize(img_1,None, fx = n_1 , fy = n_0, interpolation = cv2.INTER_CUBIC)

img_2 = cv2.resize(img_2,None, fx = m_1, fy = m_0, interpolation = cv2.INTER_CUBIC)

img_1 = cv2.cvtColor(img_1, cv2.COLOR_BGR2GRAY)  

img_2 = cv2.cvtColor(img_2, cv2.COLOR_BGR2GRAY)

h = img_1.shape[0]
h = h/5 
y=h+3
h=h/5
c=h+(y/2)
y = math.floor(y)
h = math.floor(h)
c = math.floor(c)

w = img_1.shape[1]
w = w/5 
x=w +3
w=w/5
v=w+(x/2)
x = math.floor(x)
w = math.floor(w)
v = math.floor(v)


konturol =0

i=0 #bu harfleri değiş forlarda kullanılıyor sıkıntı
j=0

while i < 5:
    
    print(i,". hes =")
    
    deg_1 = img_1[h,w]
    deg_2 = img_1[h,w+1]
    deg_3 = img_2[h,w]        
    deg_4 = img_2[h,w+1]
    
    
    if deg_1 > deg_2:
        n = deg_1
        m = deg_2
            
    else :
        n = deg_2
        m = deg_1
    
    if deg_3 > deg_4:
        k = deg_3
        l = deg_4
    else :
        k = deg_4
        l = deg_3
        
    while (n - m < 1 or k - l < 1) or (deg_1 == 0 or deg_2 ==0 or deg_3== 0 or deg_4 ==0) or (n - m < 55 and k - l < 55) :
        
        h+=7+i                
        w+=7+i
        
        if(h>= img_1.shape[0]-1):
            h = c+i
        if(w >= img_1.shape[1]-1):
            w = v+i
            
        deg_1 = img_1[h,w]
        deg_2 = img_1[h,w+1]
        deg_3 = img_2[h,w]
        deg_4 = img_2[h,w+1]
                        
        #print("ss")       
        if deg_1 > deg_2:
            n = deg_1
            m = deg_2
            
        else :
            n = deg_2
            m = deg_1
        
        if deg_3 > deg_4:
            k = deg_3
            l = deg_4
        else :
            k = deg_4
            l = deg_3  
            
        donus+=1        
        
        if donus > 51:
            n=90
            m=20
            k=90
            l=20
            
            deg_1 =35
            deg_2 =10
            deg_3 =22
            deg_4 =50
            
            i=10
     
    if i != 10:
        deg_1_2 = deg_1 / deg_2    
        print(deg_1_2)
    
        deg_3_4 = deg_3 / deg_4
        print(deg_3_4)
    
    
        if deg_1_2 > deg_3_4 :
            sonuc = deg_1_2 - deg_3_4 
        else :
            sonuc = deg_3_4 - deg_1_2 
      
    
        print("sonuc =", sonuc)
        if sonuc <= 0.26 : #0.1 #15
            print("aynı")
            konturol += 1
        else:
            print("farklı")
        
        h+=y+i
        w+=x+i
    
        if(h >= img_1.shape[0]-1):
            h = c+i
        if(w >= img_1.shape[1]-1):
            w = v+i
        i+=1
        j+=1
        
    print("")

if  donus > 51 and ( (j ==5 and (konturol == 0 or konturol == 1 or konturol == 2 or konturol == 3 )) or (j ==4 and (konturol ==0 or konturol ==1 or konturol ==2  )) or (j == 3 and (konturol ==0 or konturol ==1 )) or (j ==2 and (konturol ==0 )) )  :
    
    donus = 2
    print("alg_1_ek, donus = ",donus)
    print("konturol:",konturol,"/",j)
    print("farklı")
    konturol = 0
    pp = 1   #2. alg elife girmesin diye çözüm ara


print("")
print("")


if donus > 51 or konturol == 3 :
   
    print("alg_2, donus =",donus)    
    print("j =" ,j)
    print("kontrol =",konturol)
    
    h_1 = img_1.shape[0]
    w_1 = img_1.shape[1]

    h_2 = img_2.shape[0]
    w_2 = img_2.shape[1]

    d_1 = np.zeros(256)
    d_2 = np.zeros(256)
    d_3 = np.zeros(256)

    toplam = 256
    kontrol_2 = 0

    for i in range(h_1):
        for j in range(w_1):
            a=img_1[i,j]
            d_1[a]+=1
            #toplam_1+=1
           

    for i in range(h_2):
        for j in range(w_2):
            a=img_2[i,j]
            d_2[a]+=1
            #toplam_2+=1
          
    for i in range(len(d_1)): #d.size
        if d_1[i] == 0 or d_2[i] == 0 :  
        
            d_1[i] = 10
            d_2[i] = 350
                  
            toplam-=1
            
        d_3[i] = d_2[i] / d_1[i]
    
        
        z = 1 - d_3[i]
    
        if  -0.7 < z < 0.7:
            kontrol_2+=1
    
                  
    print("sonuc =",kontrol_2,"/",toplam)

    oran=toplam / kontrol_2
    print(oran)

    if(oran < olcut):
        print("aynı foto")
    else :
        print("farklı foto")
        
elif pp ==0  :        
    print("donus = ",donus)
    print("konturol:",konturol,"/","5")
    


"""

(n - m < 17 and k - l < 17) or 

(n - m < 4 or k - l < 4) or

"""