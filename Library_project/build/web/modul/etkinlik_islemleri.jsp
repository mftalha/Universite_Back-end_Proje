<%-- 
    Document   : etkinlik_islemleri
    Created on : 21.Ara.2021, 16:38:50
    Author     : casper
--%>

<%@page import="veri.etkinlik"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    db_katmani db = new db_katmani();
    int ckt =0;
          
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
    {
        
            
        if(request.getParameter("islem").equals("sil"))
        {
            if(request.getParameter("m_id") != null && request.getParameter("m_id") != "" ) 
            {
                String sm_id = (String) request.getParameter("m_id");
                int m_id = Integer.parseInt(sm_id);
                db.etkinlik_sil(m_id);
                ckt=1;
                //response.sendRedirect("../panel.jsp?modul=duyuru_islm");
            }
        }
        
    }
    
    
%>

<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
            

<%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("sil"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Etkinlik Silme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
            
            
<!-- // Basic form layout section end -->
      
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    
    
    
<!-- Select start -->
<!-- Tooltip Triggers start -->
<div class="row" id="alerts">
    <div class="col-12">
        <div class="card">
            
            <div class="card-header"  style="position: relative;">
                 
                <h4 class="card-title" style=" font-size: 128%;"> Etkinlik Kontrol Tablosu</h4>
                
                <button type="button" onclick="window.location='?modul=etkinlik_ekle'" class="btn btn-outline-primary  btn-min-width mr-1 mb-1" style=" margin: auto; position: absolute; right: 0.2%; top: 14%; font-size: 110%" ><i class="la la-check"></i> Etkinlik Ekle</button>                                                 
                
                 <!-- burası -->              
            </div>
            
           
            <div class="card-content collapse show">
                <div class="table-responsive">
                    <table class="table table-bordered mb-0" >
                        <thead>
				<tr style="text-align: center; vertical-align: middle;">
                                                        <th>Başlık</th>
                                                        <th>Durum</th>
                                                        <th>Etkinlik Başlama Tarihi</th>	
                                                        <th>İşlemler</th>
				</tr>
			</thead>
                  
                        <%  
                            ArrayList<etkinlik> etknlk = db.etkinlikler();
                            int m_id = 0;
                                                    for(int i=0;i< etknlk.size();i++)
                                                    {
                                                        if(!etknlk.get(i).getEtknlik_durum().equals("Sil"))
                                                    {
                                                        m_id = etknlk.get(i).getEtknlik_id();
                                                    %>
						<tbody>
							<tr >
                                                            
                                                            <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;" ><%= etknlk.get(i).getEtknlik_baslik()%></td>
							    <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;"> <%= etknlk.get(i).getEtknlik_durum()%>  </td>
                                                            <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;"> <%= etknlk.get(i).getEtknlik_baslangic_tarihi()%>  </td>
                                                            
                                                            
                                                            <td style="padding-top: 1.2%; padding-bottom: 0%;  text-align: center;">
                                                                <div class="text-center" >  

                                                                    <button type="button" onclick="window.location='?modul=etkinlik_guncelle&r_id=<%= m_id%>'" class="btn btn-outline-info round btn-min-width mr-1 mb-1" style="font-size: 110%">Güncelle</button>
                                                                    <button type="button" onclick="window.location='?modul=etkinlik_islmlr&m_id=<%= m_id%>&islem=sil'"  class="btn btn-outline-danger round btn-min-width mr-1 mb-1" style="font-size: 110%">Sil</button>                                                                                                                
                                                                </div>
                                                            </td>
                                                            
                                                            
							</tr>
							
						</tbody>
                                                <%
                                                    }
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

