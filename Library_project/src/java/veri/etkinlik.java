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
public class etkinlik 
{
    private int etknlik_id;
    private String etknlik_baslik;
    private String etknlik_foto;
    private String etknlik_durum;
    private String etknlik_icerik;
    private Timestamp etknlik_baslangic_tarihi;
    private Timestamp etknlik_bitis_tarihi;

    public int getEtknlik_id() {
        return etknlik_id;
    }

    public void setEtknlik_id(int etknlik_id) {
        this.etknlik_id = etknlik_id;
    }

    public String getEtknlik_baslik() {
        return etknlik_baslik;
    }

    public void setEtknlik_baslik(String etknlik_baslik) {
        this.etknlik_baslik = etknlik_baslik;
    }

    public String getEtknlik_foto() {
        return etknlik_foto;
    }

    public void setEtknlik_foto(String etknlik_foto) {
        this.etknlik_foto = etknlik_foto;
    }

    public String getEtknlik_durum() {
        return etknlik_durum;
    }

    public void setEtknlik_durum(String etknlik_durum) {
        this.etknlik_durum = etknlik_durum;
    }

    public String getEtknlik_icerik() {
        return etknlik_icerik;
    }

    public void setEtknlik_icerik(String etknlik_icerik) {
        this.etknlik_icerik = etknlik_icerik;
    }

    public Timestamp getEtknlik_baslangic_tarihi() {
        return etknlik_baslangic_tarihi;
    }

    public void setEtknlik_baslangic_tarihi(Timestamp etknlik_baslangic_tarihi) {
        this.etknlik_baslangic_tarihi = etknlik_baslangic_tarihi;
    }

    public Timestamp getEtknlik_bitis_tarihi() {
        return etknlik_bitis_tarihi;
    }

    public void setEtknlik_bitis_tarihi(Timestamp etknlik_bitis_tarihi) {
        this.etknlik_bitis_tarihi = etknlik_bitis_tarihi;
    }
    
}
