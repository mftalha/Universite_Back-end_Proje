<%-- 
    Document   : bootstrap_islemleri
    Created on : 26.Kas.2021, 16:04:11
    Author     : casper
--%>

<%@page import="veri.boostrap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.duyuru"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    db_katmani db = new db_katmani();
    int ckt =0;
          
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
    {        
        if(request.getParameter("islem").equals("modal_sil"))
        {
            if(request.getParameter("m_id") != null && request.getParameter("m_id") != "" ) 
            {
                String sm_id = (String) request.getParameter("m_id");
                int m_id = Integer.parseInt(sm_id);
                db.bootstrap_sil(m_id);
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
        if(request.getParameter("islem").equals("modal_sil"))
        {
       if(ckt ==1)
       {
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Modal Silme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
            
            <div  class="card-header" style="position: relative;" >
                 
                <h4 class="card-title" style=" font-size: 128%;"> Modal Kontrol Tablosu</h4>
                
                <button type="button" onclick="window.location='?modul=modal_ekle'" class="btn btn-outline-primary  btn-min-width mr-1 mb-1" style=" margin: auto; position: absolute; right:  0.2%; top: 14%; font-size: 105%" ><i class="la la-check"></i> Modal Ekle</button>                                                 
                
                 <!-- burası -->              
            </div>
            <div class="card-content collapse show">
                <div class="table-responsive">
                    <table class="table table-bordered mb-0" >
                        <thead>
				<tr style="text-align: center; vertical-align: middle;">
                                                        <th>Modal Başlık</th>
                                                        <th>Gösterilecek Sayfa</th>
                                                        <th>Durum</th>                                            	
                                                        <th>İşlemler</th>	
				</tr>
			</thead>
                        <%  
                            ArrayList<boostrap> bstrp = db.boostraplar();
                            int m_id = 0;
                                                    for(int i=0;i< bstrp.size();i++)
                                                    {
                                                        if(!bstrp.get(i).getDurum().equals("Sil"))
                                                    {
                                                        m_id = bstrp.get(i).getModal_id();
                                                    %>
						<tbody>
							<tr >
                                                            <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;" ><%= bstrp.get(i).getBaslik()%></td>
                                                            <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;"> 
                                                                <%
                                                                    if(bstrp.get(i).getSayfa().equals("ana_sayfa"))
                                                                    {
                                                                 %>
                                                                      Ana Sayfa
                                                                 <%
                                                                     }
                                                                     else if(bstrp.get(i).getSayfa().equals("abone_veritabani"))
                                                                    {
                                                                 %>
                                                                      Abone Veritabanı
                                                                 <%
                                                                     }
                                                                     else if(bstrp.get(i).getSayfa().equals("deneme_veritabani"))
                                                                    {
                                                                 %>
                                                                      Deneme Veritananı
                                                                 <%
                                                                     }
                                                                 %>
                                                                 
                                                            
                                                            </td>
							    <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;"> <%= bstrp.get(i).getDurum()%>  </td>
                                                      
                                                            <td style="padding-top: 1.2%; padding-bottom: 0%;  text-align: center; ">
                                                                <div class="text-center" >  

                                                                    <button type="button" onclick="window.location='?modul=modal_guncelle&m_id=<%= m_id%>'" class="btn btn-outline-info round btn-min-width mr-1 mb-1" style="font-size: 110%">Güncelle</button>
                                                                    <button type="button" onclick="window.location='?modul=modal_islemleri&m_id=<%= m_id%>&islem=modal_sil '"  class="btn btn-outline-danger round btn-min-width mr-1 mb-1" style="font-size: 110%">Sil</button>                                                                                                                
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

