/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package veri;


public class personel 
{
    
    private int kisi_id ;
    private String unvan;
    private String ad_soyad;
    private String email;
    private String cep_tel;
    private String dahili_tel;
    private int sira_no;
    private String durum;
    private int b_id;

    public String getCep_tel() {
        return cep_tel;
    }

    public void setCep_tel(String cep_tel) {
        this.cep_tel = cep_tel;
    }

    public String getDahili_tel() {
        return dahili_tel;
    }

    public void setDahili_tel(String dahili_tel) {
        this.dahili_tel = dahili_tel;
    }
    

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public int getKisi_id() {
        return kisi_id;
    }

    public void setKisi_id(int kisi_id) {
        this.kisi_id = kisi_id;
    }

    public String getUnvan() {
        return unvan;
    }

    public void setUnvan(String unvan) {
        this.unvan = unvan;
    }

    public String getAd_soyad() {
        return ad_soyad;
    }

    public void setAd_soyad(String ad_soyad) {
        this.ad_soyad = ad_soyad;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public int getSira_no() {
        return sira_no;
    }

    public void setSira_no(int sira_no) {
        this.sira_no = sira_no;
    }

    public String getDurum() {
        return durum;
    }

    public void setDurum(String durum) {
        this.durum = durum;
    }

    
}
