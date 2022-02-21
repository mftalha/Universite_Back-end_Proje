package veri;

import java.sql.Timestamp;

public class duyuru 
{
    private int dyr_id;
    private String dyr_baslik;
    private String dyr_icerik;
    private String dyr_durum;
    private Timestamp kayit_tarihi;

    public int getDyr_id() {
        return dyr_id;
    }

    public void setDyr_id(int dyr_id) {
        this.dyr_id = dyr_id;
    }

    public String getDyr_baslik() {
        return dyr_baslik;
    }

    public void setDyr_baslik(String dyr_baslik) {
        this.dyr_baslik = dyr_baslik;
    }

    public String getDyr_icerik() {
        return dyr_icerik;
    }

    public void setDyr_icerik(String dyr_icerik) {
        this.dyr_icerik = dyr_icerik;
    }

    public String getDyr_durum() {
        return dyr_durum;
    }

    public void setDyr_durum(String dyr_durum) {
        this.dyr_durum = dyr_durum;
    }

    public Timestamp getKayit_tarihi() {
        return kayit_tarihi;
    }

    public void setKayit_tarihi(Timestamp kayit_tarihi) {
        this.kayit_tarihi = kayit_tarihi;
    }
    
}
