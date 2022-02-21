<%-- 
    Document   : menu_acilir_guncelle
    Created on : 01.Kas.2021, 11:56:20
    Author     : casper
--%>

<%@page import="veri.menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.db_katmani"%>
<%@page import="veri.acilir_menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<% 
    db_katmani db = new db_katmani();
    int ckt = 0;
    int ckt_2=0;
    
    ArrayList<acilir_menu> a_menuler = db.acilir_menuler_();
    int a_mn_id = Integer.parseInt(request.getParameter("km_id"));
    ArrayList<menu> menuler = db.menuler_gnc(a_mn_id);
    
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
    {
        if(request.getParameter("islem").equals("aclır_ana_gunc"))
        {
            if(request.getParameter("baslik") != null && request.getParameter("baslik") != "" && request.getParameter("s_2") != null && request.getParameter("s_2") != "" && request.getParameter("sira_no") != null && request.getParameter("sira_no") != "")
            {
                int knt =0;
                String baslik = new String(request.getParameter("baslik").getBytes("ISO-8859-9"), "UTF-8");
                String durum = new String(request.getParameter("s_2").getBytes("ISO-8859-9"), "UTF-8");             
                String ssira_no = (String)request.getParameter("sira_no"); 
                int sira_no = Integer.parseInt(ssira_no);
                
                String icerik = "null";
                String url = "null";
                String y_sirano = request.getParameter("y_sirano");
                
                if(!y_sirano.equals(ssira_no)) 
                {
                    knt=1;
                }

                db.menu_guncelle(baslik, icerik, durum,sira_no, a_mn_id,knt,url);
                
                ckt = 1;
                a_menuler = db.acilir_menuler_();
                menuler = db.menuler_gnc(a_mn_id);
               // response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=acilir_menu_guncelle&km_id="+request.getParameter("km_id"));  
                          
            }
        }
        if(request.getParameter("islem").equals("menu_sil"))
        {
            if(request.getParameter("m_id") != null && request.getParameter("m_id") != "" ) 
            {
                String sm_id = (String) request.getParameter("m_id");
                int m_id = Integer.parseInt(sm_id);
                db.alt_menu_sil(m_id);
                ckt_2=1;
                a_menuler = db.acilir_menuler_();
                menuler = db.menuler_gnc(a_mn_id);
                //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=acilir_menu_guncelle&km_id="+a_mn_id);
            }
        }
        if(request.getParameter("islem").equals("menu_guncelle"))
        {
            if(request.getParameter("m_id") != null && request.getParameter("m_id") != "" && request.getParameter("menu_tip") != null && request.getParameter("menu_tip") != "" ) 
            {
                if(request.getParameter("menu_tip").equals("acilir_menu"))
                {
                    response.sendRedirect("panel.jsp?modul=menu_guncelle_isl&km_id="+request.getParameter("m_id"));
                }
                else if(request.getParameter("menu_tip").equals("sabit_menu"))
                {
                    response.sendRedirect("panel.jsp?modul=menu_guncelle_isl&km_id="+request.getParameter("m_id"));
                }
                
            }
        }
    }

%>

<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
<section id="horizontal-form-layouts">
    
    <%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("aclır_ana_gunc"))
        {
       if(ckt ==1)
       {
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Açılır Menü Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
	<div class="row">
	    <div class="col-md-12">
	        <div class="card">
	            <div class="card-header">
	                
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
	            <div class="card-content collpase show">
	                <div class="card-body"> 
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=acilir_menu_guncelle&islem=aclır_ana_gunc" method="post">
	                    	<div class="form-body">
	                    		
					<h4 class="form-section"><i class="ft-clipboard"></i> Açılır Menü Güncelle</h4>

                                        <% 
                                            for(int i=0;i<menuler.size();i++)
                                            {            
                                            %>
		                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Menü İsmi</label>
						<div class="col-md-9">
		                            	<input type="text" id="projectinput5" class="form-control" value="<%=menuler.get(i).getBaslik()%>" name="baslik">
		                            </div>
		                        </div>
                                        
                                        

		                        <div class="form-group row">
		                        	<label class="col-md-3 label-control" for="projectinput6">Durum</label>
		                        	<div class="col-md-9">
			                            <select id="projectinput6" name="s_2" class="form-control">
                                                        <%if(menuler.get(i).getDurum().equals("Aktif"))
                                                        {
                                                            %>
			                                <option value="Aktif" >Aktif</option>
			                                <option value="Beklemede">Beklemede</option>
                                                        <%
                                                            }
                                                            else
                                                            {
                                                            %>
                                                            <option value="Beklemede">Beklemede</option>
                                                            <option value="Aktif" >Aktif</option>
                                                            <%
                                                            }
                                                            %>
			                            </select>
		                            </div>
                                        </div>
                                        
                                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Sıra No</label>
						<div class="col-md-9">
		                            	<input type="number" id="projectinput5" class="form-control" value="<%=menuler.get(i).getSira_no()%>" name="sira_no">
		                            </div>
		                        </div>
                                        
                                        <input type="hidden"   name="km_id" value="<%= request.getParameter("km_id") %>" required>
                                        <input type="hidden"   name="y_sirano" value="<%= menuler.get(i).getSira_no()%>" required>   
                                        
                                           <% 
                                            }                          
                            %>	
                            
							</div>
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=menu'" class="btn btn-warning btn-lg" style="width: 49%">
					<i class="ft-x" ></i> Geri <!-- class="ft-x" -->
                                      </button>
	                              <button type="submit" class="btn btn-primary btn-lg" style="width: 50%">
	                                <i class="la la-check-square-o"></i> Güncelle
	                            </button>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>


</section>
<!-- // Basic form layout section end -->
      
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    
    
    
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
									<strong>Alt Açılır Menü Silme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
                <h4 class="card-title" style=" font-size: 128%;"> Alt Açılır Menü Konturol Tablosu</h4>
                
                <button type="button" onclick="window.location='?modul=alt_acilir_menu_ekle&km_id=<%=a_mn_id %>'" class="btn btn-outline-primary square btn-min-width mr-1 mb-1" style=" margin: auto; position: absolute; right:  0.2%; top: 14%; font-size: 110%"><i class="la la-check"></i> Alt Açılır Menü Ekle</button>                                                                 
                
            </div>
            <div class="card-content collapse show">
                <div class="table-responsive">
                    <table class="table table-bordered mb-0">
                        <thead>
				<tr>
                                                                <th>Sıra No</th>
								<th>Menü İsmi</th>
								<th>Durum</th>
                                                                <th>İşlemler</th>							
				</tr>
			</thead>
                        
                        <% 
                            int m_id = 0; // silinecek alt menü id
                            
                            for(int i=0;i<a_menuler.size();i++)
                            {
                                if(a_menuler.get(i).getMenu_id() == a_mn_id )
                                {  
                                    m_id = a_menuler.get(i).getAcilir_menu_id();
                        %>
                        
                        <tbody>
                            <tr>
                                <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;" >                                 
                                    <%= a_menuler.get(i).getSira_no() %>
                                </td>
                                
                                <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;">                                 
                                    <%= a_menuler.get(i).getBaslik()%>
                                </td>
                                
                                
                                
                                <td style="padding-top: 2.2%; padding-bottom: 1%;  text-align: center; font-size: 110%;">                                 
                                    <%= a_menuler.get(i).getDurum()%>
                                </td>
                                                        
                                <td style="padding-top: 1.2%; padding-bottom: 0%;  text-align: center;">
                                    <div class="text-center">  
                                        
                                        <button type="button" onclick="window.location='?modul=alt_acilir_menu_guncelle&m_id=<%= m_id%>&km_id=<%= a_mn_id %>'" class="btn btn-outline-info round btn-min-width mr-1 mb-1" style="font-size: 110%">Güncelle</button>
                                        <button type="button" onclick="window.location='?modul=acilir_menu_guncelle&km_id=<%=request.getParameter("km_id")%>&m_id=<%= m_id%>&islem=menu_sil&km_id=<%= a_mn_id %> '"  class="btn btn-outline-danger round btn-min-width mr-1 mb-1" style="font-size: 110%">Sil</button>                                                                                                                
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