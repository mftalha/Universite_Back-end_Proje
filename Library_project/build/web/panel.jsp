<%-- 
    Document   : panel
    Created on : 12.Eki.2021, 10:58:53
    Author     : casper
--%>

<%@page import="veri.personel_bolmlr"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <link rel="apple-touch-icon" href="app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i%7CQuicksand:300,400,500,700" rel="stylesheet">
    <!-- BEGIN VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/vendors.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/icheck/icheck.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/icheck/custom.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/toggle/switchery.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/selects/select2.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/spinner/jquery.bootstrap-touchspin.css">
    

    <!-- END VENDOR CSS-->
    <!-- BEGIN MODERN CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/app.css">
    <!-- END MODERN CSS-->
    <!-- BEGIN Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/hospital.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/switch.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/colors/palette-callout.css">
    <!-- END Page Level CSS-->
    <!-- BEGIN Custom CSS-->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <!-- END Custom CSS-->
    <!--
    <!-- html editör link leri 
    <link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
    <link rel="stylesheet" href="examples.css" type="text/css" />   -->
    <!-- Bootstrap  == bunu kaldırınca normale dönüyor sayfa düzeni 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    -->
    
    
</head>
<body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar" data-open="click" data-menu="vertical-menu" data-col="2-columns">
    <%
        String modul =(String) request.getParameter("modul");
        
        
        if(modul == null)
        {
                     
            response.sendRedirect("modul/login.jsp");               
        }
        
        if(modul != null)
        {
            %>
            <jsp:include page = "modul/ust.jsp"/>
            </br>
            <%
            if(modul.equals("index"))

                {
            %>        
                    <jsp:include page = "modul/index.jsp"/>
            <%            
                }
            
            if(modul.equals("profil"))

                {
            %>        
                    <jsp:include page = "modul/profil.jsp"/>
            <%            
                }

            if(modul.equals("sifre_degis"))

                {
            %>        
                    <jsp:include page = "modul/sifre_degis.jsp"/>
            <%            
                }

            

            if(modul.equals("cikis"))

                {
            %>        
                    <%@page language="java" session="false"%> 
                    <% response.sendRedirect("modul/login.jsp"); 
                     //sesionu kapattım ve çıkış yaptım   %> 
            <%            
                }

            if(modul.equals("guncelle"))

                {
            %>        
                    <jsp:include page = "modul/sifre_guncelle_kon.jsp"/> 
                     
            <%            
                }

            if(modul.equals("duyuru_ekle"))

                {
            %>        
                    <jsp:include page = "modul/duyuru_ekle.jsp"/> 
                     
            <%            
                }

            if(modul.equals("duyuru_guncelle"))//duyuru_sil

                {
            %>        
                    <jsp:include page = "modul/duyuru_guncelle.jsp"/> 
                     
            <%            
                }

            if(modul.equals("duyuru_guncelle_isl"))//duyuru_sil

                {
            %>        
                    <jsp:include page = "modul/duyuru_gnc_isl.jsp"/> 
                     
            <%            
                }


                if(modul.equals("duyuru_sil"))//duyuru_sil

                {
            %>        
                    <jsp:include page = "modul/duyuru_sil.jsp?"/> 
                     
            <%            
                }


                
               if(modul.equals("duyuru_islm"))//duyuru_sil

                {
            %>        
                    <jsp:include page = "modul/duyuru_islemler.jsp?"/> 
                     
            <%            
                }

            if(modul.equals("personel_gorev"))

                {
                
                
            %>        
                    <jsp:include page = "modul/personel_bolum_gorevler.jsp"/> 
                     
            <%            
                }

               if(modul.equals("prs_blm_ekl"))

                {
                
                
            %>        
                    <jsp:include page = "modul/personel_bolum_ekle.jsp"/> 
                     
            <%            
                }

               
            if(modul.equals("prs_blm_gnc"))

                {  
                
            %>        
                    <jsp:include page = "modul/personel_blm_guncelle.jsp"/> 
                     
            <%            
                }


             if(modul.equals("prs_blm_sl"))

                {      
                
            %>        
                    <jsp:include page = "modul/personel_bolum_sil.jsp"/> 
                     
            <%            
                }


            if(modul.equals("prs_grv_ekl"))

                {      
                String id = request.getParameter("ıd");
            %>        
                    <jsp:include page = "modul/personel_gorev_ekle.jsp?gnd=<%=id %>"/> 
                     
            <%            
                }


            
            if(modul.equals("prs_grv_sl"))

                {  
                                
            %>        
                    <jsp:include page = "modul/personel_bolum_gorevler.jsp"/> 
                  
            <%            
                }

                
            if(modul.equals("prs_grv_gnc"))

                {  
                                
            %>        
                    <jsp:include page = "modul/personel_gorev_guncelle.jsp"/> 
                  
            <%            
                } 

            if(modul.equals("prs_kisi"))

                {  
                                
            %>        
                    <jsp:include page = "modul/kisi_islm.jsp"/> 
                  
            <%            
                }


            if(modul.equals("prs_kisi_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/kisi_ekle.jsp"/> 
                  
            <%            
                }
                
            if(modul.equals("prs_kisi_guncelle"))
                {  
                                
            %>        
                    <jsp:include page = "modul/kisi_guncelle.jsp"/> 
                  
            <%            
                }

                

            
            if(modul.equals("menu_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/menu_ekle.jsp"/> 
                  
            <%            
                }

             
            if(modul.equals("menu_guncelle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/menu_guncelle.jsp"/> 
                  
            <%            
                }

                
             if(modul.equals("menu_guncelle_isl"))

                {  
                                
            %>        
                    <jsp:include page = "modul/menu_gnc_isl.jsp"/> 
                  
            <%            
                }

   
            
             if(modul.equals("menu"))

                {  
                                
            %>        
                    <jsp:include page = "modul/menuler.jsp"/> 
                  
            <%            
                }

            
           if(modul.equals("acilir_menu_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/menu_acilir_ekle.jsp"/> 
                  
            <%            
                }

             
           if(modul.equals("acilir_menu_guncelle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/menu_acilir_guncelle.jsp"/> 
                  
            <%            
                }

             
           if(modul.equals("alt_acilir_menu_guncelle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/menu_alt_acilir_guncelle.jsp"/> 
                  
            <%            
                }

                

           if(modul.equals("alt_acilir_menu_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/menu_alt_acilir_ekle.jsp"/> 
                  
            <%            
                }


            
            if(modul.equals("personel_islemler"))

                {  
                                
            %>        
                    <jsp:include page = "modul/personel_islemler.jsp"/> 
                  
            <%            
                }
            

            if(modul.equals("slider_islemler"))

                {  
                                
            %>        
                    <jsp:include page = "modul/slider_islemleri.jsp"/> 
                  
            <%            
                }



           if(modul.equals("slider_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/slider_ekle.jsp"/> 
                  
            <%            
                }


            if(modul.equals("resim_guncelleme"))

                {  
                                
            %>        
                    <jsp:include page = "modul/resim_guncelle.jsp"/> 
                  
            <%            
                }


            if(modul.equals("slider_gstr"))

                {  
                                
            %>        
                    <jsp:include page = "modul/slider_.jsp"/> 
                  
            <%            
                }


            if(modul.equals("resim_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/resim_ekle.jsp"/> 
                  
            <%            
                }

            if(modul.equals("personem_blm_islm"))

                {  
                                
            %>        
                    <jsp:include page = "modul/personel_bolum_islemleri.jsp"/> 
                  
            <%            
                }


            if(modul.equals("rsm_gstr"))

                {  
                                
            %>        
                    <jsp:include page = "modul/resim_goster.jsp"/> 
                  
            <%            
                }

            if(modul.equals("link_olstr"))

                {  
                                
            %>        
                    <jsp:include page = "modul/dosya_link_ulstur.jsp"/> 
                  
            <%            
                }


           if(modul.equals("modal_islemleri"))

                {  
                                
            %>        
                    <jsp:include page = "modul/bootstrap_islemleri.jsp"/> 
                  
            <%            
                }
            

            if(modul.equals("modal_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/boostrap_ekle.jsp"/> 
                  
            <%            
                }


            if(modul.equals("modal_guncelle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/bootstrap_guncelle.jsp"/> 
                  
            <%            
                }

            if(modul.equals("abone_vt_islmlr"))

                {  
                                
            %>        
                    <jsp:include page = "modul/abone_vt_islemleri.jsp"/> 
                  
            <%            
                }

            if(modul.equals("abone_vt_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/abone_vt_ekle.jsp"/> 
                  
            <%            
                }

            if(modul.equals("abone_vt_guncelle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/abone_vt_guncelle.jsp"/> 
                  
            <%            
                }

            if(modul.equals("abone_vt_logo_gstr"))

                {  
                                
            %>        
                    <jsp:include page = "modul/abone_vt_logo_goster.jsp"/> 
                  
            <%            
                }

            if(modul.equals("dokuman_gstr"))

                {  
                                
            %>        
                    <jsp:include page = "modul/documan_goster.jsp"/> 
                  
            <%            
                }
            
            if(modul.equals("deneme_vt_islmlr"))

                {  
                                
            %>        
                    <jsp:include page = "modul/deneme_vt_islemler.jsp"/> 
                  
            <%            
                }

            if(modul.equals("deneme_vt_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/deneme_vt_ekle.jsp"/> 
                  
            <%            
                }

            if(modul.equals("deneme_vt_guncelle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/deneme_vt_guncelle.jsp"/> 
                  
            <%            
                }

            if(modul.equals("deneme_vt_resm_goster"))

                {  
                                
            %>        
                    <jsp:include page = "modul/deneme_vt_resim_goster.jsp"/> 
                  
            <%            
                }

            if(modul.equals("etkinlik_islmlr"))

                {  
                                
            %>        
                    <jsp:include page = "modul/etkinlik_islemleri.jsp"/> 
                  
            <%            
                }

            if(modul.equals("etkinlik_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/etkinlik_ekle.jsp"/> 
                  
            <%            
                }

               
            if(modul.equals("etkinlik_guncelle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/etkinlik_guncelle.jsp"/> 
                  
            <%            
                }
                
            if(modul.equals("etkinlik_goster"))

                {  
                                
            %>        
                    <jsp:include page = "modul/etknlk_goster.jsp"/> 
                  
            <%            
                }


            if(modul.equals("haber_islm"))

                {  
                                
            %>        
                    <jsp:include page = "modul/haber_islemleri.jsp"/> 
                  
            <%            
                }

            if(modul.equals("hbr_ekle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/haber_ekle.jsp"/> 
                  
            <%            
                }

            if(modul.equals("hbr_guncelle"))

                {  
                                
            %>        
                    <jsp:include page = "modul/haber_guncelle.jsp"/> 
                  
            <%            
                }

            if(modul.equals("hbr_rsm_gstr"))

                {  
                                
            %>        
                    <jsp:include page = "modul/haber_resim_goster.jsp"/> 
                  
            <%            
                }



            
            

            
            %>        
                    <jsp:include page = "modul/footer.jsp"/> 
                     
            <%        

            
        }
        
        

    %>
    
    
    
    
    <!-- BEGIN VENDOR JS-->
    <script src="app-assets/vendors/js/vendors.min.js"></script>
    <!-- end BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <script src="app-assets/vendors/js/charts/chart.min.js"></script>
    <script src="app-assets/vendors/js/charts/echarts/echarts.js"></script>
    <script src="app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
    <!-- <script src="app-assets/vendors/js/forms/toggle/bootstrap-checkbox.min.js"></script> -->
    <script src="app-assets/vendors/js/forms/toggle/switchery.min.js"></script>
    <script src="app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="app-assets/vendors/js/forms/spinner/jquery.bootstrap-touchspin.js"></script>
    <script src="https://www.google.com/jsapi"></script>
    <script src="app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN MODERN JS-->
    <script src="app-assets/js/core/app-menu.js"></script>
    <script src="app-assets/js/core/app.js"></script>
    <!-- END MODERN JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="app-assets/js/scripts/pages/appointment.js"></script>
    <script src="app-assets/js/scripts/tables/components/table-components.js"></script>
    <!-- END PAGE LEVEL JS-->
    
    <!-- Html editör JS   = klasörleri silinecek
    <script type="text/javascript" src="jquery/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="jquery/jquery.wysiwyg.js"></script>
    <script type="text/javascript">
    $(function()
  {
      $('#wysiwyg').wysiwyg();
  });
  </script>
 -->
 <!-- ckeditör -->
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script >
            CKEDITOR.replace('editor');                
    </script>
 
</body>
</html>
