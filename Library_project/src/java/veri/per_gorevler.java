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
public class per_gorevler 
{
    private int gorev_id;
    private int bolum_id;
    private String ismi;
    private String durum;
    private int rutbe_no;

    public int getGorev_id() {
        return gorev_id;
    }

    public void setGorev_id(int gorev_id) {
        this.gorev_id = gorev_id;
    }

    public int getBolum_id() {
        return bolum_id;
    }

    public void setBolum_id(int bolum_id) {
        this.bolum_id = bolum_id;
    }

    public String getIsmi() {
        return ismi;
    }

    public void setIsmi(String ismi) {
        this.ismi = ismi;
    }

    public String getDurum() {
        return durum;
    }

    public void setDurum(String durum) {
        this.durum = durum;
    }

    public int getRutbe_no() {
        return rutbe_no;
    }

    public void setRutbe_no(int rutbe_no) {
        this.rutbe_no = rutbe_no;
    }
}
