# -*- coding: utf-8 -*-
"""
Created on Wed Aug 25 17:16:29 2021

@author: casper
"""
#•son çalışan

#5
# gri tonlamada  tekli de , efect çogunluk tamam ,alg_2 histogram if (t >= 3(2 ydi) and t - konturol == 1) : kaldırdım  
        
# alg_1 == resim aynı =  (t > 2 and t - konturol <= 1):    güncelleme

import cv2
#import math
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


e = 0

if e == 0:

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
    
    img_boy_17  = cv2.imread("r_1.jpg")#
    
    img_boy_18  = cv2.imread("r_2.jpg")#
    
    img_boy_19  = cv2.imread("r_3.jpg")#
    
    img_boy_20  = cv2.imread("r_4.jpg")#
    
    img_boy_21  = cv2.imread("r_5.jpg")#
    
    img_boy_22  = cv2.imread("r_6.jpg")#
    
    img_boy_23  = cv2.imread("r_7.jpg")#
    
    img_boy_24  = cv2.imread("r_8.jpg")#
    
    img_boy_25  = cv2.imread("r_9.jpg")#
    
    img_boy_26  = cv2.imread("r_10.jpg")#
    
    img_boy_27  = cv2.imread("r_11.jpg")#
    
    img_boy_28  = cv2.imread("r_12.jpg")#
    
    img_boy_29  = cv2.imread("r_13.jpg")#
    
    img_boy_30  = cv2.imread("r_14.jpg")#
    
    img_boy_31  = cv2.imread("r_15.jpg")#
    
    img_boy_32  = cv2.imread("r_16.jpg")#
    
    img_boy_33  = cv2.imread("r_17.jpg")#
    
    img_boy_34  = cv2.imread("r_18.jpg")#
    
    img_boy_35  = cv2.imread("r_19.jpg")#
    
    img_boy_36  = cv2.imread("r_20.jpg")#
    
    img_boy_37  = cv2.imread("r_21.jpg")#
    
    img_boy_38  = cv2.imread("r_22.jpg")#
    
    img_boy_39  = cv2.imread("r_23.jpg")#
    
    img_boy_40  = cv2.imread("r_24.jpg")#
    
    img_boy_41  = cv2.imread("r_25.jpg")#
    
    img_boy_42  = cv2.imread("r_26.jpg")#
    
    img_boy_43  = cv2.imread("r_27.jpg")#
    
    img_boy_44  = cv2.imread("r_28.jpg")#
    
    img_boy_45  = cv2.imread("r_29.jpg")#
    
    img_boy_46  = cv2.imread("r_30.jpg")#
    
    img_boy_47  = cv2.imread("r_31.jpg")#
    
    img_boy_48  = cv2.imread("r_32.jpg")#
    
    img_boy_49  = cv2.imread("r_33.jpeg")#
    
    img_boy_50  = cv2.imread("r_34.jpg")#
    
    img_boy_51  = cv2.imread("r_35.jpg")#
    
    img_boy_52  = cv2.imread("r_36.jpg")#
    
    img_boy_53  = cv2.imread("r_37.jpg")#
    
    img_boy_54  = cv2.imread("r_38.jpg")#
    
    img_boy_55  = cv2.imread("r_39.jpg")#
    
    img_boy_56  = cv2.imread("r_40.jpg")#
    
    img_boy_57  = cv2.imread("r_41.jpeg")#
    
    img_boy_58  = cv2.imread("r_42.jpg")#
    
    img_boy_59  = cv2.imread("r_43.jpg")#
    
    img_boy_60  = cv2.imread("r_44.jpg")#
    
    img_boy_61  = cv2.imread("r_45.jpg")#
    
    img_boy_62  = cv2.imread("r_46.jpg")#
    
    img_boy_63  = cv2.imread("r_47.jpg")#
    
    img_boy_64  = cv2.imread("r_48.jpg")#
    
    img_boy_65  = cv2.imread("r_49.jpg")#
    
    img_boy_66  = cv2.imread("r_50.jpg")#
    
    img_boy_67  = cv2.imread("r_51.jpg")#
    
    img_boy_68  = cv2.imread("r_52.jpg")#
    
    img_boy_69  = cv2.imread("r_53.jpg")#
    
    img_boy_70  = cv2.imread("r_54.jpg")#
    
    img_boy_71  = cv2.imread("r_55.jpg")#
    
    img_boy_72  = cv2.imread("r_56.jpg")#
    
    img_boy_73  = cv2.imread("r_57.jpg")#
    
    img_boy_74  = cv2.imread("r_58.jpg")#
    
    img_boy_75  = cv2.imread("r_59.jpg")#
    
    img_boy_76  = cv2.imread("r_60.jpg")#
    
    img_boy_77  = cv2.imread("r_61.jpg")#
    
    img_boy_78  = cv2.imread("r_62.jpg")#
    
    img_boy_79  = cv2.imread("r_63.jpg")#
    
    img_boy_80  = cv2.imread("r_64.jpg")#
    
    img_boy_81  = cv2.imread("r_65.jpg")#
    
    img_boy_82  = cv2.imread("r_66.jpg")#
    
    img_boy_83  = cv2.imread("r_67.jpg")#
    
    img_boy_84  = cv2.imread("r_68.jpg")#
    
    img_boy_85  = cv2.imread("r_69.jpg")#
    
    img_boy_86  = cv2.imread("r_70.jpg")#
    
    img_boy_87  = cv2.imread("r_71.jpg")#
    
    img_boy_88  = cv2.imread("r_72.jpg")#
    
    img_boy_89  = cv2.imread("r_73.jpg")#
    
    img_boy_90  = cv2.imread("r_74.jpg")#
    
    img_boy_91  = cv2.imread("r_75.jpg")#
    
    img_boy_92  = cv2.imread("r_76.jpg")#
    
    img_boy_93  = cv2.imread("r_77.jpg")#
    
    img_boy_94  = cv2.imread("r_78.jpg")#
    
    img_boy_95  = cv2.imread("r_79.png")#
    
    img_boy_96  = cv2.imread("r_80.png")#
    
    img_boy_97  = cv2.imread("r_81.jpg")#
    
    img_boy_98  = cv2.imread("r_82.jpg")#
    
    img_boy_99  = cv2.imread("r_84.jpg")#
    
    img_boy_100  = cv2.imread("r_85.jpg")#
    
    img_boy_101  = cv2.imread("r_86.jpg")#
    
    img_boy_102  = cv2.imread("r_87.jpg")#
    
    img_boy_103  = cv2.imread("r_88.jpg")#
    
    img_boy_104  = cv2.imread("r_89.jpg")#
    
    img_boy_105  = cv2.imread("r_90.jpg")#
    
    img_boy_106  = cv2.imread("r_91.jpg")#
    
    img_boy_107  = cv2.imread("r_92.jpg")#
    
    img_boy_108  = cv2.imread("r_93.jpg")#
    
    img_boy_109  = cv2.imread("r_94.jpg")#
    
    img_boy_110  = cv2.imread("r_95.jpg")#
    
    img_boy_111  = cv2.imread("r_96.jpg")#
    
    img_boy_112  = cv2.imread("r_97.jpg")#
    
    img_boy_113  = cv2.imread("r_98.png")#
    
    img_boy_114  = cv2.imread("r_99.jpg")#
    
    img_boy_115  = cv2.imread("r_100.jpg")#
    
    img_boy_116  = cv2.imread("r_101.jpg")#
    
    img_boy_117  = cv2.imread("r_102.jpg")#
    
    img_boy_118  = cv2.imread("r_103.jpg")#
    
    img_boy_119  = cv2.imread("r_104.jpg")#
    
    img_boy_120  = cv2.imread("r_105.jpg")#
    
    img_boy_121  = cv2.imread("r_106.jpg")#
    
    img_boy_122  = cv2.imread("r_107.jpg")#
    
    img_boy_123  = cv2.imread("r_108.jpg")#
    
    img_boy_124  = cv2.imread("r_109.jpg")#
    
    img_boy_125  = cv2.imread("r_110.jpg")#
    
    img_boy_126  = cv2.imread("r_111.jpg")#
    
    img_boy_127  = cv2.imread("r_112.jpg")#
    
    img_boy_128  = cv2.imread("r_113.jpeg")#
    
    img_boy_129  = cv2.imread("r_114.jpg")#
    
    img_boy_130  = cv2.imread("r_115.jpg")#
    
    img_boy_131  = cv2.imread("r_116.jpg")#
    
    img_boy_132  = cv2.imread("r_117.jpg")#
    
    img_boy_133  = cv2.imread("r_118.jpg")#
    
    img_boy_134  = cv2.imread("r_119.jpg")#
    
    img_boy_135  = cv2.imread("r_120.jpg")#
    
    img_boy_136  = cv2.imread("r_121.jpg")#
    
    img_boy_137  = cv2.imread("r_122.jpg")#
    
    img_boy_138  = cv2.imread("r_123.jpg")#
    
    img_boy_139  = cv2.imread("r_124.jpg")#
    
    img_boy_140  = cv2.imread("r_125.jpg")#
    
    img_boy_141  = cv2.imread("r_126.jpg")#
    
    img_boy_142  = cv2.imread("r_127.jpg")#
    
    img_boy_143  = cv2.imread("r_128.jpg")#
    
    img_boy_144  = cv2.imread("r_129.jpg")#
    
    img_boy_145  = cv2.imread("r_130.jpg")#
    
    img_boy_146  = cv2.imread("r_131.jpg")#
    
    img_boy_147  = cv2.imread("r_132.jpg")#
    
    img_boy_148  = cv2.imread("r_133.jpg")#
    
    img_boy_149  = cv2.imread("r_134.jpg")#
    
    img_boy_150  = cv2.imread("r_135.jpg")#
    
    img_boy_151  = cv2.imread("r_136.jpg")#
    
    img_boy_152  = cv2.imread("r_137.jpg")#
    
    img_boy_153  = cv2.imread("r_138.jpg")#
    
    img_boy_154  = cv2.imread("r_139.jpg")#
    
    img_boy_155  = cv2.imread("r_140.jpg")#
    
    img_boy_156  = cv2.imread("r_141.jpg")#
    
    img_boy_157  = cv2.imread("r_142.jpg")#
    
    img_boy_158  = cv2.imread("r_143.jpg")#
    
    img_boy_159  = cv2.imread("r_144.jpg")#
    
    img_boy_160  = cv2.imread("r_145.jpg")#
    
    img_boy_161  = cv2.imread("r_146.jpg")#
    
    img_boy_162  = cv2.imread("r_147.jpg")#
    
    img_boy_163  = cv2.imread("r_148.jpg")#
    
    img_boy_164  = cv2.imread("r_149.jpg")#
    
    img_boy_165  = cv2.imread("r_150.jpg")#
    
    img_boy_166  = cv2.imread("r_151.png")#
    
    img_boy_167  = cv2.imread("r_83.jpg")#



img_olc_1  = cv2.imread("deneme_1_1080x810.png")#1

img_olc_2  = cv2.imread("deneme_1.png")#

img_olc_3  = cv2.imread("deneme_2.jpg")#2

img_olc_4  = cv2.imread("deneme_2_1080x810.jpg")#

img_olc_5  = cv2.imread("deneme_3_1080x810.jpg")#(3-5,6),(7-12) , 1.0779816513761469 = his , j = 2 ,kontrol = 0 ,, 1.0537190082644627

img_olc_6  = cv2.imread("deneme_3.jpg")#

img_olc_7  = cv2.imread("yol.jpeg")#5

img_olc_8  = cv2.imread("yol_1080x810.jpg")#

img_olc_9  = cv2.imread("olcek.jpg")#6

img_olc_10  = cv2.imread("olcek_1080x810.jpg")#

img_olc_11  = cv2.imread("ssd_940x470.png")#7

img_olc_12  = cv2.imread("ssd_1080x810.jpg")#


img_1 = img_boy_3           # donus_max = 254 , his_f = 1.439306358381503
img_2 = img_olc_6  #0.17 sıkıntı         # his_a = 1.039647577092511


#doga.jpg
z= 200   #resmin boyutu
donus_sınır = 0
donus = 0  # while de kaç kere döndügü
olcut = 1.04 #1.1  #histogram oran ,olc 1.1 le, 1.0 arası çıkıyor,1.1 in altına inme # son çalısan 1.04
olcut_alg_1 = 0.22 # alg_1 in eşik değeri 0.22
pp=0  #alg_1 sonra ya girdigibde , histogramın elsesine girmemesi için
ll = 75  #resimin boyutuna göre yarısına yakınına bakmasını istiyorum keskin geçişler ararken ,düsük verdigimde boy larda sıkıntı veriyor 65 lerin altına inme
his_e = 0.7# 0.7(son çalısan)



h_1 = img_1.shape[0]   #200 * 200 yapma için
w_1 = img_1.shape[1]

h_2 = img_2.shape[0]
w_2 = img_2.shape[1]

if h_1 > z:
    n_0 =  z / h_1         
else :
    n_0 = z / h_1
    #n_0 = h_1 / z  
         
            
if w_1 > z:
    n_1 = z / w_1    
else :
    n_1 = z / w_1  
    #n_1 = w_1 / z
         
            
if h_2 > z:
    m_0 = z / h_2      
else :
    m_0 = z / h_2    
    #m_0 = h_2 / z
         
if w_2 > z:
    m_1 = z / w_2      
else :
    m_1 = z / w_2
    #m_1 = w_2 / z



img_1 = cv2.resize(img_1,None, fx = n_1 , fy = n_0, interpolation = cv2.INTER_CUBIC) #resmi 200*200 boyuta çektim

img_2 = cv2.resize(img_2,None, fx = m_1, fy = m_0, interpolation = cv2.INTER_CUBIC)

img_1 = cv2.cvtColor(img_1, cv2.COLOR_BGR2GRAY)  #resmi gri tonlamaya geçiriyorum

img_2 = cv2.cvtColor(img_2, cv2.COLOR_BGR2GRAY)

"""
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
"""

h=0#0#25 #genelde resimlerin ayırt edici noktaları ortadadır ondan 25 den başla
w=0#25

konturol =0

i=0 #bu harfleri değiş forlarda kullanılıyor sıkıntı
j=0
t=0

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
        
    while (n - m < 1 or k - l < 1) or (deg_1 == 0 or deg_2 == 0 or deg_3 == 0 or deg_4 == 0) or (n - m < 60 and k - l < 60) :  #keskinligi daha alta indirdigimde farklı fotoları aynı algılıyor
#renk ton farkını 50 yaptım çünkü kırmızı tonlu renk geçişli tonlarda en fazla 50 fark var benzer tonlarda =  https://www.mircscripting.net/RGB.htm
        
        h+=5                
        w+=20
                
        #if donus_sınır > 35 : # indisler arasında dolaşırken aynı indislere denk gelmemek için
        #    donus_sınır =0
        #donus_sınır +=1 
        
       
        
        #if donus_sınır > 25 : # indisler arasında dolaşırken aynı indislere denk gelmemek için
         #   donus_sınır =0
        #donus_sınır +=1
        
        if(h>= img_1.shape[0]-1):     #resmin boyutu 256 yı geçme durumu
            h = 2
        if(w >= img_1.shape[1]-1):
            w = 4
            
        deg_1 = img_1[h,w]
        deg_2 = img_1[h,w+1]
        deg_3 = img_2[h,w]
        deg_4 = img_2[h,w+1]
                        
        #print("ss")       
        if deg_1 > deg_2: # 2 resmin aynı pikselleri arası keskinligi ayarlama
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
            
            
        #print("w = ",w)
        #print("h =",h)
        donus+=1        
        
        if donus > ll:  # donus sayısı istedigim sayıyı geçtiyse 1. alg yı bitir
           
            n=90
            m=20
            k=90
            l=20
                       
            deg_1 =35
            deg_2 =10
            deg_3 =22
            deg_4 =50
                       
            i=10
     
    if i != 10: #buraya giriyorsa sonuncu konturolü 3.06 yapmaması için verdigim deg_1,2 değerleri yüzünden 255. satırda
        
        
        deg_1_2 = deg_1 / deg_2    
        print(deg_1_2)
    
        deg_3_4 = deg_3 / deg_4
        print(deg_3_4)
    
        if deg_1_2 > deg_3_4 :
            sonuc = deg_1_2 - deg_3_4 
        else :
            sonuc = deg_3_4 - deg_1_2 
      
    
        print("sonuc =", sonuc)
        if sonuc <= olcut_alg_1 : #0.1 #15
            print("donus =",donus)
            print("aynı")
            konturol += 1
        else:
            print("donus =",donus)
            print("farklı")
            
        print("h","w",h,w)
        h+=5#2
        w+=20#2
    
        if(h >= img_1.shape[0]-1):           
            h = 6
        if(w >= img_1.shape[1]-1):
            w = 8
            
        
        i+=1
        j+=1
        t+=1
    
    
    print("")

if konturol >=4 or (t > 2 and t ==konturol ) :  #efectli resimleri kurtarmak içn histogramda şansları olmuyor
    pp = 1
    print("konturol:",konturol,"/",t)
    print("alg_1 == resim aynı")
    donus = 3 # (t > 1 and t ==konturol ) = efectler için
    konturol=0

if  donus > ll and ( (j ==5 and (konturol == 0 or konturol == 1 or konturol == 2  )) or (j ==4 and (konturol ==0 or konturol ==1  )) or (j == 3 and (konturol ==0 )) )  :
    
    donus = 2
    print("alg_1_ek, donus = ",donus)
    print("konturol:",konturol,"/",j)
    print("farklı")
    konturol = 0
    pp = 1   #2. alg elife girmesin diye çözüm ara


print("")
print("")


if (donus > ll or konturol == 3)  :
   
    
    #if t > 2 and t - konturol == 1 :        
     #   his_e+=3.6    
        
    print("alg_2 ,donus =" , donus)    
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
    
        if  - his_e < z < his_e:
            kontrol_2+=1
    
                  
    print("sonuc =",kontrol_2,"/",toplam)

    oran=toplam / kontrol_2
    print(oran)

    if(oran < olcut):
        print("aynı foto")
    else :
        print("farklı foto")
        
elif pp == 0  :        
    print("donus = ",donus)
    print("konturol:",konturol,"/",t)
    print("alg_1_alt = farklı foto ")
    
"""

(n - m < 17 and k - l < 17) or 

(n - m < 4 or k - l < 4) or

"""
