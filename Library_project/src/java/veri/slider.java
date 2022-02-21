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
public class slider 
{
    private int slider_id ;
    private String icerik;
    private String res;
    private String durum;
    private Timestamp kayit_tarih;

    public Timestamp getKayit_tarih() {
        return kayit_tarih;
    }

    public void setKayit_tarih(Timestamp kayit_tarih) {
        this.kayit_tarih = kayit_tarih;
    }

    

    public String getRes() {
        return res;
    }

    public void setRes(String res) {
        this.res = res;
    }


    public String getDurum() {
        return durum;
    }

    public void setDurum(String durum) {
        this.durum = durum;
    }

    public int getSlider_id() {
        return slider_id;
    }

    public void setSlider_id(int slider_id) {
        this.slider_id = slider_id;
    }

    

    public String getIcerik() {
        return icerik;
    }

    public void setIcerik(String icerik) {
        this.icerik = icerik;
    }

   
}
