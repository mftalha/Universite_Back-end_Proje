<%-- 
    Document   : ust
    Created on : 15.Eki.2021, 17:07:00
    Author     : casper
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="veri.kisi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%   
    
    ArrayList<kisi> ss = (ArrayList)session.getAttribute("kullanicibilgisi");
        String isim_soyisim =  (String) ss.get(0).getAd_soyad();
        String email = (String) ss.get(0).getMail();
        String uni = (String) ss.get(0).getUniversite();

%>

<!-- fixed-top-->
    <nav class="header-navbar navbar-expand-md navbar navbar-with-menu navbar-without-dd-arrow fixed-top navbar-semi-light bg-info navbar-shadow">
      <div class="navbar-wrapper">
        <div class="navbar-header">
          <ul class="nav navbar-nav flex-row">
            <li class="nav-item mobile-menu d-md-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu font-large-1"></i></a></li>
            <li class="nav-item"><a class="navbar-brand" href="#"><img class="brand-logo" alt="modern admin logo" src="images/logo_4.png">
                <h4 class="brand-text"><%= uni %></h4></a></li>
            <li class="nav-item d-md-none"><a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile"><i class="la la-ellipsis-v"></i></a></li>
          </ul>
        </div>
        <div class="navbar-container content">
          <div class="collapse navbar-collapse" id="navbar-mobile">
            <ul class="nav navbar-nav mr-auto float-left">
              <li class="nav-item d-none d-md-block"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu"></i></a></li>             
            </ul>
            <ul class="nav navbar-nav float-right">
              <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown"><span class="mr-1"> <span class="user-name text-bold-700"><%=isim_soyisim %></span></span></a>               
              </li>           
            </ul>
          </div>
        </div>
      </div>
    </nav>
 <!-- ////////////////////////////////////////////////////////////////////////////-->
             <!--  yan menüler burdan sonrası    daasddasdasdasdas -->   
   <div class="main-menu menu-fixed menu-light menu-accordion    menu-shadow " data-scroll-to-active="true">
      <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
          <li class="active"><a href="panel.jsp?modul=index"><i class="la la-home"></i><span class="menu-title" data-i18n="">Ana Sayfa</span></a>
          </li>
          <li class=" navigation-header"><span data-i18n="nav.category.ui">Kullanıcı Sayfası</span><i class="la la-ellipsis-h ft-minus" data-toggle="tooltip" data-placement="right" data-original-title="Kullanıcı Arayüzü"></i>
          </li>
            <li class=" nav-item"><a href="panel.jsp?modul=profil"><i class="la la-user" data-i18n="nav.components.main"></i><span class="menu-title" >Profil Sayfası</span></a>          
          </li>
            <li class=" nav-item"><a href="panel.jsp?modul=link_olstr"><i class="la la-link" data-i18n="nav.components.main"></i><span class="menu-title" >Dosya Linki Oluştur</span></a>          
          </li>
          <li class=" nav-item"><a href="#"><i class="la la-server"></i><span class="menu-title" data-i18n="">Veritabanı İşlemleri</span></a>
            <ul class="menu-content">
              <li><a class="menu-item" href="panel.jsp?modul=abone_vt_islmlr">Abone Veritabanı</a>
              </li>
              <li><a class="menu-item" href="panel.jsp?modul=deneme_vt_islmlr">Deneme Veritabanı</a>
              </li>
            </ul>
          </li>
             <li class=" nav-item"><a href="panel.jsp?modul=etkinlik_islmlr"><i class="la la-dashcube" data-i18n="nav.components.main"></i><span class="menu-title" >Etkinlik İşlemleri</span></a>          
          </li>
          <li class=" nav-item"><a href="panel.jsp?modul=duyuru_islm"><i class="la la-edit" data-i18n="nav.components.main"></i><span class="menu-title" >Duyuru İşlemleri</span></a>          
          </li>
          <li class=" nav-item"><a href="panel.jsp?modul=haber_islm"><i class="la la-newspaper-o" data-i18n="nav.components.main"></i><span class="menu-title" >Haber İşlemleri</span></a>          
          </li>
           <li class=" nav-item"><a href="panel.jsp?modul=modal_islemleri"><i class="la la-bullhorn" data-i18n="nav.components.main"></i><span class="menu-title" >Modal İşlemleri</span></a>          
          </li>
           <li class=" nav-item"><a href="panel.jsp?modul=slider_islemler"><i class="la la-picture-o" data-i18n="nav.components.main"></i><span class="menu-title" >Slider İşlemleri</span></a>          
          </li>  
          <li class=" nav-item"><a href="panel.jsp?modul=personel_islemler"><i class="la la-file-text"></i><span class="menu-title" data-i18n="nav.form_layouts.main">Personel İşlemleri</span></a>                        
          </li>
          <li class=" nav-item"><a href="panel.jsp?modul=menu"><i class="la la-table"></i><span class="menu-title" data-i18n="nav.bootstrap_tables.main">Menü İşlemleri</span></a>     
          </li>
            <hr>
          <li class=" nav-item" id="zz" ><a href="modul/login.jsp"  onclick='document.cookie = "login=; expires=Thu, 01 Jan 2000 00:00:00 GMT";'><i class="la la-power-off" ></i><span class="menu-title" data-i18n="nav.pages.main">Çıkış</span></a>          
          </li>
          
        </ul>
      </div>
    </div>
     
     