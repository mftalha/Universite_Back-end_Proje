<%-- 
    Document   : konturol
    Created on : 12.Eki.2021, 15:50:12
    Author     : casper
--%>

<%@page import="veri.per_gorevler"%>
<%@page import="veri.personel_bolmlr"%>
<%@page import="veri.duyuru"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="veri.kisi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>

<%      
    
        //konturol.jsp olacak
          if(request.getParameter("mail") != null && request.getParameter("sifre") !=null && request.getParameter("mail") !=""  && request.getParameter("sifre") !="" )
          {
              String mail = request.getParameter("mail"); //fomdan gelen verileri getparemeterla aldım
              String sifre = request.getParameter("sifre"); //get paremater her sayfada gönderip almayı ben yapmak zorundayım

          //HttpSession asda = request.getSession(); // sunucuda bir session değişkeni tanımladım bunla değişkenlerimi istediğim sayfadan koyup istediğim sayfadan alabilecem
          //her sayfa için asda gibi sesion değişkeni ayrı ayrı açmalıyım içi duruyor,erişim için.


            veri.db_katmani db = new veri.db_katmani();
            ArrayList<kisi>  ss=  db.kullanici_b(mail, sifre); 
            //session.setAttribute("kontrol", "asd");
            //veri.kisi knt = new veri.kisi(); 
         
            if(ss.size() > 0 )
            {   // girilen sifre dogruysa

                session.setAttribute("kullanicibilgisi", ss);
                int id =ss.get(0).getId();

                /*
                Date s_erisim_t = new Date(session.getLastAccessedTime()); //bugunki giris zaman bilgileri maile atıyorum
                String s_erisim = s_erisim_t.toString();  //son erişim zamanını değiştiriyorum
                ss.get(0).setSon_islem_tarihi(s_erisim);  
                //out.println(s_erisim);    */

                db.son_bag(id);
                int sayac =ss.get(0).getGiris_sayisi(); //giris sayısını güncelliyorum

                sayac+=1;
                ss.get(0).setGiris_sayisi(sayac);
                db.giris_sayisi_guncelleme(sayac, id);

                response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=index");           
          }
          else
          {
             String durum = "yanlis";

             response.sendRedirect("http://localhost:8080/Library_project/modul/login.jsp?durum=yanlis");

             //request.setAttribute("kontrol", "Mail yada Sifre yanlış");
          }
            
          }
          
    
%> 