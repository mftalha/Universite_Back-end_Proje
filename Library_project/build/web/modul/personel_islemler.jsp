<%-- 
    Document   : personel_islemler
    Created on : 03.Kas.2021, 15:03:17
    Author     : casper
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="veri.personel_bolmlr"%>
<%@page import="veri.per_gorevler"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  db_katmani db = new db_katmani();
    int ckt =0;
    //modul=prs_grv_sl&gnd=<%=g_id &islem=Sil'
   
 if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
 {
     if(request.getParameter("islem").equals("Sil"))
     {
        if(request.getParameter("gnd") != null && request.getParameter("gnd") != "")
        {
            
               String sgrv_id=(String) request.getParameter("gnd");
               int grv_id =Integer.parseInt(sgrv_id);
               db.gorev_sil(grv_id);               
               ckt = 1;
               //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=personel_gorev&isl=bsr");   
        }
    
     }
 }
%>


<div class="app-content content">
      <div class="content-wrapper">
         
          
          <%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("Sil"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Birim Silme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
          
          
          
        <div class="content-header row">
          <div class="content-header-left col-md-6 col-12 mb-2">
            <h3 class="content-header-title">Bölümler</h3>           
          </div>
            
          <div class="content-header-right col-md-6 col-9">
           
             <div class="text-center">
                    <button type="button"  onclick="window.location='?modul=personem_blm_islm'" class="btn btn-outline-primary btn-min-width mr-1 mb-1" style=" margin: auto; position: absolute; right:  0.2%; bottom: 0.8%;"><i class="la la-check"></i>
                        Bölüm İşlemleri
                    </button>
              
            </div>
          </div>
        </div>
        <div class="content-body"><!-- UI components start -->
<%
  
    ArrayList<per_gorevler> görevler = db.personel_grv();
    ArrayList<personel_bolmlr> bölümler = db.personel_blm();
    
        for(int i=0;i<bölümler.size();i++)
        {
           if(!bölümler.get(i).getDurum().equals("Beklemede"))
           {
%>
<!-- Select start -->
<!-- Tooltip Triggers start -->
<div class="row" id="tooltip">
    <div class="col-12">
        <div class="card">
            
            <div class="card-header" style="position: relative;">
                <h4 class="card-title" style=" font-size: 128%;"> <%= bölümler.get(i).getBolum_ad()%></h4>
                 <div class="text-center">
                     <% 
                         int ıd = bölümler.get(i).getBolum_id();
                         String bol_ad = bölümler.get(i).getBolum_ad();
                     %>
                    <button type="button"  onclick="window.location='?modul=prs_grv_ekl&gnd=<%=ıd %>&bol_ad=<%=bol_ad %>'" class="btn btn-outline-primary btn-min-width mr-1 mb-1" style=" margin: auto; position: absolute; right:  0.2%; top: 14%;">Birim Ekle</button>                   
                    
                </div>
                
            </div>
            <div class="card-content collapse show">
                <div class="table-responsive">
                    <table class="table table-bordered mb-0">                
                        <tbody>
                            <%
                               int g_id=0;
                               String g_ad="";
                               String g_durum="";
                               int g_sira = 0;
                               int b_id =0 ;
                               
                            for(int j=0;j<görevler.size();j++)
                            {
                                if(bölümler.get(i).getBolum_id() == görevler.get(j).getBolum_id() && !görevler.get(j).getDurum().equals("Sil") )
                                {
                                    
                                    g_id = görevler.get(j).getGorev_id();
                                    g_ad = görevler.get(j).getIsmi();
                                    g_durum = görevler.get(j).getDurum();
                                    g_sira = görevler.get(j).getRutbe_no();
                                    b_id = görevler.get(j).getBolum_id();
                                    
                            %>
                            <tr>
                                <td class="width-250" style="padding-top: 2.8%; padding-bottom: 1%; padding-left: 5%; font-size: 110%;">                                 
                                    <%= g_ad %>
                                     
                                </td>
                            
                            <td >
                                    <div class="text-center" style="padding-top: 4.5%; padding-bottom: 0.2%;" >
                                        <button type="button"  onclick="window.location='?modul=prs_kisi&g_id=<%= g_id %>'"  class="btn btn-outline-primary round btn-min-width mr-1 mb-1" >Kişiler</button>                                    
                                    </div>
                                </td>
                                <td>
                                    <div class="text-center" style="padding-top: 2.7%; padding-bottom: 0.2%;">  
                                        <button type="button" onclick="window.location='?modul=prs_grv_gnc&m_id=<%=g_id %>&g_ad=<%= g_ad %>&g_durum=<%= g_durum %>&g_sira=<%= g_sira %>&b_id=<%= b_id %>&b_ad=<%= bol_ad %>'"   class="btn btn-outline-info round btn-min-width mr-1 mb-1">Güncelle</button>
                                        <button type="button" onclick="window.location='?modul=personel_islemler&gnd=<%=g_id %>&islem=Sil'" class="btn btn-outline-danger round btn-min-width mr-1 mb-1">Sil</button>                                                                                                                                                       
                                    </div>
                                </td>
                            </tr>
                             <%
                                }

                                }
                            %>
                        </tbody>
                       
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    }
}
 %>
<!-- Tooltip Triggers end -->
<!-- Select end -->




        </div>
      </div>
    </div>