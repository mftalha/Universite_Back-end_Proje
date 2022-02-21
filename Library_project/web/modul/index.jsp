<%-- 
    Document   : index
    Created on : 15.Eki.2021, 16:53:04
    Author     : casper
--%>

<%@page import="veri.boostrap"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="veri.db_katmani"%>
<%@page import="veri.duyuru"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div class="app-content content">
      <div class="content-wrapper">
        
       <div class="content-body"><!-- Hospital Info cards -->
<div class="row">
<div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
              <a href="?modul=profil">  <h3 class="text-bold-600">Profil Sayfası</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
            <a href="?modul=link_olstr">   <h3 class="text-bold-600">Dosya Linki Oluştur</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
      
     <div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
             <a href="?modul=etkinlik_islmlr"> <h3 class="text-bold-600">Etkinlik İşlemleri</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
             <a href="?modul=abone_vt_islmlr"> <h3 class="text-bold-600">Abone Veri Tabanları</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
     <div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
             <a href="?modul=deneme_vt_islmlr"> <h3 class="text-bold-600">Deneme Veri Tabanları</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
     <div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
             <a href="?modul=duyuru_islm"> <h3 class="text-bold-600">Duyuru İşlemleri</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
             <a href="?modul=haber_islm"> <h3 class="text-bold-600">Haber İşlemleri</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
             <a href="?modul=modal_islemleri"> <h3 class="text-bold-600">Modal İşlemleri</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    
     <div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
             <a href="?modul=slider_islemler"> <h3 class="text-bold-600">Slider İşlemleri</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div class="col-xl-3 col-lg-6 col-md-6 col-12">
    <div class="card pull-up">
      <div class="card-content">
        <div class="card-body">
          <div class="media d-flex">
           
            <div class="media-body text-center">
           
             <a href="?modul=menu"> <h3 class="text-bold-600">Menü İşlemleri</h3></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 
  
  
</div>
<!-- Hospital Info cards Ends -->

<!-- Appointment Bar Line Chart -->

<!-- Appointment Table Ends -->
        </div>
      </div>
    </div>

                                        
