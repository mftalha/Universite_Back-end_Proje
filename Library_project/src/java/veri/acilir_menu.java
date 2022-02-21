/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package veri;

/**
 *
 * @author casper
 */
public class acilir_menu 
{
    private int acilir_menu_id;
    private int menu_id;
    private String baslik;
    private String icerik;
    private int sira_no;
    private String durum;
    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getAcilir_menu_id() {
        return acilir_menu_id;
    }

    public void setAcilir_menu_id(int acilir_menu_id) {
        this.acilir_menu_id = acilir_menu_id;
    }

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public String getBaslik() {
        return baslik;
    }

    public void setBaslik(String baslik) {
        this.baslik = baslik;
    }

    public String getIcerik() {
        return icerik;
    }

    public void setIcerik(String icerik) {
        this.icerik = icerik;
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
