<%-- 
    Document   : menu_acilir_ekle
    Created on : 01.Kas.2021, 13:42:26
    Author     : casper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int ckt =0;
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )//islem=basarili
        if(request.getParameter("baslik") != null && request.getParameter("baslik") != "" && request.getParameter("durum") != null && request.getParameter("durum") != "" && request.getParameter("sira_no") != null && request.getParameter("sira_no") != "" )
            {
                String baslik =(String) request.getParameter("baslik");
                String durum =(String) request.getParameter("durum");
                String icerik = "null";
                String url="null";
                String menu_tip = "acilir_menu";
                String ssira_no =(String) request.getParameter("sira_no");
                int sira_no = Integer.parseInt(ssira_no);
              
                veri.db_katmani db = new veri.db_katmani();
                db.menu_ekle(baslik, durum, icerik,menu_tip,sira_no,url);
                ckt=1;
                //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=acilir_menu_ekle&durum=dyr_ekl_bsr");
            }
          
%>


<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
<section id="horizontal-form-layouts">
    
<%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("basarili"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Açılır Menü Ekleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
	                
	                <h4 class="card-title" id="striped-row-layout-basic">Menü İşlemleri & Açılır Menü Ekle</h4>
	                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
        			<div class="heading-elements">
	                   
	                </div>
	            </div>
	            <div class="card-content collpase show">
	                <div class="card-body">
                            <div class="card-text">
							<p><code>Menü İşlemleri & Açılır Menü Ekle:</code> Eklemiş Olduğunuz Açılır Menü , Menü İşlemleri Sayfasında Sıra Numarasına Göre Tabloda Gösterilir.</p>
						</div>
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=acilir_menu_ekle&islem=basarili" method="post">
	                    	<div class="form-body">
	                    		
			                    

					<h4 class="form-section"><i class="la la-ioxhost"></i> Menü İşlemleri & Açılır Menü Ekle </h4>

		                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Menü İsmi</label>
						<div class="col-md-9">
		                            	<input type="text" id="projectinput5" class="form-control" placeholder="Baslık" name="baslik">
		                            </div>
		                        </div>
                                        
                                        

		                        <div class="form-group row">
		                        	<label class="col-md-3 label-control" for="projectinput6">Durum</label>
		                        	<div class="col-md-9">
			                            <select id="projectinput6" name="durum" class="form-control">
			                                <option value="Aktif" >Aktif</option>
			                                <option value="Beklemede">Beklemede</option>		                                
			                            </select>
		                            </div>
                                        </div>
                                        
                                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Sıra No</label>
						<div class="col-md-9">
		                            	<input type="number" id="projectinput5" class="form-control" placeholder="Sıra No" name="sira_no">
		                            </div>
		                        </div>

                            
							</div>
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=menu'" class="btn btn-warning btn-lg" style="width: 49%">
					<i class="ft-x" ></i> Geri <!-- class="ft-x" -->
                                      </button>
	                              <button type="submit" class="btn btn-primary btn-lg" style="width: 50%">
	                                <i class="la la-check-square-o"></i> Ekle
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
        </div>
      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    
