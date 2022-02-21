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
public class haber 
{
    private int hbr_id;
    private String hbr_baslik;
    private String hbr_foto;
    private String hbr_durum;
    private String hbr_icerik;
    private Timestamp hbr_trh;

    public int getHbr_id() {
        return hbr_id;
    }

    public void setHbr_id(int hbr_id) {
        this.hbr_id = hbr_id;
    }

    public String getHbr_baslik() {
        return hbr_baslik;
    }

    public void setHbr_baslik(String hbr_baslik) {
        this.hbr_baslik = hbr_baslik;
    }

    public String getHbr_foto() {
        return hbr_foto;
    }

    public void setHbr_foto(String hbr_foto) {
        this.hbr_foto = hbr_foto;
    }

    public String getHbr_durum() {
        return hbr_durum;
    }

    public void setHbr_durum(String hbr_durum) {
        this.hbr_durum = hbr_durum;
    }

    public String getHbr_icerik() {
        return hbr_icerik;
    }

    public void setHbr_icerik(String hbr_icerik) {
        this.hbr_icerik = hbr_icerik;
    }

    public Timestamp getHbr_trh() {
        return hbr_trh;
    }

    public void setHbr_trh(Timestamp hbr_trh) {
        this.hbr_trh = hbr_trh;
    }
    
}
