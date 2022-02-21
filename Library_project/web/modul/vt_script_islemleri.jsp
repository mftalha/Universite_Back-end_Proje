<%-- 
    Document   : vt_script_islemleri
    Created on : 23.Ara.2021, 14:17:49
    Author     : casper
--%>

<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    System.out.println("post geldi");
    if(request.getParameter("islem") != "" && request.getParameter("islem") != null)
    {
    db_katmani db = new db_katmani();
    System.out.println("ab_vt_sc");
    if(request.getParameter("islem").equals("sil"))
    {

     if(request.getParameter("id") != "" && request.getParameter("id") != null && request.getParameter("documan") != "" && request.getParameter("documan") != null)
      {
        int id = Integer.parseInt((String)request.getParameter("id"));
        String dokuman = request.getParameter("documan");
        System.out.println(dokuman);
        String birlestir="{\"linkler\":"+dokuman;
        System.out.println("birlestir="+birlestir);
        System.out.println(id);
        
        /*
        for(int i=0;i<dokuman.length();i++)
        {
            //System.out.println(dokuman.charAt(i)); s.replace("donusecek","donusen");
            if(dokuman.charAt(i) == '"')
            {
                birlestir+="'";
            }
            else
            {
                birlestir+=dokuman.charAt(i);
            }
        }
        */
        
        System.out.println("sc birlestir ="+birlestir);
        birlestir+="}";
        
        db.vt_dokuman_sil(birlestir, id);
        //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul/ara_islm&r_id="+id);
      }
       }
        
        if(request.getParameter("islem").equals("guncelle"))
        {
            System.out.println("gnc");
            System.out.println(request.getParameter("documan"));
            if(request.getParameter("id") != "" && request.getParameter("id") != null && request.getParameter("documan") != "" && request.getParameter("documan") != null && request.getParameter("vt_isim") != "" && request.getParameter("vt_isim") != null && request.getParameter("vt_logo") != "" && request.getParameter("vt_logo") != null  && request.getParameter("vt_durum") != "" && request.getParameter("vt_durum") != null)
            {
                        int id = Integer.parseInt((String)request.getParameter("id"));
                        String dokuman = request.getParameter("documan");
                        System.out.println(dokuman);
                        String vt_isim = request.getParameter("vt_isim");
                        String vt_logo = request.getParameter("vt_logo");
                        String vt_aciklama = request.getParameter("vt_aciklama");
                        String vt_durum = request.getParameter("vt_durum");
                        String vt_icerik = request.getParameter("vt_icerik");
                        //vt_icerik ="<p>"+vt_icerik+"</p>";
                        //vt_icerik = vt_icerik.replace(";;;","");
                        //vt_icerik =vt_icerik.replace(";;;;;","p>");
                        //System.out.println("vt_isim:"+vt_isim);
                        //System.out.println("vt_logo:"+vt_logo);
                        //System.out.println("vt_aciklama:"+vt_aciklama);
                        //System.out.println("vt_durum:"+vt_durum);
                        System.out.println("vt_icerik sc:"+vt_icerik);
                        
                        //String birlestir="{'linkler':";
                        String birlestir="{\"linkler\":"+dokuman;
                        System.out.println("birlestir="+birlestir);
                        System.out.println(id);
                        /*
                        for(int i=0;i<dokuman.length();i++)
                        {
                            //System.out.println(dokuman.charAt(i)); s.replace("donusecek","donusen");
                            if(dokuman.charAt(i) == '"')
                            {
                                birlestir+="'";
                            }
                            else
                            {
                                birlestir+=dokuman.charAt(i);
                            }
                        }
                        */
                        birlestir+="}";
                        System.out.println("birlestir?"+birlestir);
                        String vt_acls_trh = request.getParameter("vt_acls_trh");
                        String vt_kpns_trh = request.getParameter("vt_kpns_trh");
                        String vt_alan = request.getParameter("vt_alan");
                        db.vt_guncelle(vt_isim, vt_logo, vt_aciklama, vt_icerik, vt_durum,birlestir, id,vt_acls_trh,vt_kpns_trh,vt_alan);
                        //db.abone_vt_dokuman_guncelle(birlestir, id);
            }
        }
    }
%>

