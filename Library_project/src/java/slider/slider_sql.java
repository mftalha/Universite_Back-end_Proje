/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package slider;

import java.sql.Timestamp;

/**
 *
 * @author casper
 */
public class slider_sql 
{
    private int id;
    private int sira_no;
    private String durum;
    private String icerik;
    private String resim;
    private Timestamp kayit_tarih;

    public int getSira_no() {
        return sira_no;
    }

    public void setSira_no(int sira_no) {
        this.sira_no = sira_no;
    }

    public String getResim() {
        return resim;
    }

    public void setResim(String resim) {
        this.resim = resim;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getDurum() {
        return durum;
    }

    public void setDurum(String durum) {
        this.durum = durum;
    }

    public String getIcerik() {
        return icerik;
    }

    public void setIcerik(String icerik) {
        this.icerik = icerik;
    }

    
    public Timestamp getKayit_tarih() {
        return kayit_tarih;
    }

    public void setKayit_tarih(Timestamp kayit_tarih) {
        this.kayit_tarih = kayit_tarih;
    }
    
    
    
}
