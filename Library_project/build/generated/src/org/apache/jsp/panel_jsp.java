package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import veri.personel_bolmlr;
import java.util.ArrayList;

public final class panel_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, false, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>JSP Page</title>\n");
      out.write("    \n");
      out.write("    <link rel=\"apple-touch-icon\" href=\"app-assets/images/ico/apple-icon-120.png\">\n");
      out.write("    <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"app-assets/images/ico/favicon.ico\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i%7CQuicksand:300,400,500,700\" rel=\"stylesheet\">\n");
      out.write("    <!-- BEGIN VENDOR CSS-->\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/css/vendors.css\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/vendors/css/forms/icheck/icheck.css\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/vendors/css/forms/icheck/custom.css\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/vendors/css/forms/toggle/switchery.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/vendors/css/forms/selects/select2.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/vendors/css/forms/spinner/jquery.bootstrap-touchspin.css\">\n");
      out.write("    \n");
      out.write("\n");
      out.write("    <!-- END VENDOR CSS-->\n");
      out.write("    <!-- BEGIN MODERN CSS-->\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/css/app.css\">\n");
      out.write("    <!-- END MODERN CSS-->\n");
      out.write("    <!-- BEGIN Page Level CSS-->\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/css/core/menu/menu-types/vertical-menu.css\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/css/core/colors/palette-gradient.css\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/css/pages/hospital.css\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/css/plugins/forms/switch.css\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"app-assets/css/core/colors/palette-callout.css\">\n");
      out.write("    <!-- END Page Level CSS-->\n");
      out.write("    <!-- BEGIN Custom CSS-->\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/style.css\">\n");
      out.write("    <!-- END Custom CSS-->\n");
      out.write("    <!--\n");
      out.write("    <!-- html editör link leri \n");
      out.write("    <link rel=\"stylesheet\" href=\"css/jquery.wysiwyg.css\" type=\"text/css\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"examples.css\" type=\"text/css\" />   -->\n");
      out.write("    <!-- Bootstrap  == bunu kaldırınca normale dönüyor sayfa düzeni \n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\n");
      out.write("    -->\n");
      out.write("    \n");
      out.write("    \n");
      out.write("</head>\n");
      out.write("<body class=\"vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar\" data-open=\"click\" data-menu=\"vertical-menu\" data-col=\"2-columns\">\n");
      out.write("    ");

        String modul =(String) request.getParameter("modul");
        
        
        if(modul == null)
        {
                     
            response.sendRedirect("modul/login.jsp");               
        }
        
        if(modul != null)
        {
            
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/ust.jsp", out, false);
      out.write("\n");
      out.write("            </br>\n");
      out.write("            ");

            if(modul.equals("index"))

                {
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/index.jsp", out, false);
      out.write("\n");
      out.write("            ");
            
                }
            
            if(modul.equals("profil"))

                {
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/profil.jsp", out, false);
      out.write("\n");
      out.write("            ");
            
                }

            if(modul.equals("sifre_degis"))

                {
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/sifre_degis.jsp", out, false);
      out.write("\n");
      out.write("            ");
            
                }

            

            if(modul.equals("cikis"))

                {
            
      out.write("        \n");
      out.write("                     \n");
      out.write("                    ");
 response.sendRedirect("modul/login.jsp"); 
                     //sesionu kapattım ve çıkış yaptım   
      out.write(" \n");
      out.write("            ");
            
                }

            if(modul.equals("guncelle"))

                {
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/sifre_guncelle_kon.jsp", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }

            if(modul.equals("duyuru_ekle"))

                {
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/duyuru_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }

            if(modul.equals("duyuru_guncelle"))//duyuru_sil

                {
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/duyuru_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }

            if(modul.equals("duyuru_guncelle_isl"))//duyuru_sil

                {
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/duyuru_gnc_isl.jsp", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }


                if(modul.equals("duyuru_sil"))//duyuru_sil

                {
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/duyuru_sil.jsp?", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }


                
               if(modul.equals("duyuru_islm"))//duyuru_sil

                {
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/duyuru_islemler.jsp?", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }

            if(modul.equals("personel_gorev"))

                {
                
                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/personel_bolum_gorevler.jsp", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }

               if(modul.equals("prs_blm_ekl"))

                {
                
                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/personel_bolum_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }

               
            if(modul.equals("prs_blm_gnc"))

                {  
                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/personel_blm_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }


             if(modul.equals("prs_blm_sl"))

                {      
                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/personel_bolum_sil.jsp", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }


            if(modul.equals("prs_grv_ekl"))

                {      
                String id = request.getParameter("ıd");
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/personel_gorev_ekle.jsp?gnd=<%=id %>", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
            
                }


            
            if(modul.equals("prs_grv_sl"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/personel_bolum_gorevler.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

                
            if(modul.equals("prs_grv_gnc"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/personel_gorev_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                } 

            if(modul.equals("prs_kisi"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/kisi_islm.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }


            if(modul.equals("prs_kisi_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/kisi_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }
                
            if(modul.equals("prs_kisi_guncelle"))
                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/kisi_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

                

            
            if(modul.equals("menu_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/menu_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

             
            if(modul.equals("menu_guncelle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/menu_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

                
             if(modul.equals("menu_guncelle_isl"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/menu_gnc_isl.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

   
            
             if(modul.equals("menu"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/menuler.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            
           if(modul.equals("acilir_menu_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/menu_acilir_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

             
           if(modul.equals("acilir_menu_guncelle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/menu_acilir_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

             
           if(modul.equals("alt_acilir_menu_guncelle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/menu_alt_acilir_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

                

           if(modul.equals("alt_acilir_menu_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/menu_alt_acilir_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }


            
            if(modul.equals("personel_islemler"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/personel_islemler.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }
            

            if(modul.equals("slider_islemler"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/slider_islemleri.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }



           if(modul.equals("slider_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/slider_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }


            if(modul.equals("resim_guncelleme"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/resim_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }


            if(modul.equals("slider_gstr"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/slider_.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }


            if(modul.equals("resim_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/resim_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("personem_blm_islm"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/personel_bolum_islemleri.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }


            if(modul.equals("rsm_gstr"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/resim_goster.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("link_olstr"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/dosya_link_ulstur.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }


           if(modul.equals("modal_islemleri"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/bootstrap_islemleri.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }
            

            if(modul.equals("modal_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/boostrap_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }


            if(modul.equals("modal_guncelle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/bootstrap_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("abone_vt_islmlr"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/abone_vt_islemleri.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("abone_vt_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/abone_vt_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("abone_vt_guncelle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/abone_vt_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("abone_vt_logo_gstr"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/abone_vt_logo_goster.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("dokuman_gstr"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/documan_goster.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }
            
            if(modul.equals("deneme_vt_islmlr"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/deneme_vt_islemler.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("deneme_vt_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/deneme_vt_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("deneme_vt_guncelle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/deneme_vt_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("deneme_vt_resm_goster"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/deneme_vt_resim_goster.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("etkinlik_islmlr"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/etkinlik_islemleri.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("etkinlik_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/etkinlik_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

               
            if(modul.equals("etkinlik_guncelle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/etkinlik_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }
                
            if(modul.equals("etkinlik_goster"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/etknlk_goster.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }


            if(modul.equals("haber_islm"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/haber_islemleri.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("hbr_ekle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/haber_ekle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("hbr_guncelle"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/haber_guncelle.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }

            if(modul.equals("hbr_rsm_gstr"))

                {  
                                
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/haber_resim_goster.jsp", out, false);
      out.write(" \n");
      out.write("                  \n");
      out.write("            ");
            
                }



            
            

            
            
      out.write("        \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "modul/footer.jsp", out, false);
      out.write(" \n");
      out.write("                     \n");
      out.write("            ");
        

            
        }
        
        

    
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <!-- BEGIN VENDOR JS-->\n");
      out.write("    <script src=\"app-assets/vendors/js/vendors.min.js\"></script>\n");
      out.write("    <!-- end BEGIN VENDOR JS-->\n");
      out.write("    <!-- BEGIN PAGE VENDOR JS-->\n");
      out.write("    <script src=\"app-assets/vendors/js/charts/chart.min.js\"></script>\n");
      out.write("    <script src=\"app-assets/vendors/js/charts/echarts/echarts.js\"></script>\n");
      out.write("    <script src=\"app-assets/vendors/js/forms/icheck/icheck.min.js\"></script>\n");
      out.write("    <!-- <script src=\"app-assets/vendors/js/forms/toggle/bootstrap-checkbox.min.js\"></script> -->\n");
      out.write("    <script src=\"app-assets/vendors/js/forms/toggle/switchery.min.js\"></script>\n");
      out.write("    <script src=\"app-assets/vendors/js/forms/select/select2.full.min.js\"></script>\n");
      out.write("    <script src=\"app-assets/vendors/js/forms/spinner/jquery.bootstrap-touchspin.js\"></script>\n");
      out.write("    <script src=\"https://www.google.com/jsapi\"></script>\n");
      out.write("    <script src=\"app-assets/vendors/js/charts/jquery.sparkline.min.js\"></script>\n");
      out.write("    <!-- END PAGE VENDOR JS-->\n");
      out.write("    <!-- BEGIN MODERN JS-->\n");
      out.write("    <script src=\"app-assets/js/core/app-menu.js\"></script>\n");
      out.write("    <script src=\"app-assets/js/core/app.js\"></script>\n");
      out.write("    <!-- END MODERN JS-->\n");
      out.write("    <!-- BEGIN PAGE LEVEL JS-->\n");
      out.write("    <script src=\"app-assets/js/scripts/pages/appointment.js\"></script>\n");
      out.write("    <script src=\"app-assets/js/scripts/tables/components/table-components.js\"></script>\n");
      out.write("    <!-- END PAGE LEVEL JS-->\n");
      out.write("    \n");
      out.write("    <!-- Html editör JS   = klasörleri silinecek\n");
      out.write("    <script type=\"text/javascript\" src=\"jquery/jquery-1.3.2.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"jquery/jquery.wysiwyg.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("    $(function()\n");
      out.write("  {\n");
      out.write("      $('#wysiwyg').wysiwyg();\n");
      out.write("  });\n");
      out.write("  </script>\n");
      out.write(" -->\n");
      out.write(" <!-- ckeditör -->\n");
      out.write("    <script type=\"text/javascript\" src=\"ckeditor/ckeditor.js\"></script>\n");
      out.write("    <script >\n");
      out.write("            CKEDITOR.replace('editor');                \n");
      out.write("    </script>\n");
      out.write(" \n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
