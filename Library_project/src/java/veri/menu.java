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
public class menu 
{
    private int menu_id;
    private String baslik;
    private String icerik;
    private int sira_no;
    private String durum;
    private String menu_tipi;
    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    public String getMenu_tipi() {
        return menu_tipi;
    }

    public void setMenu_tipi(String menu_tipi) {
        this.menu_tipi = menu_tipi;
    }
    
}
