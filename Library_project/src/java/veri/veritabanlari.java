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
public class veritabanlari 
{
    private int vt_id;
    private String vt_isim;
    private String vt_logo;
    private String vt_aciklama;
    private String vt_icerik;
    private Timestamp vt_acilis_tarihi;
    private Timestamp vt_kapanis_tarihi;
    private String vt_durum;
    private String vt_dokuman;   
    private String vt_katagori;
    private String vt_tur;

    public String getVt_katagori() {
        return vt_katagori;
    }

    public void setVt_katagori(String vt_katagori) {
        this.vt_katagori = vt_katagori;
    }

    public String getVt_tur() {
        return vt_tur;
    }

    public void setVt_tur(String vt_tur) {
        this.vt_tur = vt_tur;
    }

    public int getVt_id() {
        return vt_id;
    }

    public void setVt_id(int vt_id) {
        this.vt_id = vt_id;
    }

    public String getVt_isim() {
        return vt_isim;
    }

    public void setVt_isim(String vt_isim) {
        this.vt_isim = vt_isim;
    }

    public String getVt_logo() {
        return vt_logo;
    }

    public void setVt_logo(String vt_logo) {
        this.vt_logo = vt_logo;
    }

    public String getVt_aciklama() {
        return vt_aciklama;
    }

    public void setVt_aciklama(String vt_aciklama) {
        this.vt_aciklama = vt_aciklama;
    }

    public String getVt_icerik() {
        return vt_icerik;
    }

    public void setVt_icerik(String vt_icerik) {
        this.vt_icerik = vt_icerik;
    }

    public Timestamp getVt_acilis_tarihi() {
        return vt_acilis_tarihi;
    }

    public void setVt_acilis_tarihi(Timestamp vt_acilis_tarihi) {
        this.vt_acilis_tarihi = vt_acilis_tarihi;
    }

    public Timestamp getVt_kapanis_tarihi() {
        return vt_kapanis_tarihi;
    }

    public void setVt_kapanis_tarihi(Timestamp vt_kapanis_tarihi) {
        this.vt_kapanis_tarihi = vt_kapanis_tarihi;
    }

    public String getVt_durum() {
        return vt_durum;
    }

    public void setVt_durum(String vt_durum) {
        this.vt_durum = vt_durum;
    }

    public String getVt_dokuman() {
        return vt_dokuman;
    }

    public void setVt_dokuman(String vt_dokuman) {
        this.vt_dokuman = vt_dokuman;
    }

    
    
}
