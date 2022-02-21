<%-- 
    Document   : personel_gorev_ekle
    Created on : 22.Eki.2021, 15:25:00
    Author     : casper
--%>

<%@page import="veri.per_gorevler"%>
<%@page import="java.util.ArrayList"%>

<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%   
      db_katmani db = new db_katmani();
      ArrayList<per_gorevler> gorevler = db.personel_grv();
      int ckt =0;
      
       String sbol_id= request.getParameter("gnd"); 
       int bol_id = Integer.parseInt(sbol_id);
       String bol_ad = request.getParameter("bol_ad");
    
    if(request.getParameter("knt") != null && request.getParameter("knt") != "" )
    {   
                                                               
        
        if(request.getParameter("bolum_ad") != null && request.getParameter("bolum_ad") != "" && request.getParameter("durum") != null && request.getParameter("durum") != "" && request.getParameter("ssira_no") != null  && request.getParameter("ssira_no") != ""  && request.getParameter("gnd") != null  && request.getParameter("gnd") != "" )
        {
            
            if(request.getParameter("knt").equals("bsr"))
                
            {
                String bolum_adi =(String) request.getParameter("bolum_ad");
                String durum =(String) request.getParameter("durum");
                String ssira_no =(String) request.getParameter("ssira_no");
                int sira_no = Integer.parseInt(ssira_no);
                ckt =1;
               
                db.personel_gorev_ekle(bolum_adi, durum, sira_no, bol_id );
            }     
        
                //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=prs_grv_ekl&knt=dolu&gnd="+bol_id+"&bol_ad="+bol_ad);
        }
        
    }

%>



<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
<section id="horizontal-form-layouts">
    
<%
    if(request.getParameter("knt") != null && request.getParameter("knt") != "")
    {
        if(request.getParameter("knt").equals("bsr"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Birim Ekleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
	                
	                <h4 class="card-title" id="striped-row-layout-basic">Personel İşlemleri & Birim Ekle</h4>
	                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
        			<div class="heading-elements">
	                   
	                </div>
	            </div>
	            <div class="card-content collpase show">
	                <div class="card-body">
                            <div class="card-text">
							<p><code>Personel İşlemleri & Birim Ekle:</code> Eklemiş Olduğunuz Birim , Personel İşlemleri Sayfasında <code> <%= bol_ad %> </code>  Tablosunda Sıra Numarasına Göre Gösterilir.</p>
						</div>
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=prs_grv_ekl&knt=bsr" method="post">
	                    	<div class="form-body">
	                    		
			                    

					<h4 class="form-section"><i class="la la-ioxhost"></i> Personel İşlemleri & Birim Ekle </h4>

		                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Birim Ad</label>
						<div class="col-md-9">
		                            	<input type="text" id="projectinput5" class="form-control" placeholder="Baslık" name="bolum_ad">
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
		                            	<input type="number" id="projectinput5" class="form-control" placeholder="Sıra No" name="ssira_no">
		                            </div>
		                        </div>
                                        
                                        <input type="hidden"   name="gnd" value="<%= request.getParameter("gnd") %>" required>
                                        <input type="hidden"   name="bol_ad" value="<%= request.getParameter("bol_ad")%>" required>   
							</div>
                                
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=personel_islemler'" class="btn btn-warning btn-lg" style="width: 49%">
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