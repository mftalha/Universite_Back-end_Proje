# -*- coding: utf-8 -*-
"""
Created on Sat Jun 26 09:56:59 2021

@author: casper
"""

import cv2
from matplotlib import pyplot as plt
import numpy as np

# "/Users/..../opencv/road.jpeg"
#cv2.imshow ('resim' , img) #resim adında bir pencerenin içinde bizim görüntüyü gösterir.

#resmi alma
img_path = "yol.jpeg"
img = cv2.imread(img_path)
img_filt_1=cv2.imread("yol_fil_1.jpeg")
img_filt_2=cv2.imread("yol_fil_2.jpeg")
print(img.shape)

a_h = img.shape[0]
a_w = img.shape[1]

for i in range(2):
    for j in range(6):
        print(img[i,j],end=",")
    print("")
        

#gri tonlamada , 3 boyutlu resimden ton ve doygunluk bilgileri pikselden çıkartılıp sadece parlaklık değeri kalır. bu da aşşagıda
#kırmızı kanalının %30’u, yeşil kanalın %59’u ve mavi kanalın %11’i alınarak toplanması neticesinde bulunmaktadır. 
#resmi sayah beyaz yapma  = resmi gri tonlama yaptık 0-255 arası değerler
gray_image = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)  

plt.imshow(gray_image)

#plt.show()
print("ss=",gray_image.shape)

a_h = gray_image.shape[0]
a_w = gray_image.shape[1]


for i in range(2):
    for j in range(3):
        print(gray_image[i,j],end=",")
    print("")

print("hesaplar")
hesap_1 = (int(img[5,1,0]*.11+img[5,1,1]*.59+img[5,1,2]*.3))/(int(img[5,2,0]*.11+img[5,2,1]*.59+img[5,2,2]*.30))
hesap_2 = int(gray_image[5,1])/int(gray_image[5,2])


if hesap_1 == hesap_2:
    print("aynı")
    
print(hesap_1)
print(hesap_2)


"""
#matrisin sadece 0 ve 255 değerlerinden oluşmasın istediğimiz durumlarda kulanılıyor
(thresh, blackAndWhiteImage) = cv2.threshold(gray_image, 20, 255, cv2.THRESH_BINARY)
#işlem yapılacak resim , verilecek eşik değer , eşik değeri geçen matris elemanlarına atanmasını istediğim değer.
#eşik değerin altında kalan değerlere 0 atandı

(thresh, blackAndWhiteImage) = cv2.threshold(gray_image, 80, 255, cv2.THRESH_BINARY)
(thresh, blackAndWhiteImage) = cv2.threshold(gray_image, 160, 255, cv2.THRESH_BINARY)
(thresh, blackAndWhiteImage) = cv2.threshold(gray_image, 200, 255, cv2.THRESH_BINARY)
plt.imshow(blackAndWhiteImage)
#plt.show()

a_h = blackAndWhiteImage.shape[0]
a_w = blackAndWhiteImage.shape[1]

print(blackAndWhiteImage.shape)


for i in range(2):
    for j in range(430,450):
        print(blackAndWhiteImage[i,j],end=",")
    print("")
"""
"""
#resmi bulanıklaştırma 

output2 = cv2.blur(img, (10, 10))
plt.imshow(output2)
plt.show()
"""

"""
output2 = cv2.GaussianBlur(img, (9, 9), 5)
plt.imshow(output2)
plt.show()
"""
"""
print("ss")
for i in range(2):
    for j in range(6):
        print(img_filt_1[i,j],end=",")
    print("")

hesap_1 = (img[15,2,0]+img[15,2,1]+img[15,2,2]) / (img[15,3,0]+img[15,3,1]+img[15,3,2])
hesap_2 = (img_filt_1[15,2,0]+img_filt_1[15,2,1]+img_filt_1[15,2,2]) / (img_filt_1[15,3,0]+img_filt_1[15,3,1]+img_filt_1[15,3,2])

hesap_3 = int(img[95,2,0]+img[75,2,1]+img[95,2,2]) / int(img[95,3,0]+img[95,3,1]+img[95,3,2])
hesap_4 = int(img_filt_1[95,2,0]+img_filt_1[95,2,1]+img_filt_1[95,2,2]) / int(img_filt_1[95,3,0]+img_filt_1[95,3,1]+img_filt_1[95,3,2])

hesap_5 = img[80,2,2] / img[80,3,2]
hesap_6 = img_filt_1[80,2,2] / img_filt_1[80,3,2]


if hesap_1 == hesap_2:
    print("aynı_1")
    
if hesap_3 == hesap_4:
    print("aynı_2")

if hesap_5 == hesap_6:
    print("aynı_3")

print(hesap_1)
print(hesap_2)
print(hesap_3)
print(hesap_4)
print(hesap_5)
print(hesap_6)

"""

"""
 Resim bulanıklaştırma : belirlenen bulanıklaştırma filtreleri ve bulanıklık dereceleri ile siyah-beyaz
 resim bulanıklaştırılmıştır. Genellikle bu işlem resimlerdeki gürültüleri temizlemek için kullanılır. 
 Ancak bazı durumlarda resimlerdeki keskin hatların eğitim üzerindeki etkisi olumsuz olabilmektedir. 
 Bu sebeple kullanıldığı durumlarda mevcuttur.
"""


"""
Elimizdeki verileri bazı durumlarda döndürerek kullanmak isteyebiliriz. Ya da veri olarak kullanılacak resimler
 eğik olabilir. Bu gibi durumlarda aşağıdaki fonksiyonlar kullanılabilir.
"""


"""
(h, w) = img.shape[:2]
center = (w / 2, h / 2)
M = cv2.getRotationMatrix2D(center, 13, scale  =1.1)
rotated = cv2.warpAffine(gray_image, M, (w, h))
plt.imshow(rotated)
plt.show()
"""