<%-- 
    Document   : personel_bolum_gorevler
    Created on : 19.Eki.2021, 10:17:21
    Author     : casper
--%>

<%@page import="veri.db_katmani"%>
<%@page import="veri.per_gorevler"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.personel_bolmlr"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 

<%  db_katmani db = new db_katmani();

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
               
               response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=personel_gorev&isl=bsr");   
        }
    
     }
 }
%>


<div class="app-content content">
      <div class="content-wrapper">
        <div class="content-header row">
          <div class="content-header-left col-md-6 col-12 mb-2">
            <h3 class="content-header-title">Bölümler</h3>           
          </div>
            
          <div class="content-header-right col-md-6 col-12">
           
             <div class="text-center">
                    <button type="button"  onclick="window.location='http://localhost:8080/Library_project/panel.jsp?modul=prs_blm_ekl'" class="btn btn-success round btn-min-width mr-1 mb-1">
                        Bölüm Ekle
                    </button>
                    <button type="button" onclick="window.location='http://localhost:8080/Library_project/panel.jsp?modul=prs_blm_gnc'" class="btn btn-info round btn-min-width mr-1 mb-1">Bölüm Güncelle</button>
                    <button type="button" onclick="window.location='http://localhost:8080/Library_project/panel.jsp?modul=prs_blm_sl'" class="btn btn-danger round btn-min-width mr-1 mb-1">Bölüm Sil</button>
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
            <div class="card-header">
                <h4 class="card-title"> <%= bölümler.get(i).getBolum_ad()  %></h4>
                 <div class="text-center">
                     <% 
                         int ıd = bölümler.get(i).getBolum_id();
                         String bol_ad = bölümler.get(i).getBolum_ad();
                     %>
                    <button type="button"  onclick="window.location='http://localhost:8080/Library_project/panel.jsp?modul=prs_grv_ekl&gnd=<%=ıd %>&bol_ad=<%=bol_ad %>'" class="btn btn-success round btn-min-width mr-1 mb-1">Birim Ekle</button>
                    
                    
                </div>
                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                        <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                        <li><a data-action="close"><i class="ft-x"></i></a></li>
                    </ul>
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
                                <td class="width-250">>                                 
                                    <%= g_ad %>
                                     
                                </td>
                            
                            <td >
                                    <div class="text-center">
                                        <button type="button"  onclick="window.location='http://localhost:8080/Library_project/panel.jsp?modul=prs_kisi&b_id=<%= g_id %>&islem=giris_1'"  class="btn btn-primary round btn-min-width mr-1 mb-1" >Kişiler</button>                                    
                                    </div>
                                </td>
                                <td>
                                    <div class="text-center">  
                                        <button type="button" onclick="window.location='http://localhost:8080/Library_project/panel.jsp?modul=prs_grv_gnc&gnd=<%=g_id %>&g_ad=<%= g_ad %>&g_durum=<%= g_durum %>&g_sira=<%= g_sira %>&b_id=<%= b_id %>&b_ad=<%= bol_ad %>'"   class="btn btn-info round btn-min-width mr-1 mb-1">Güncelle</button>
                                        <button type="button" onclick="window.location='http://localhost:8080/Library_project/panel.jsp?modul=prs_grv_sl&gnd=<%=g_id %>&islem=Sil'" class="btn btn-danger round btn-min-width mr-1 mb-1">Sil</button>
                                                                                                                                                        
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
