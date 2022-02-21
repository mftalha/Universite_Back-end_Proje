<%-- 
    Document   : menuler
    Created on : 28.Eki.2021, 09:36:20
    Author     : casper
--%>


<%@page import="veri.acilir_menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.menu"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    db_katmani db = new db_katmani();
    
    ArrayList<acilir_menu> a_menuler = db.acilir_menuler_();
    ArrayList<menu> menuler = db.menuler_();
    int ckt = 0;
    int ckt_2=0;
    
   
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
    {
        if(request.getParameter("islem").equals("acl_sira_gunc"))
        {
            if(request.getParameter("menu_ismi") != null && request.getParameter("menu_ismi") != "" && request.getParameter("u_1") != null && request.getParameter("u_1") != "")
            {
                String acl_menu_ismi =(String) request.getParameter("menu_ismi");
                String ssira_no =(String) request.getParameter("u_1");
                int sira_no = Integer.parseInt(ssira_no);
               
                
                for(int i=0;i<a_menuler.size();i++)
                {
                    if(acl_menu_ismi.equals(a_menuler.get(i).getBaslik()))
                    {
                        int knt =0;
                        int a_id = a_menuler.get(i).getAcilir_menu_id();
                        int onceki = a_menuler.get(i).getSira_no();
                        if(onceki != sira_no )
                        {
                            knt = 1;
                        }                       
                        db.a_menu_sira_guncelle(sira_no, a_id, knt);
                        ckt=1;
                        //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=menu&durum=basarili");                        
                    }                   
                }
            
            }
            
        }
        if(request.getParameter("islem").equals("menu_sil"))
        {
            if(request.getParameter("m_id") != null && request.getParameter("m_id") != "" ) 
            {
                String sm_id = (String) request.getParameter("m_id");
                int m_id = Integer.parseInt(sm_id);
                db.menu_sil(m_id);
                a_menuler = db.acilir_menuler_();
                menuler = db.menuler_();
                ckt_2 = 1;
                //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=menu");
            }
        }
        if(request.getParameter("islem").equals("menu_guncelle"))
        {
            if(request.getParameter("m_id") != null && request.getParameter("m_id") != "" && request.getParameter("menu_tip") != null && request.getParameter("menu_tip") != "" ) 
            {
                if(request.getParameter("menu_tip").equals("acilir_menu"))
                {
                    response.sendRedirect("../panel.jsp?modul=acilir_menu_guncelle&km_id="+request.getParameter("m_id"));
                }
                else if(request.getParameter("menu_tip").equals("sabit_menu"))
                {
                    response.sendRedirect("../panel.jsp?modul=menu_guncelle_isl&km_id="+request.getParameter("m_id"));
                }               
            }
        }
    }
    
    
%>

<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->

    
    
<!-- Select start -->
<!-- Tooltip Triggers start -->

 <%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("menu_sil"))
        {
       if(ckt_2 ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong> Menü Silme İşleminmeiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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

<div class="row" id="tooltip">
    <div class="col-12">
        <div class="card">
            <div class="card-header" style="position: relative;">
                <h4 class="card-title" style=" font-size: 128%;"> Menü Kontrol Tablosu</h4>
                 
                
                                <div class="form-group" style=" margin: auto; position: absolute; right:  1%; top: 14%; " >
                                    <!-- Buttons with Icon -->
                                 <button type="button" onclick="window.location='?modul=acilir_menu_ekle'" class="btn btn-outline-primary  btn-min-width mr-0 mb-1" style="font-size: 110%"><i class="la la-check"></i> Açılır Menü Ekle</button>
                                 <button type="button" onclick="window.location='?modul=menu_ekle'" class="btn btn-outline-primary  btn-min-width mr-0 mb-1" style="font-size: 110%"><i class="la la-check" ></i> Sabit Menü Ekle</button>                                   
                                 
                                </div>
                                                        
                
            </div>
            <div class="card-content collapse show">
                <div class="table-responsive">
                    <table class="table table-bordered mb-0">
                        <thead>
				<tr>
                                                                <th>Sıra No</th>
								<th>Menü İsmi</th>
                                                                <th>Menü Tipi</th>
								<th>Durum</th>
                                                                <th>İşlemler</th>							
				</tr>
			</thead>
                        
                        <% 
                            int m_id = 0;
                            for(int i=0;i<menuler.size();i++)
                            {
                                
                                    m_id = menuler.get(i).getMenu_id();
                                    String tip = menuler.get(i).getMenu_tipi();
                                        if(tip.equals("sabit_menu"))
                                        {
                                            tip = "Sabit Menü";
                                        }
                                        else
                                        {
                                            tip = "Açılır Menü";
                                        }
                        %>
                        
                        <tbody>
                            <tr>
                                <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;" >                                 
                                    <%= menuler.get(i).getSira_no() %>
                                </td>
                                
                                <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;">                                 
                                    <%= menuler.get(i).getBaslik()%>
                                </td>
                                
                                <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;">                                 
                                    <%= tip %>
                                </td>
                                
                                <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;">                                 
                                    <%= menuler.get(i).getDurum()%>
                                </td>
                                                        
                                <td style="padding-top: 1.2%; padding-bottom: 0%;  text-align: center;">
                                    <div class="text-center">  
                                        
                                        <button type="button" onclick="window.location='modul/menuler.jsp?islem=menu_guncelle&menu_tip=<%= menuler.get(i).getMenu_tipi() %>&m_id=<%= m_id%>'" class="btn btn-outline-info round btn-min-width mr-1 mb-1" style="font-size: 110%">Güncelle</button>
                                        <button type="button" onclick="window.location='?modul=menu&m_id=<%= m_id%>&islem=menu_sil '"  class="btn btn-outline-danger round btn-min-width mr-1 mb-1" style="font-size: 110%">Sil</button>                                                                                                                
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


       

    
    
    
    