<%-- 
    Document   : kisi_islm
    Created on : 26.Eki.2021, 14:43:30
    Author     : casper
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="veri.personel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.personel_bolmlr"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<%   
      int ckt =0;
      db_katmani db = new db_katmani();
      ArrayList<personel_bolmlr> bölümler = db.personel_blm();
      ArrayList<personel> personeller = db.personel_b();
      
      String b_id = request.getParameter("g_id");
      int ib_id = Integer.parseInt(b_id);
      
      if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
      {
          if(request.getParameter("islem").equals("kisi_sil"))
          {
              int k_id = Integer.parseInt((String)request.getParameter("k_id"));
              db.personel_sil(k_id);
              ckt =1;
          }
      }
    
%>



<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
            

<%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("kisi_sil"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Kişi Silme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
                 
                <h4 class="card-title" style=" font-size: 128%;"> Kişi İşlemler</h4>
                
                <button type="button" onclick="window.location='?modul=prs_kisi_ekle&g_id=<%=request.getParameter("g_id") %>'" class="btn btn-outline-primary  btn-min-width mr-1 mb-1" style=" margin: auto; position: absolute; right:  0.2%; top: 14%;"><i class="la la-check"></i> Kişi Ekle</button>                                                 
                
                 <!-- burası -->              
            </div>
            
           
            <div class="card-content collapse show">
                <div class="table-responsive">
                    <table class="table table-bordered mb-0">
                        <thead>
				<tr>
                                                        <th>Sıra No</th>
                                                        <th>Ad SoyAd</th>
                                                        <th>Ünvan</th>
                                                        <th>Dahili Tel</th>
                                                        <th>İşlemler</th>	
				</tr>
			</thead>
                        
                        
                        <%  
                            ArrayList<personel> duyurular = db.personel_b();
                            
                                                    for(int i=0;i< duyurular.size();i++)
                                                    {
                                                        if(duyurular.get(i).getB_id()== Integer.parseInt(request.getParameter("g_id")))
                                                    {
                                                       int k_id = duyurular.get(i).getKisi_id();
                                                    %>
						<tbody>
							<tr>
                                                            <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%; " >                                 
                                                                <%= duyurular.get(i).getSira_no()%>
                                                            </td>
                                                            <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;"><%= duyurular.get(i).getAd_soyad()%></td>
							    <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;"> <%= duyurular.get(i).getUnvan()%>  </td>
                                                            <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;"> <%= duyurular.get(i).getDahili_tel()%>  </td>
                                                            
                                                            
                                                            <td style="padding-top: 1.2%; padding-bottom: 0%;  text-align: center;">
                                                                <div class="text-center">  

                                                                    <button type="button" onclick="window.location='?modul=prs_kisi_guncelle&k_id=<%=k_id%>&g_id=<%= request.getParameter("g_id") %>'" class="btn btn-outline-info round btn-min-width mr-1 mb-1" style="font-size: 110%">Güncelle</button>
                                                                    <button type="button" onclick="window.location='?modul=prs_kisi&k_id=<%= k_id  %>&islem=kisi_sil&g_id=<%= request.getParameter("g_id")%>'"  class="btn btn-outline-danger round btn-min-width mr-1 mb-1" style="font-size: 110%">Sil</button>                                                                                                                
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
