package veri;

import java.sql.Timestamp;

/**
 *
 * @author casper
 */
public class personel_bolmlr {

    private int bolum_id;
    private String bolum_ad;
    private String durum;
    private int sira_no;
    private Timestamp kayit_tarihi;

    public Timestamp getKayit_tarihi() {
        return kayit_tarihi;
    }

    public void setKayit_tarihi(Timestamp kayit_tarihi) {
        this.kayit_tarihi = kayit_tarihi;
    }

    public int getBolum_id() {
        return bolum_id;
    }

    public void setBolum_id(int bolum_id) {
        this.bolum_id = bolum_id;
    }

    public String getBolum_ad() {
        return bolum_ad;
    }

    public void setBolum_ad(String bolum_ad) {
        this.bolum_ad = bolum_ad;
    }

    

    public String getDurum() {
        return durum;
    }

    public void setDurum(String durum) {
        this.durum = durum;
    }

    public int getSira_no() {
        return sira_no;
    }

    public void setSira_no(int sira_no) {
        this.sira_no = sira_no;
    }
}
