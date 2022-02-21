<%-- 
    Document   : duyuru_ekle
    Created on : 18.Eki.2021, 11:57:17
    Author     : casper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    int ckt = 0;
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
    if(request.getParameter("baslik") != null && request.getParameter("baslik") != "" &&  request.getParameter("durum") != null &&  request.getParameter("durum") != "")
            {
                String baslik =new String(request.getParameter("baslik").getBytes("ISO-8859-9"), "UTF-8");
                String durum =new String(request.getParameter("durum").getBytes("ISO-8859-9"), "UTF-8");
                String icerik =new String(request.getParameter("icerik").getBytes("ISO-8859-9"), "UTF-8");
                veri.db_katmani db = new veri.db_katmani();
                db.duyuru_ekle(baslik, durum, icerik);
                ckt=1;
                //response.sendRedirect("../panel.jsp?modul=duyuru_ekle&durum=dyr_ekl_bsr");
            } //http://localhost:8080/Library_project/panel.jsp?modul=duyuru_ekle&durum=dyr_ekl_bsr
         
    }
%>


<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
            <section id="horizontal-form-layouts">
            
<%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("duyuru_ekle"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Duyuru Ekleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
	                <h4 class="card-title" id="striped-row-layout-basic">Duyuru İşlemleri & Duyuru Ekle</h4>
	                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
        			<div class="heading-elements">
	                   
	                </div>
	            </div>
	            <div class="card-content collpase show">
	                <div class="card-body">
                            <div class="card-text">
							<p><code>Duyuru İşlemleri & Duyuru Ekle:</code> Eklemiş Olduğunuz Duyuru ,Duyuru İşlemleri Sayfasında Eklenme Sırasına Göre Tabloda Gösterilir.</p>
						</div>
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=duyuru_ekle&islem=duyuru_ekle" method="post">
	                    	<div class="form-body">
	                    		
			                    

					<h4 class="form-section"><i class="la la-ioxhost"></i> Duyuru İşlemleri & Duyuru Ekle</h4>

		                        <div class="form-group row">
						<label class="col-md-2 label-control" for="projectinput5">Baslık</label>
						<div class="col-md-10">
		                            	<input type="text" id="projectinput5" class="form-control " placeholder="Baslık" name="baslik">
		                            </div>
		                        </div>

		                        <div class="form-group row">
		                        	<label class="col-md-2 label-control" for="projectinput6">Durum</label>
		                        	<div class="col-md-10">
			                            <select id="projectinput6" name="durum" class="form-control ">
			                                <option value="Aktif" >Aktif</option>
			                                <option value="Beklemede">Beklemede</option>		                                
			                            </select>
		                            </div>
                                        </div>		

                                        
                                            
                                        <div class="form-group row"  >
                                                <label class="col-md-2 label-control" for="projectinput9">İçerik</label>
                                                <div class="col-md-10">	                                                                           
                                                    <textarea id="editor" rows="5" class="form-control " name="icerik" placeholder="İçerik" ></textarea>                                                                                                     
                                                </div>
                                        </div>

                                       
                                        </div>

                                                        
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=duyuru_islm'" class="btn btn-warning btn-lg" style="width: 49%">
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
    
    
    

    
     