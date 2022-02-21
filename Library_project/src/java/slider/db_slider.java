/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package slider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import veri.db_katmani;
import veri.slider;




/**
 *
 * @author casper
 */
public class db_slider 
{
    private PreparedStatement preparedStatement = null;
    Statement stmt = null;
    db_katmani db = new db_katmani();
    Connection conn;
    
    public ArrayList<slider_sql> sliderlar() throws SQLException
    {
        
         conn = db.baglan();
       
        String sql_query="select * from sliderlar where durum != 'Sil' ORDER BY sira_no ASC "; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<slider_sql> list = new ArrayList<>();

        while (rs.next()) 
        {
           slider_sql sld =new slider_sql();
           
           sld.setId(rs.getInt("slider_id"));        
           sld.setSira_no(rs.getInt("sira_no"));  
           sld.setIcerik(rs.getString("icerik"));                    
           sld.setDurum(rs.getString("durum"));
           sld.setResim(rs.getString("resim"));
           sld.setKayit_tarih(rs.getTimestamp("kayit_tarihi"));
           
          
           list.add(sld);
        }
        
        preparedStatement.close();
        return list;
    }
    
    
    public void save(String icerik,String resim,int sira_no)//ArrayList<slider> duyurular = db.sliderlar();
    {
       
        String durum ="Aktif";
        
        try 
        {           
            conn = db.baglan();
            resim_sira_kont(sira_no);
            
            String sorgu = "INSERT INTO sliderlar (resim,durum,icerik,sira_no) VALUES (?,?,?,?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,resim);
            preparedStatement.setString(2,durum);
            preparedStatement.setString(3,icerik);
            preparedStatement.setInt(4,sira_no);
   
            preparedStatement.executeUpdate();
            conn.commit();
            preparedStatement.close();
             // güncelleme yapılınca böyle
                    
        } catch (Exception ex) 
        {
            System.out.println("resim ekle hata");
        }
    }
    
    
    public void resim_guncelle(String icerik,int id,int sira_no,int knt,String resim)
     {
         
         String sorgu = "Update sliderlar Set icerik = ? ,sira_no = ? ,	resim = ?  where slider_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            conn = db.baglan();
            if(knt ==1)
            {
                resim_sira_kont(sira_no);
            }
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,icerik);
            preparedStatement.setInt(2,sira_no);
            preparedStatement.setString(3,resim);
            preparedStatement.setInt(4,id);
            
            
            preparedStatement.executeUpdate();
            if(knt ==1)
            {
            conn.commit();
            }
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("resim güncelle hata");
        }        
     }
    
        public void resim_sira_kont(int sira_) 
    {   //eyer personel_sıra ekle daha önceki bi sırayı verdiyse burda sonraki degerler 1 arttırılıp oraya o girer
         
        int sıra=0;
        
        String sql_query ="select sira_no from sliderlar ";
        
        try {
        
        preparedStatement = conn.prepareStatement(sql_query);
        
        ResultSet rs = preparedStatement.executeQuery();
        
        while (rs.next()) 
        {
             
          sıra = rs.getInt("sira_no");   
          conn.setAutoCommit(false); // sorgu konturollerini biz yapacaz sistemde durduruyoruz oto konturolü    
          if(sira_ == sıra )
          {          
            String sorgu = "Update sliderlar Set sira_no = sira_no+1 where sira_no >= ? ";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setInt(1, sira_);
            preparedStatement.executeUpdate();         
          }           
        }        
        } catch (Exception ex) {
            System.out.println("resim_sira_kont de hata");
        }    
    }
        
        
    public void slider_sil(int id)
     {
         String sil="Sil";
         String sorgu = "Update sliderlar Set durum = ?   where slider_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            conn = db.baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);      
            preparedStatement.setInt(2,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("Slider sil hata");
        }        
     }
    
    
    public static void main(String[] args) {
        db_slider db = new db_slider();
        //db.save("sil", "sil", 4);
        //db.resim_guncelle("asd", 1,4);
        //db.save("ss", "ss",30);
        //db.resim_guncelle("assd", 1, 35, 0);
    }
    
    
    
}
