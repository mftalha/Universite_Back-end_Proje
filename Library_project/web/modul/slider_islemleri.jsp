<%-- 
    Document   : slider_islemleri
    Created on : 03.Kas.2021, 17:12:04
    Author     : casper
--%>

<%@page import="degiskenler.degiskenler"%>
<%@page import="slider.slider_sql"%>
<%@page import="slider.db_slider"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.slider"%>
<%@page import="veri.db_katmani"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>




<% 
    db_slider db = new db_slider();
    int ckt=0;
    
          
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
    {
       
        if(request.getParameter("islem").equals("resim_sil"))
        {
            if(request.getParameter("m_id") != null && request.getParameter("m_id") != "" ) 
            {
                String sm_id = (String) request.getParameter("m_id");
                int m_id = Integer.parseInt(sm_id);
                db.slider_sil(m_id);
                ckt=1;
                //response.sendRedirect("../panel.jsp?modul=slider_islemler");              
            }
        }
        
    }
    
    
%>


            

<!-- // Basic form layout section end -->
      
    <!-- ////////////////////////////////////////////////////////////////////////////-->
  
<!-- Select start -->
<!-- Tooltip Triggers start -->

<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
<%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("resim_sil"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Resim Silme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
								</div>
<%}else{ %>
 <div class="alert bg-danger alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Uyarı! </strong> İşleminiz Gerçekleştirilirken Bir Hata Oluştu.
								</div>
                
                
<%
    }
        }
    }
%>
<div class="row" id="alerts">
    <div class="col-12">
        <div class="card">
            
            <div  class="card-header" style="position: relative;" >
                 
                <h4 class="card-title" style=" font-size: 130%;"> Slider Kontrol Tablosu </h4>
                
                                <div class="form-group" style=" margin: auto; position: absolute; right:  1.2%; top: 14%;" >
                                    <!-- Buttons with Icon -->
                                 <button type="button" onclick="window.location='?modul=resim_ekle'" class="btn btn-outline-primary " ><i class="la la-check"></i> Slider Ekle </button>
                                 <button type="button" onclick="window.location='?modul=slider_gstr'" class="btn btn-outline-primary" ><i class="la la-image"></i> Resimler </button>
                                 
                                </div>                             
            </div>
           
            <div class="card-content collapse show">
                <div class="table-responsive">
                    <table class="table table-bordered mb-0" >
                        <thead>
				<tr>
                                                        <th>Sıra No</th>
                                                        <th>Kayıt Tarihi</th>
                                                        <th>Resim</th>	
                                                        <th>İşlemler</th>	
				</tr>
			</thead>                     
                        <%                          
                                                    int m_id = 0;
                                                     ArrayList<slider_sql> duyurular = db.sliderlar();
                                                    for(int i=0;i< duyurular.size();i++)
                                                    {
                                                        
                                                        m_id = duyurular.get(i).getId();
                                                        degiskenler degisken = new degiskenler();
                                                    %>
						<tbody>
							<tr >
                                                            <td style="padding-top: 9.7%; padding-bottom: 5%; text-align: center; font-size: 118%;"><%= duyurular.get(i).getSira_no() %></td>
                                                
                                                            <td style="padding-top: 9%; padding-bottom: 5%; text-align: center; font-size: 115%;"><%= duyurular.get(i).getKayit_tarih()%></td>
                                                            <td> <img src="<%=degisken.tablo_resim_goster_yol+duyurular.get(i).getResim()%>" width="250" height="200"/>   </td>
                                                   
                                                            <td>
                                                                <div class="text-center" style="padding-top: 18%;  text-align: center; ">  

                                                                    <button type="button" onclick="window.location='?modul=resim_guncelleme&r_id=<%= m_id%>'" class="btn btn-outline-info round btn-min-width mr-1 mb-1">Düzenle</button>
                                                                    <button type="button" onclick="window.location='?modul=slider_islemler&m_id=<%= m_id%>&islem=resim_sil '"  class="btn btn-outline-danger round btn-min-width mr-1 mb-1">Kaldır</button>                                                                                                                
                                                                </div>
                                                            </td>      
							</tr>
						</tbody>
                                                <%
                                                               
                                                    }
                                                 %>    
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Tooltip Triggers end -->
<!-- Select end -->

  </div>
      </div>
    </div>