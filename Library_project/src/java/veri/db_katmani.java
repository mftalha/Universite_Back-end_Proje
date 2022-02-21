package veri;

//if(!rs.next())  //(!rs.isBeforeFirst() && rs.getRow() == 0);
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;



//import java.util.logging.Level;
//import java.util.logging.Logger;

public class db_katmani 
{
    private Connection conn=null; // veritabanı katmanlar içinde ,veri çekme veri atma katmanlar arası servisi
    //veritabanı değiştirdiğimde daha sonra alttaki 3 lüyü değiştirecem ve direk çalışacak aynı şekilde
    //private String url = "jdbc:mysql://localhost:3306/uni_dt"+"?useUnicode=true&characterEncoding=utf8";
    private String url = "jdbc:mysql://localhost:3306/kutuphane"+"?useUnicode=true&characterEncoding=utf8";
    private String kullanici_adi = "root"; //veri tabanı giriş bilgilerimiz    
    private String parola = "";
    
    private PreparedStatement preparedStatement = null;
    Statement stmt = null;
    
    public Connection baglan() // veritabanı ile bağlantıyı sağlama
    {
        
        try {
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            System.out.println("Bağlantı basarili");
            conn = DriverManager.getConnection(url,kullanici_adi,parola);
            
        } catch (Exception e) 
        {
            System.out.println("bağlantıda hata var");
        }
        return conn;
    }

    
    public ArrayList<kisi> kullanici_b(String email, String sifre) throws SQLException
    {
        baglan();
        String sql_query="select * from admin where email= ? and sifre=? ";
        preparedStatement = conn.prepareStatement(sql_query);
        preparedStatement.setString(1,email); 

        String hash_sifre = org.apache.commons.codec.digest.DigestUtils.sha256Hex(sifre);     
        preparedStatement.setString(2,hash_sifre); 

        ResultSet rs = preparedStatement.executeQuery();
        ArrayList<kisi> list = new ArrayList<>();

        while (rs.next()) 
        {
           kisi kullanici =new kisi();
           
           kullanici.setId(rs.getInt("admin_id"));
           kullanici.setMail(rs.getString("email"));
           kullanici.setSifre(rs.getString("sifre"));
           kullanici.setKayit_tarihi(rs.getTimestamp("kayit_tarihi"));
           kullanici.setGuncelleme_tarihi(rs.getTimestamp("guncelleme_tarihi"));
           kullanici.setSon_islem_tarihi(rs.getTimestamp("son_islem_tarihi"));
           kullanici.setGiris_sayisi(rs.getInt("giris_sayisi"));
           kullanici.setDurum(rs.getString("durum"));
           kullanici.setAd_soyad(rs.getString("ad_soyad"));
           kullanici.setUniversite(rs.getString("unirversite"));
           kullanici.setUnvan(rs.getString("unvan"));
           
           list.add(kullanici);
        }
        
        preparedStatement.close();
        return list;
    }
  
    
    public void son_bag(int id) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {
        
        String sorgu = "Update admin Set son_islem_tarihi= CURRENT_TIMESTAMP where admin_id  = ?  ";
        
        try {
            baglan();          
            preparedStatement = conn.prepareStatement(sorgu);
            
            preparedStatement.setInt(1, id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();

            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/son_bag hata");
        }      
    }   
    
    public void ver_guncelle(String yeni_mail ,String durum ,String ad_soyad ,String uni ,String unvan,int id) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {  
        String sorgu = "Update admin Set email = ? ,durum = ? ,ad_soyad = ? ,unirversite = ? ,unvan = ?   where admin_id =? ";
        try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1, yeni_mail); //1. soru işareti yerine paremetredeki date gelsin
            preparedStatement.setString(2, durum);
            preparedStatement.setString(3, ad_soyad);
            preparedStatement.setString(4, uni);
            preparedStatement.setString(5, unvan);
            preparedStatement.setInt(6, id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/veriguncelleme hata");
        }      
    } 
    
    public void sif_güncelle(String sifre,int id) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {
        
        String sorgu = "Update admin Set sifre= ? where admin_id = ? ";
        try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1, sifre); //1. soru işareti yerine paremetredeki date gelsin
            preparedStatement.setInt(2, id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/sifre_değiş hata");
        }      
    } 
    
    
    public void giris_sayisi_guncelleme(int sayac,int id) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {
        
        String sorgu = "Update admin Set giris_sayisi= ? where admin_id  = ? ";
        try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setInt(1, sayac); //1. soru işareti yerine paremetredeki date gelsin
            preparedStatement.setInt(2, id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/sifre_değiş hata");
        }      
    }   
    
    public void duyuru_ekle(String baslik,String durum,String icerik)
    {       
        try 
        {
            baglan();          
            stmt = conn.createStatement();
            String sorgu = "Insert Into duyurular (baslik,icerik,durum) VALUES(" + "'" + baslik + "'," + "'" + icerik + "'," + "'" + durum + "')";
            stmt = conn.createStatement();
                    
            stmt.executeUpdate(sorgu); // güncelleme yapılınca böyle
            stmt.close();      
            
        } catch (Exception ex) 
        {
            System.out.println("duyuru eklede hata");
        }
    
    }
    
    
    public ArrayList<duyuru> duyurular() throws SQLException
    {
        baglan();
     
        ArrayList<duyuru> list = new ArrayList<>();
        
        String sql_query="select * from duyurular ";
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
         
        while (rs.next()) 
        {
           duyuru dyr =new duyuru();
           
           dyr.setDyr_id(rs.getInt("duyuru_id"));
           dyr.setDyr_baslik(rs.getString("baslik"));
           dyr.setDyr_icerik(rs.getString("icerik"));
           dyr.setDyr_durum(rs.getString("durum"));
           dyr.setKayit_tarihi(rs.getTimestamp("guncelleme_tarihi"));          
           
           list.add(dyr);
        }
        
        preparedStatement.close();
        return list;
    }
    
    public void duyuru_guncelle(String baslik,String icerik,String durum,int id)
     {
        
         String sorgu = "Update duyurular Set baslik = ? ,icerik = ? ,durum = ? where duyuru_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,baslik);
            preparedStatement.setString(2,icerik);
            preparedStatement.setString(3,durum);
            preparedStatement.setInt(4,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("duyuru guncelle hata");
        }        
     }
    
    
    
    public void duyuru_sil(int id)
     {
         String sil="Sil";
         int sıra_no =0;
         String sorgu = "Update duyurular Set durum = ? where duyuru_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);      
            preparedStatement.setInt(2,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("duyuru sil hata");
        }        
     }
    
    
    public ArrayList<personel_bolmlr> personel_blm() throws SQLException
    {
        baglan();
        String sil ="Sil";
        String sql_query="select * from personel_bolumler where durum != ?  ORDER BY sira_no ASC ";
        preparedStatement = conn.prepareStatement(sql_query);
        preparedStatement.setString(1, sil);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<personel_bolmlr> list = new ArrayList<>();

        while (rs.next()) 
        {
           personel_bolmlr prs =new personel_bolmlr();
           
           prs.setBolum_id(rs.getInt("bolum_id"));
           prs.setBolum_ad(rs.getString("bolum_adi"));          
           prs.setDurum(rs.getString("durum"));          
           prs.setSira_no(rs.getInt("sira_no"));   
           prs.setKayit_tarihi(rs.getTimestamp("kayit_tarihi"));   
           list.add(prs);
        }
        
        preparedStatement.close();
        return list;
    }
    
    public ArrayList<per_gorevler> personel_grv() throws SQLException
    {
        baglan();
       
        String sql_query="select * from gorevler ORDER BY RUTBE_NO ASC "; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<per_gorevler> list = new ArrayList<>();

        while (rs.next()) 
        {
           per_gorevler grv =new per_gorevler();
           
           grv.setGorev_id(rs.getInt("gorev_id"));
           grv.setBolum_id(rs.getInt("bolum_id"));
           grv.setIsmi(rs.getString("ismi"));          
           grv.setDurum(rs.getString("durum"));          
           grv.setRutbe_no(rs.getInt("rutbe_no"));   
           
           list.add(grv);
        }
        
        preparedStatement.close();
        return list;
    }
    
    public void personel_bolum_ekle(String bolum_adi,String durum ,int sira_no)
    {
        try 
        {           
            baglan(); 
            personel_bolum_ekle_sira_kont(sira_no);
            stmt = conn.createStatement();
            String sorgu = "Insert Into personel_bolumler (bolum_adi,durum,sira_no) VALUES(" + "'" + bolum_adi + "'," + "'" + durum + "'," + "'" + sira_no + "')";
            stmt = conn.createStatement();
                    
            stmt.executeUpdate(sorgu); // güncelleme yapılınca böyle
            conn.commit();
            stmt.close();      
            
        } catch (Exception ex) 
        {
            System.out.println("personel_bolum_ekle hata");
        }
    }
    
    public void personel_bolum_ekle_sira_kont(int sira_) 
    {   //eyer personel_sıra ekle daha önceki bi sırayı verdiyse burda sonraki degerler 1 arttırılıp oraya o girer
         
        int sıra=0;
        
        String sql_query ="select sira_no from personel_bolumler   ";
        
        try {
     
        preparedStatement = conn.prepareStatement(sql_query);
        
        ResultSet rs = preparedStatement.executeQuery();
        conn.setAutoCommit(false); // sorgu konturollerini biz yapacaz sistemde durduruyoruz oto konturolü   
        while (rs.next()) 
        {
             
          sıra = rs.getInt("sira_no");   
          
          if(sira_ == sıra )
          { 
            System.out.println(sıra);
            String sorgu = "Update personel_bolumler Set sira_no = sira_no+1 where sira_no >= ? ";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setInt(1, sira_);
            preparedStatement.executeUpdate();
          }
           
        }
        
        } catch (Exception ex) {
            System.out.println("personel_bolum_ekle_sira_kont de hata");
        }    
    }
    
    
     public void bolum_bilgi_guncelleme(int id,String durum,String ad,int sıra_no,int knt) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {
        
        String sorgu = "Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
        try {            
            
            
            baglan();
            if(knt ==1)
            {
                personel_bolum_ekle_sira_kont(sıra_no);
            }
            
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1, ad); //1. soru işareti yerine paremetredeki date gelsin
            preparedStatement.setString (2, durum);
            preparedStatement.setInt(3, sıra_no);
            preparedStatement.setInt(4, id);
            
            preparedStatement.executeUpdate();
            if(knt ==1)
            {
            conn.commit();
            }
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/sifre_bolum_bilgi_guncelleme");
        }      
    } 
    
     
     public void bolum_sil(int id)
     {
         String sil="Sil";
         int sıra_no =0;
         String sorgu = "Update personel_bolumler Set durum = ?,sira_no =? where bolum_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);
            preparedStatement.setInt(2,sıra_no);
            preparedStatement.setInt(3,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("bolum sil hata");
        }        
     }
     
     // gorevvvv
     
     public void personel_gorev_ekle(String bolum_adi,String durum ,int sira_no, int bol_id)
    {
        
        try 
        {           
            baglan(); 
            personel_gorev_ekle_sira_kont(sira_no);
            stmt = conn.createStatement();
            
            String sorgu = "Insert Into gorevler (bolum_id,ismi,durum,rutbe_no) VALUES(" + "'"+ bol_id+"'," + "'" + bolum_adi + "'," + "'" + durum + "'," + "'" + sira_no + "')";
                             
            stmt.executeUpdate(sorgu); // güncelleme yapılınca böyle
            conn.commit();
            stmt.close();      
            
        } catch (Exception ex) 
        {
            System.out.println("personel_gorev_ekle hata");
        }
    }
     
     
     
         public void personel_gorev_ekle_sira_kont(int sira_) 
    {   //eyer personel_sıra ekle daha önceki bi sırayı verdiyse burda sonraki degerler 1 arttırılıp oraya o girer
         
        int sıra=0;
        
        String sql_query ="select rutbe_no from gorevler   ";
        
        try {
     
        preparedStatement = conn.prepareStatement(sql_query);
        
        ResultSet rs = preparedStatement.executeQuery();
        conn.setAutoCommit(false); // sorgu konturollerini biz yapacaz sistemde durduruyoruz oto konturolü  
        while (rs.next()) 
        {
             
          sıra = rs.getInt("rutbe_no");   
            
          if(sira_ == sıra )
          {
            
            System.out.println(sıra);
            String sorgu = "Update gorevler Set rutbe_no = rutbe_no+1 where rutbe_no >= ? ";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setInt(1, sira_);
            preparedStatement.executeUpdate();
            
           
          }
           
        }
        
        } catch (Exception ex) {
            System.out.println("personel_bolum_ekle_sira_kont de hata");
        }    
    }
     
        
        public void gorev_sil(int id)
     {
         String sil="Sil";
         int sıra_no =0;
         String sorgu = "Update gorevler Set durum = ? , rutbe_no = ? where gorev_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);
            preparedStatement.setInt(2,sıra_no);
            preparedStatement.setInt(3,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("bolum sil hata");
        }        
     }
        
        
        public void gorev_bilgi_guncelleme(int id,String durum,String ad,int sıra_no,int knt) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {
        
        String sorgu = "Update gorevler Set 	ismi = ? , durum= ? , rutbe_no = ? where gorev_id  = ? ";
        try {            
            
            
            baglan();
            if(knt ==1)
            {
                personel_gorev_ekle_sira_kont(sıra_no);
            }
            
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1, ad); //1. soru işareti yerine paremetredeki date gelsin
            preparedStatement.setString (2, durum);
            preparedStatement.setInt(3, sıra_no);
            preparedStatement.setInt(4, id);
            
            preparedStatement.executeUpdate();
            if(knt ==1)
            {
            conn.commit();
            }
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/gorev_bilgi_guncelleme");
        }      
    }
        
        
        
     public ArrayList<personel> personel_b() throws SQLException
    {
        baglan();
        String sil ="Sil";
        String sql_query="select * from kisiler where durum != ?  ORDER BY sira_no ASC ";
        preparedStatement = conn.prepareStatement(sql_query);
        preparedStatement.setString(1, sil);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<personel> list = new ArrayList<>();

        while (rs.next()) 
        {
           personel prs =new personel();
           
           prs.setKisi_id(rs.getInt("kisi_id"));
           prs.setAd_soyad(rs.getString("ad_soyad"));          
           prs.setUnvan(rs.getString("unvan"));     
           prs.setDurum(rs.getString("durum")); 
           prs.setEmail(rs.getString("email"));
           prs.setCep_tel(rs.getString("cep_tel"));
           prs.setDahili_tel(rs.getString("dahili_tel"));
           prs.setSira_no(rs.getInt("sira_no"));
           prs.setB_id(rs.getInt("gorev_id"));
           
           list.add(prs);
        }
        
        preparedStatement.close();
        return list;
    }
        
     
     public void personel_ekle(String ad_soyad,String unvan,String email,String cep_tel,String dahili_tel ,int sira_no,int g_id)
    {
        String durum = "Aktif";
        try 
        {           
            baglan(); 
            personel_ekle_sira_kont(sira_no);
            //stmt = conn.createStatement();
            //String sorgu = "Insert Into kisiler (gorev_id,unvan,durum,ad_soyad,email,cep_tel,dahili_tel,sira_no,gorev_id) VALUES(" + "'" + g_id + "'," + "'" + unvan + "'," + "'" + durum +  "'," + "'" + ad_soyad + "'," + "'" + email + "'," + "'" + cep_tel + "'," + "'" + dahili_tel + "'," + "'" + sira_no + "'," + "'" + g_id + "')";
            String sorgu = "INSERT INTO kisiler (gorev_id,unvan,durum,ad_soyad,email,cep_tel,dahili_tel,sira_no) VALUES (?,?,?,?,?,?,?,?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setInt(1,g_id);
            preparedStatement.setString(2,unvan);
            preparedStatement.setString(3,durum);
            preparedStatement.setString(4,ad_soyad);
            preparedStatement.setString(5,email);
            preparedStatement.setString(6,cep_tel);
            preparedStatement.setString(7,dahili_tel);
            preparedStatement.setInt(8,sira_no);
           
            preparedStatement.executeUpdate();
            conn.commit();
            preparedStatement.close();
             // güncelleme yapılınca böyle
            
         
        } catch (Exception ex) 
        {
            System.out.println("kisi ekle hata");
        }
    }
     
     
     public void personel_ekle_sira_kont(int sira_) 
    {   //eyer personel_sıra ekle daha önceki bi sırayı verdiyse burda sonraki degerler 1 arttırılıp oraya o girer
         
        int sıra=0;
        
        String sql_query ="select sira_no from kisiler   ";
        
        try {
     
        preparedStatement = conn.prepareStatement(sql_query);
        
        ResultSet rs = preparedStatement.executeQuery();
        conn.setAutoCommit(false); // sorgu konturollerini biz yapacaz sistemde durduruyoruz oto konturolü
        while (rs.next()) 
        {
             
          sıra = rs.getInt("sira_no");   
            
          if(sira_ == sıra )
          {
              
            System.out.println(sıra);
            String sorgu = "Update kisiler Set sira_no = sira_no+1 where sira_no >= ? ";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setInt(1, sira_);
            preparedStatement.executeUpdate();         
          }           
        }        
        } catch (Exception ex) {
            System.out.println("personel_bolum_ekle_sira_kont de hata");
        }    
    }
     
     
     public void personel_sil(int id)
     {
         String sil="Sil";
         int sıra_no =0;
         String sorgu = "Update kisiler Set durum = ? , sira_no = ? where kisi_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);
            preparedStatement.setInt(2,sıra_no);
            preparedStatement.setInt(3,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("personel sil hata");
        }        
     }
     
     
     public void personel_guncelle(String ad_soyad,String unvan,String email,String cep_tel,String dahili_tel ,int sira_no,int k_id,int knt) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {
        
        String sorgu = "Update kisiler Set unvan = ? ,ad_soyad = ? ,email = ? ,cep_tel = ? ,dahili_tel = ? ,sira_no = ?  where kisi_id  = ? ";
        try {            
            
            
            baglan();
            if(knt ==1)
            {
                personel_ekle_sira_kont(sira_no);
            }
           
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1, unvan); //1. soru işareti yerine paremetredeki date gelsin
            preparedStatement.setString (2, ad_soyad);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, cep_tel);
            preparedStatement.setString(5, dahili_tel);
            preparedStatement.setInt(6, sira_no);
            preparedStatement.setInt(7, k_id);
            
            preparedStatement.executeUpdate();
            if(knt ==1)
            {
            conn.commit();
            }
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/personel_guncelleme hata");
        }      
    }
     
     public ArrayList<menu> menuler_() throws SQLException
    {
        baglan();
       
        String sql_query="select * from menuler where durum != 'Sil' ORDER BY sira_no ASC "; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<menu> list = new ArrayList<>();

        while (rs.next()) 
        {
           menu mn =new menu();
           
           mn.setMenu_id(rs.getInt("menu_id"));
           mn.setBaslik(rs.getString("baslik"));
           mn.setIcerik(rs.getString("icerik"));          
           mn.setSira_no(rs.getInt("sira_no"));          
           mn.setDurum(rs.getString("durum"));
           mn.setMenu_tipi(rs.getString("menu_tipi"));
           mn.setUrl(rs.getString("link"));
      
           list.add(mn);
        }
        
        preparedStatement.close();
        return list;
    }
     
      public ArrayList<menu> menuler_gunc(int id) throws SQLException
    {
        baglan();
    
        String sql_query="select * from menuler where menu_id="+id; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<menu> list = new ArrayList<>();

        while (rs.next()) 
        {
           menu mn =new menu();
           
           mn.setMenu_id(rs.getInt("menu_id"));
           mn.setBaslik(rs.getString("baslik"));
           mn.setIcerik(rs.getString("icerik"));          
           mn.setSira_no(rs.getInt("sira_no"));          
           mn.setDurum(rs.getString("durum"));
           mn.setMenu_tipi(rs.getString("menu_tipi"));
           mn.setUrl(rs.getString("link"));
      
           list.add(mn);
        }
        
        preparedStatement.close();
        return list;
    }
     // db.menu_ekle(baslik, durum, icerik,menu_tip,sira_no);
     public void menu_ekle(String baslik,String durum,String icerik,String menu_tip,int sira_no,String url)
    {
        try 
        {           
            baglan(); 
            menu_ekle_sira_kont(sira_no);
          
            String sorgu = "INSERT INTO menuler (baslik,icerik,sira_no,durum,menu_tipi,link) VALUES (?,?,?,?,?,?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,baslik);
            preparedStatement.setString(2,icerik);
            preparedStatement.setInt(3,sira_no);
            preparedStatement.setString(4,durum);
            preparedStatement.setString(5,menu_tip);
            preparedStatement.setString(6,url);
                      
            preparedStatement.executeUpdate();
            conn.commit();
            preparedStatement.close();
             // güncelleme yapılınca böyle
            
         
        } catch (Exception ex) 
        {
            System.out.println("menu ekle hata");
        }
    }
     
     public void menu_ekle_sira_kont(int sira_) 
    {   //eyer personel_sıra ekle daha önceki bi sırayı verdiyse burda sonraki degerler 1 arttırılıp oraya o girer
         
        int sıra=0;
        
        String sql_query ="select sira_no from menuler   ";
        
        try {
     
        preparedStatement = conn.prepareStatement(sql_query);
        
        ResultSet rs = preparedStatement.executeQuery();
         conn.setAutoCommit(false); // sorgu konturollerini biz yapacaz sistemde durduruyoruz oto konturolü 
        while (rs.next()) 
        {
             
          sıra = rs.getInt("sira_no");   
            
          if(sira_ == sıra )
          {
            
            System.out.println(sıra);
            String sorgu = "Update menuler Set sira_no = sira_no+1 where sira_no >= ? ";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setInt(1, sira_);
            preparedStatement.executeUpdate();         
          }           
        }        
        } catch (Exception ex) {
            System.out.println("menu_ekle_sira_kont de hata");
        }    
    }
     
     //db.menu_guncelle(baslik,tip, icerik, durum,sira_no, m_id);
    public void menu_guncelle(String baslik ,String icerik,String durum,int sira_no,int m_id,int knt,String url) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {
        
        String sorgu = "Update menuler Set baslik= ?  , icerik=? , durum=? , sira_no=? , link=?  where menu_id  = ? ";
        try {            
            
            
            baglan();
            if(knt ==1)
            {
                menu_ekle_sira_kont(sira_no);
            }
            
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1, baslik); //1. soru işareti yerine paremetredeki date gelsin            
            preparedStatement.setString(2, icerik); //1. soru işareti yerine paremetredeki date gelsin
            preparedStatement.setString (3, durum);
            preparedStatement.setInt(4, sira_no);
            preparedStatement.setString (5, url);
            preparedStatement.setInt(6, m_id);
            
            
            preparedStatement.executeUpdate();
            if(knt ==1)
            {
            conn.commit();
            }
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/menu_guncelle hata");
        }      
    } 
    
    public void menu_sil(int id)
     {
         String sil="Sil";
         int sıra_no =0;
         String sorgu = "Update menuler Set durum = ? where menu_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);      
            preparedStatement.setInt(2,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("Menü sil hata");
        }        
     }
    
    
    public ArrayList<acilir_menu> acilir_menuler_() throws SQLException
    {
        baglan();
       
        String sql_query="select * from acilir_menuler ORDER BY sira_no ASC "; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<acilir_menu> list = new ArrayList<>();

        while (rs.next()) 
        {
           acilir_menu a_mn =new acilir_menu();
           
           a_mn.setAcilir_menu_id(rs.getInt("acilir_menu_id"));
           a_mn.setMenu_id(rs.getInt("menu_id"));
           a_mn.setBaslik(rs.getString("baslik"));
           a_mn.setIcerik(rs.getString("icerik"));          
           a_mn.setSira_no(rs.getInt("sira_no"));          
           a_mn.setDurum(rs.getString("durum"));
           a_mn.setUrl(rs.getString("link"));
          
           
           list.add(a_mn);
        }
        
        preparedStatement.close();
        return list;
    }
    
    public ArrayList<acilir_menu> acilir_menuler_gunc(int id) throws SQLException
    {
        baglan();
       
        String sql_query="select * from acilir_menuler where acilir_menu_id = ? "; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        preparedStatement.setInt(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<acilir_menu> list = new ArrayList<>();

        while (rs.next()) 
        {
           acilir_menu a_mn =new acilir_menu();
           
           a_mn.setAcilir_menu_id(rs.getInt("acilir_menu_id"));
           a_mn.setMenu_id(rs.getInt("menu_id"));
           a_mn.setBaslik(rs.getString("baslik"));
           a_mn.setIcerik(rs.getString("icerik"));          
           a_mn.setSira_no(rs.getInt("sira_no"));          
           a_mn.setDurum(rs.getString("durum"));
           a_mn.setUrl(rs.getString("link"));
          
           
           list.add(a_mn);
        }
        
        preparedStatement.close();
        return list;
    }
    
    public void a_menu_sira_guncelle(int sira_no ,int acl_m_id ,int knt) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {
        
        String sorgu = "Update acilir_menuler Set  sira_no=?  where acilir_menu_id  = ? ";
        try {                 
            
            baglan();
            if(knt ==1)
            {
                acl_menu_sira_kont(sira_no);
            }
            
            preparedStatement = conn.prepareStatement(sorgu);  
            preparedStatement.setInt(1, sira_no);
            preparedStatement.setInt(2, acl_m_id);
            
            preparedStatement.executeUpdate();
            if(knt ==1)
            {
            conn.commit();
            }
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/acl_sira_menu_guncelle hata");
        }      
    }
    
    public void acl_menu_sira_kont(int sira_) 
    {   //eyer personel_sıra ekle daha önceki bi sırayı verdiyse burda sonraki degerler 1 arttırılıp oraya o girer
         
        int sıra=0;
        
        String sql_query ="select sira_no from acilir_menuler ";
        
        try {
     
        preparedStatement = conn.prepareStatement(sql_query);
        
        ResultSet rs = preparedStatement.executeQuery();
        conn.setAutoCommit(false); // sorgu konturollerini biz yapacaz sistemde durduruyoruz oto konturolü 
        while (rs.next()) 
        {
             
          sıra = rs.getInt("sira_no");      
          if(sira_ == sıra )
          {
           
            String sorgu = "Update acilir_menuler Set sira_no = sira_no+1 where sira_no >= ? ";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setInt(1, sira_);
            preparedStatement.executeUpdate();         
          }           
        }        
        } catch (Exception ex) {
            System.out.println("acl_menu_ekle_sira_kont de hata");
        }    
    }
    
    
    
    public void alt_acilir_menu_ekle(String baslik,String durum,String icerik,int sira_no,int m_id,String url)
    {
        try 
        {           
            baglan(); 
            acl_menu_sira_kont(sira_no);
                      
            String sorgu = "INSERT INTO acilir_menuler (baslik,icerik,sira_no,durum,menu_id,link) VALUES (?,?,?,?,?,?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,baslik);
            preparedStatement.setString(2,icerik);
            preparedStatement.setInt(3,sira_no);
            preparedStatement.setString(4,durum);
            preparedStatement.setInt(5,m_id);
            preparedStatement.setString(6,url);
            
            preparedStatement.executeUpdate();
            conn.commit();
            preparedStatement.close();
             // güncelleme yapılınca böyle
            
         
        } catch (Exception ex) 
        {
            System.out.println("acilir_menu ekle hata");
        }
    }
    
    
    
    public void alt_menu_sil(int id)
     {
         String sil="Sil";
         int sıra_no =0;
         String sorgu = "Update acilir_menuler Set durum = ? ,sira_no =?  where acilir_menu_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);      
            preparedStatement.setInt(2,sıra_no);
            preparedStatement.setInt(3,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("Menü sil hata");
        }        
     }
    
    
    public void alt_acilir_menu_guncelle(String baslik ,String icerik,String durum,int sira_no,int m_id,int alt_m_id,int knt,String url) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
    {
        
        String sorgu = "Update acilir_menuler Set baslik= ?  , icerik=? , durum=? , sira_no=? ,menu_id=? ,link=?  where acilir_menu_id  = ? ";
        try {            
            
            baglan();
            if(knt ==1)
            {
                acl_menu_sira_kont(sira_no);
            }
            
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1, baslik); //1. soru işareti yerine paremetredeki date gelsin            
            preparedStatement.setString(2, icerik); //1. soru işareti yerine paremetredeki date gelsin
            preparedStatement.setString (3, durum);
            preparedStatement.setInt(4, sira_no);
            preparedStatement.setInt(5, m_id);
            preparedStatement.setString (6, url);
            preparedStatement.setInt(7, alt_m_id);
            
            preparedStatement.executeUpdate();
            if(knt ==1)
            {
            conn.commit();
            }
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/menu_alt_guncelle hata");
        }      
    } 
  

   public void slider_sil(int id)
     {
         String sil="Sil";
         String sorgu = "Update sliderlar Set durum = ?   where slider_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
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
   
   public void resim_ekle(String resim)
    {
        String durum ="Aktif";
        String icerik ="";
        try 
        {           
            baglan(); 
            
            String sorgu = "INSERT INTO sliderlar (resim,durum,icerik) VALUES (?,?,?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,resim);
            preparedStatement.setString(2,durum);
            preparedStatement.setString(3,icerik);
   
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
             // güncelleme yapılınca böyle
                    
        } catch (Exception ex) 
        {
            System.out.println("resim ekle hata");
        }
    }
   
   public void link_ekle(String link)
    {
        
        try 
        {           
            baglan(); 
            
            String sorgu = "INSERT INTO linkler (link) VALUES (?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,link);
            
   
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
             // güncelleme yapılınca böyle
                    
        } catch (Exception ex) 
        {
            System.out.println("link ekle hata");
        }
    }
   
   public ArrayList<boostrap> boostraplar() throws SQLException
    {
        baglan();
       
        String sql_query="select * from boostrap_db "; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<boostrap> list = new ArrayList<>();

        while (rs.next()) 
        {
           boostrap bst =new boostrap();
           
           bst.setModal_id(rs.getInt("modal_id"));
           bst.setBaslik(rs.getString("baslik"));
           bst.setIcerik(rs.getString("icerik"));                   
           bst.setDurum(rs.getString("durum"));
           bst.setSayfa(rs.getString("sayfa"));
          
           
           list.add(bst);
        }
        
        preparedStatement.close();
        return list;
    } //db.bootstrap_ekle(baslik, durum, icerik,sayfa);
  
   public void bootstrap_ekle(String baslik,String durum,String icerik,String sayfa,int knt)
    {
        try 
        {           
            baglan(); 
            
            if(knt == 1)
            {
                 boostrap_knt(sayfa,"ekle",0);
            }
            String sorgu = "INSERT INTO boostrap_db (sayfa,baslik,icerik,durum) VALUES (?,?,?,?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sayfa);
            preparedStatement.setString(2,baslik);
            preparedStatement.setString(3,icerik);
            preparedStatement.setString(4,durum);
            
   
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
             // güncelleme yapılınca böyle
                    
        } catch (Exception ex) 
        {
            System.out.println("bootstrap_ekle ekle hata");
        }
    }
   
      public void bootstrap_sil(int id)
     {
         String sil="Sil";
         String sorgu = "Update boostrap_db Set durum = ?   where modal_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);      
            preparedStatement.setInt(2,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("bootsrap sil hata");
        }        
     }
      
      public void boostrap_knt(String sayfa,String nerden,int id) 
    {   //burası eger eklenen aktif se , sayfası aynı olan diger verileri bekleme deye cekme yeri
         
        try {    
          //conn.setAutoCommit(false); // sorgu konturollerini biz yapacaz sistemde durduruyoruz oto konturolü    
            
            String durum = "Beklemede";
            if(nerden.equals("ekle"))
            {
                String sorgu = "Update boostrap_db Set durum = ? where sayfa = ? and durum != ? ";
                preparedStatement = conn.prepareStatement(sorgu);
                preparedStatement.setString(1, durum);
                preparedStatement.setString(2, sayfa);
                preparedStatement.setString(3, "Sil");
                preparedStatement.executeUpdate();
            }
            else if(nerden.equals("guncelle"))
            {
                String sorgu = "Update boostrap_db Set durum = ? where sayfa = ? and durum != ? and modal_id != ?  ";
                preparedStatement = conn.prepareStatement(sorgu);
                preparedStatement.setString(1, durum);
                preparedStatement.setString(2, sayfa);
                preparedStatement.setString(3, "Sil");
                preparedStatement.setInt(4, id);
                preparedStatement.executeUpdate();
            }
            
                     
            
        } catch (Exception ex) {
            System.out.println("boostrap_knt de hata");
        }    
    }
      
    public void boostrap_guncelle(String sayfa ,String baslik,String icerik,String durum,int modal_id,int knt)
    {
        
        String sorgu = "Update boostrap_db Set sayfa= ?  , baslik=? , icerik=? , durum=?  where modal_id = ? ";
        try {            
            
            baglan();
            if(knt == 1)
            {
               boostrap_knt(sayfa,"guncelle",modal_id);
            }
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1, sayfa); //1. soru işareti yerine paremetredeki date gelsin            
            preparedStatement.setString(2, baslik); //1. soru işareti yerine paremetredeki date gelsin
            preparedStatement.setString (3, icerik);           
            preparedStatement.setString (4,durum);
            preparedStatement.setInt(5, modal_id);
            
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/boostrap_guncelle hata");
        }      
    }
    

    
    public ArrayList<etkinlik> etkinlikler() throws SQLException
    {
        baglan();
       
        String sql_query="select * from etkinlikler "; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<etkinlik> list = new ArrayList<>();

        while (rs.next()) 
        {
           etkinlik abv =new etkinlik();
           
           abv.setEtknlik_id(rs.getInt("etkinlik_id"));
           abv.setEtknlik_baslik(rs.getString("etkinlik_baslik"));
           abv.setEtknlik_foto(rs.getString("etkinlik_foto")); 
           abv.setEtknlik_durum(rs.getString("etkinlik_durum"));
           abv.setEtknlik_icerik(rs.getString("etkinlik_icerik"));
           abv.setEtknlik_baslangic_tarihi(rs.getTimestamp("etkinlik_baslangic_trh"));
           abv.setEtknlik_bitis_tarihi(rs.getTimestamp("etkinlik_bitis_trh"));
           
           list.add(abv);
        }
        preparedStatement.close();
        return list;
    }
    
    public void Etkinlik_ekle(String Etknlik_baslik ,String Etknlik_durum ,String etknlk_bslngc_trh ,String etknlk_bts_trh ,String Etknlik_icerik,String etkinlik_foto)
    {//setEtknlik_baslik,setEtknlik_durum,etknlk_bslngc_trh,etknlk_bts_trh,setEtknlik_icerik
        try 
        {           
            baglan(); 
            
            String sorgu = "INSERT INTO etkinlikler (etkinlik_baslik,etkinlik_foto,etkinlik_durum,etkinlik_icerik,etkinlik_baslangic_trh,etkinlik_bitis_trh) VALUES (?,?,?,?,?,?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,Etknlik_baslik);
            preparedStatement.setString(2,etkinlik_foto);
            preparedStatement.setString(3,Etknlik_durum);
            preparedStatement.setString(4,Etknlik_icerik);
            preparedStatement.setString(5,etknlk_bslngc_trh);
            preparedStatement.setString(6,etknlk_bts_trh);
            
            
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
             // güncelleme yapılınca böyle
                    
        } catch (Exception ex) 
        {
            System.out.println("abone Etkinlik_ekle  hata");
        }
    }
    
    public void etkinlik_sil(int id)
     {
         String sil="Sil";
         String sorgu = "Update etkinlikler Set etkinlik_durum = ?   where etkinlik_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);      
            preparedStatement.setInt(2,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("etkinlik_sil hata");
        }        
     }
    
    public void etkinlik_guncelle(String baslik ,String durum ,String foto ,String etk_bsl_trh ,String etk_bts_trh,String icerik,int etk_id)
    { 
        String sorgu = "Update etkinlikler Set etkinlik_baslik= ? , etkinlik_durum=? , etkinlik_foto=? , etkinlik_baslangic_trh=? , etkinlik_bitis_trh=? ,etkinlik_icerik=?  where etkinlik_id = ? ";
        try {             
            baglan();
           
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,baslik);
            preparedStatement.setString(2,durum);
            preparedStatement.setString(3,foto);
            preparedStatement.setString(4,etk_bsl_trh);
            preparedStatement.setString(5,etk_bts_trh);
            preparedStatement.setString(6,icerik);
            preparedStatement.setInt(7,etk_id);
            
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/etkinlik_guncelle hata");
        }      
    }
    
    public ArrayList<veritabanlari> vt_lari() throws SQLException
    {
        baglan();
       
        String sql_query="select * from veritabanlari "; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<veritabanlari> list = new ArrayList<>();

        while (rs.next()) 
        {
           veritabanlari abv =new veritabanlari();
           
           abv.setVt_id(rs.getInt("vt_id"));
           abv.setVt_isim(rs.getString("vt_ismi"));
           abv.setVt_logo(rs.getString("vt_logo")); 
           abv.setVt_aciklama(rs.getString("vt_aciklama"));
           abv.setVt_icerik(rs.getString("vt_icerik"));
           abv.setVt_acilis_tarihi(rs.getTimestamp("vt_acilis_trh"));
           abv.setVt_kapanis_tarihi(rs.getTimestamp("vt_kapanis_trh"));
           abv.setVt_durum(rs.getString("vt_durum"));
           abv.setVt_dokuman(rs.getString("vt_documan"));
           abv.setVt_katagori(rs.getString("vt_katagori"));
           abv.setVt_tur(rs.getString("vt_tur"));
           list.add(abv);
        }
        preparedStatement.close();
        return list;
    }
    
    
    public void vt_ekle(String vt_isim ,String vt_logo ,String vt_aciklama ,String vt_icerik ,String vt_durum,String vt_documan,String vt_acls_trh,String vt_kpns_trh,String vt_alan,String vt_tur)
    {
        try 
        {           
            baglan(); 
            
            String sorgu = "INSERT INTO veritabanlari (vt_ismi,vt_logo,vt_aciklama,vt_icerik,vt_durum,vt_documan,vt_acilis_trh,vt_kapanis_trh,vt_katagori,vt_tur) VALUES (?,?,?,?,?,?,?,?,?,?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,vt_isim);
            preparedStatement.setString(2,vt_logo);
            preparedStatement.setString(3,vt_aciklama);
            preparedStatement.setString(4,vt_icerik);
            preparedStatement.setString(5,vt_durum);
            preparedStatement.setString(6,vt_documan);
            preparedStatement.setString(7,vt_acls_trh);
            preparedStatement.setString(8,vt_kpns_trh);
            preparedStatement.setString(9,vt_alan);
            preparedStatement.setString(10,vt_tur);
   
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
             // güncelleme yapılınca böyle
                    
        } catch (Exception ex) 
        {
            System.out.println("veritabanı ekle hata");
        }
    }
    
    public void vt_dokuman_sil(String vt_documan,int vt_id)
    {
        
        String sorgu = "Update veritabanlari Set vt_documan=? where vt_id = ? ";
        try {             
            baglan();
           
            preparedStatement = conn.prepareStatement(sorgu);
            
            preparedStatement.setString(1,vt_documan);
            preparedStatement.setInt(2,vt_id);
            
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/deneme_vt_dokuman_sil hata");
        }      
    }
    
    public void vt_guncelle(String vt_isim ,String vt_logo ,String vt_aciklama ,String vt_icerik ,String vt_durum,String vt_dokuman,int vt_id,String vt_acls_trh,String vt_kpns_trh,String vt_alan)
    {
        
        String sorgu = "Update veritabanlari Set vt_ismi= ? , vt_logo=? , vt_aciklama=? , vt_icerik=? , vt_durum=? ,vt_documan=? ,vt_acilis_trh=? ,vt_kapanis_trh=? ,vt_katagori=?  where vt_id = ? ";
        try {             
            baglan();
           
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,vt_isim);
            preparedStatement.setString(2,vt_logo);
            preparedStatement.setString(3,vt_aciklama);
            preparedStatement.setString(4,vt_icerik);
            preparedStatement.setString(5,vt_durum);
            preparedStatement.setString(6,vt_dokuman);
            preparedStatement.setString(7,vt_acls_trh);
            preparedStatement.setString(8,vt_kpns_trh);
            preparedStatement.setString(9,vt_alan);
            preparedStatement.setInt(10,vt_id);
            
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/ vt_guncelle hata");
        }      
    }
    
    public void vt_sil(int id)
     {
         String sil="Sil";
         String sorgu = "Update veritabanlari Set vt_durum = ?   where vt_id = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);      
            preparedStatement.setInt(2,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("Abone veritabanı sil hata");
        }        
     }
    
    public ArrayList<haber> haberlerr() throws SQLException
    {
        baglan();
       
        String sql_query="select * from haberler "; //DESC
        preparedStatement = conn.prepareStatement(sql_query);
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<haber> list = new ArrayList<>();

        while (rs.next()) 
        {
           haber abv =new haber();
           
           abv.setHbr_id(rs.getInt("haber_id"));
           abv.setHbr_baslik(rs.getString("haber_baslik"));
           abv.setHbr_foto(rs.getString("haber_foto")); 
           abv.setHbr_durum(rs.getString("haber_durum"));
           abv.setHbr_icerik(rs.getString("haber_icerik"));
           abv.setHbr_trh(rs.getTimestamp("haber_tarih"));
           
           list.add(abv);
        }
        preparedStatement.close();
        return list;
    }
    
    public void haber_ekle(String haber_baslik ,String haber_foto ,String haber_durum ,String haber_icerik ,String haber_tarih)
    {//setEtknlik_baslik,setEtknlik_durum,etknlk_bslngc_trh,etknlk_bts_trh,setEtknlik_icerik
        try 
        {           
            baglan(); 
            
            String sorgu = "INSERT INTO haberler (haber_baslik,haber_foto,haber_durum,haber_icerik,haber_tarih) VALUES (?,?,?,?,?)";
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,haber_baslik);
            preparedStatement.setString(2,haber_foto);
            preparedStatement.setString(3,haber_durum);
            preparedStatement.setString(4,haber_icerik);
            preparedStatement.setString(5,haber_tarih);
         
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
             // güncelleme yapılınca böyle
                    
        } catch (Exception ex) 
        {
            System.out.println("Haber_ekle  hata");
        }
    }
    
    public void haber_sil(int id)
     {
         String sil="Sil";
         String sorgu = "Update haberler Set haber_durum = ?   where haber_id  = ? ";
         //"Update personel_bolumler Set bolum_adi= ? , durum= ? , sira_no=? where bolum_id  = ? ";
         try {
            baglan();
            
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,sil);      
            preparedStatement.setInt(2,id);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception ex) 
        {
            System.out.println("Haber sil hata");
        }        
     }
    
    public void haber_guncelle(String haber_baslik ,String haber_foto ,String haber_durum ,String haber_icerik ,String haber_tarih,int haber_id)
    { 
        String sorgu = "Update haberler Set haber_baslik= ? , haber_foto=? , haber_durum=? , haber_icerik=? , haber_tarih=?  where haber_id = ? ";
        try {             
            baglan();
           
            preparedStatement = conn.prepareStatement(sorgu);
            preparedStatement.setString(1,haber_baslik);
            preparedStatement.setString(2,haber_foto);
            preparedStatement.setString(3,haber_durum);
            preparedStatement.setString(4,haber_icerik);
            preparedStatement.setString(5,haber_tarih);
            preparedStatement.setInt(6,haber_id );
            
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            
        } catch (Exception ex) 
        {
            System.out.println("db_katmanı/haber_guncelle hata");
        }      
    }
    
    
    public static void main(String[] args) 
    {
        db_katmani db = new db_katmani();
        
        //db.baglan();
        
        //db.ver_guncelle("imnever0729", "1", "Talha", "Fırat", "admin", 1);
        //(int id,String durum,String ad,int sıra_no,int knt)
        //db.bolum_bilgi_guncelleme(4,"Aktif","Idari Ve Mali Isler",5,1);
        //db.bolum_bilgi_guncelleme(22, "Aktif", "Tarhana", 15,1);
        //db.bolum_sil("Tiyatro");
        // public void personel_gorev_ekle(int bol_id,String bolum_adi,String durum ,int sira_no)
        //db.personel_gorev_ekle("leman", "Aktif", 1,1);
        
        //db.gorev_sil(11);
        //public void gorev_bilgi_guncelleme(int id,String durum,String ad,int sıra_no,int knt) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
        //db.gorev_bilgi_guncelleme(5,"Beklemede","Gidiyozzz",1,1);
        
        //public void personel_ekle(String ad_soyad,String unvan,String email,int cep_tel,int dahili_tel ,int sira_no,int g_id)
        //db.personel_ekle("ali", "uzay", "uzayli", 4, 9, 2, 3);
        //db.personel_sil(3);
        //public void personel_guncelle(String ad_soyad,String unvan,String email,int cep_tel,int dahili_tel ,int sira_no,int k_id,int knt) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
        //db.personel_guncelle("tetete", "cavus", "hty.gmail.com", 56, 45, 1, 8, 1);
        //db.duyuru_sil(1);
        //public void duyuru_guncelle(String baslik,String icerik,String durum,int id)
        //db.duyuru_guncelle("Sil", "Sil", "Aktif", 2);
        //db.menu_ekle("yakup tatar", "Aktif", "cemil meric", "acilir", 44);
        //public void acilir_menu_ekle(String baslik,String durum,String icerik,int sira_no,int m_id)
        //db.acilir_menu_ekle("sinek", "Beklemede", "asdas", 1, 1);
        //  public void alt_acilir_menu_guncelle(String baslik ,String icerik,String durum,int sira_no,int m_id,int alt_m_id,int knt) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
        //db.alt_acilir_menu_guncelle("Ordek", "ordekler yurur", "Aktif",3 ,1 , 11, 1);
        //public void a_menu_sira_guncelle(int sira_no ,int acl_m_id ,int knt)
        //db.slider_sil(1);
        //db.resim_ekle("mecnun");
        //abone_vt_ekle(String vt_isim ,String vt_logo ,String vt_aciklama ,String vt_icerik ,String vt_durum)
        //db.abone_vt_ekle("asd", "asd", "asd", "assd", "asd","zz");
        //public void abone_vt_guncelle(String vt_isim ,String vt_logo ,String vt_aciklama ,String vt_icerik ,String vt_durum,String vt_documan,int vt_id)
        //db.abone_vt_guncelle("tt", "aa", "asd", "asd", "asd","zz", 2);
        //db.abone_vt_dokuman_sil("yyy", 1);
        //db.trh_dene();
        //db.personel_bolum_ekle("son10", "Aktif", 8);
   }
}