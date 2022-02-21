/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package veri;

import java.sql.Timestamp;

/**
 *
 * @author casper
 */
public class kisi 
{
    private int id;
    private String mail;
    private String sifre;
    
    private Timestamp kayit_tarihi;
    private Timestamp guncelleme_tarihi;
    private Timestamp son_islem_tarihi;
    
    private int giris_sayisi;
    private String durum;
    private String ad_soyad;
    private String universite;

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getGiris_sayisi() {
        return giris_sayisi;
    }

    public void setGiris_sayisi(int giris_sayisi) {
        this.giris_sayisi = giris_sayisi;
    }

    public String getDurum() {
        return durum;
    }

    public void setDurum(String durum) {
        this.durum = durum;
    }

    public String getAd_soyad() {
        return ad_soyad;
    }

    public void setAd_soyad(String ad_soyad) {
        this.ad_soyad = ad_soyad;
    }

    public String getUniversite() {
        return universite;
    }

    public void setUniversite(String universite) {
        this.universite = universite;
    }

    public String getUnvan() {
        return unvan;
    }

    public void setUnvan(String unvan) {
        this.unvan = unvan;
    }
    private String unvan;
    

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }
    
    public Timestamp getKayit_tarihi() {
        return kayit_tarihi;
    }

    public void setKayit_tarihi(Timestamp kayit_tarihi) {
        this.kayit_tarihi = kayit_tarihi;
    }

    public Timestamp getGuncelleme_tarihi() {
        return guncelleme_tarihi;
    }

    public void setGuncelleme_tarihi(Timestamp guncelleme_tarihi) {
        this.guncelleme_tarihi = guncelleme_tarihi;
    }

    public Timestamp getSon_islem_tarihi() {
        return son_islem_tarihi;
    }

    public void setSon_islem_tarihi(Timestamp son_islem_tarihi) {
        this.son_islem_tarihi = son_islem_tarihi;
    }
    
}
