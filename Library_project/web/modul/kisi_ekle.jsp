<%-- 
    Document   : kisi_ekle
    Created on : 18.Kas.2021, 11:00:47
    Author     : casper
--%>

<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int ckt =0;
    db_katmani db = new db_katmani();
    
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
    {
        if(request.getParameter("islem").equals("kisi_ekle"))
        {
    if(request.getParameter("ad_soyad") != null && request.getParameter("ad_soyad") != "" && request.getParameter("ssira_no") != null && request.getParameter("ssira_no") != "" )
    {
                String ad_soyad =new String(request.getParameter("ad_soyad").getBytes("ISO-8859-9"), "UTF-8");
                String unvan =new String(request.getParameter("unvan").getBytes("ISO-8859-9"), "UTF-8");
                String email =new String(request.getParameter("email").getBytes("ISO-8859-9"), "UTF-8");
                String cep_tel =(String) request.getParameter("Cep_tel");
                
                String dahili_tel = request.getParameter("dahili_tel");
                
                String ssira_no = request.getParameter("ssira_no");
                int sira_no = Integer.parseInt(ssira_no);

                String sb_id = request.getParameter("g_id");
                int g_id = Integer.parseInt(sb_id);

                //public void personel_ekle(String ad_soyad,String unvan,String email,int cep_tel,int dahili_tel ,int sira_no,int g_id)
                db.personel_ekle(ad_soyad, unvan, email, cep_tel, dahili_tel, sira_no, g_id);
                ckt =1;
               // response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=prs_kisi&islem=giris_1&b_id="+b_id);
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
        if(request.getParameter("islem").equals("kisi_ekle"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Kişi Ekleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
	                <h4 class="card-title" id="striped-row-layout-basic">Personel İşlemleri & Kişi Ekle</h4>
	                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
        			<div class="heading-elements">
	                   
	                </div>
	            </div>
	            <div class="card-content collpase show"> 
	                <div class="card-body">
                            <div class="card-text">
							<p><code>Personel İşlemleri & Kişi Ekle:</code> Eklemiş Olduğunuz Kişi ,Personel İşlemleri Sayfasında Eklendiği Birimin Bulunduğu Satırdaki Kişiler Butonuna Tıkladığınızda, Sıra Numarasına Göre Tabloda Gösterilir.</p>
						</div>
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=prs_kisi_ekle&islem=kisi_ekle" method="post">
	                    	<div class="form-body">
	                    		
					<h4 class="form-section"><i class="la la-ioxhost"></i> Personel İşlemleri & Kişi Ekle</h4>

		                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Ad Soyad</label>
						<div class="col-md-9">
                                                    <div class="position-relative has-icon-left">
		                            	<input type="text" id="timesheetinput1" class="form-control"  placeholder="Ad Soyad" name="ad_soyad" required>
                                                    <div class="form-control-position">
                                                                <i class="ft-user"></i>
                                                    </div>
                                                    </div>
		                            </div>
		                        </div>
                                        
                                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Ünvan</label>
						<div class="col-md-9">
                                                    <div class="position-relative has-icon-left">
		                            	<input type="text" id="projectinput5" class="form-control " placeholder="Ünvan" name="unvan">
                                                    <div class="form-control-position">
                                                                <i class="las la la-graduation-cap"></i>
                                                    </div>
                                                    </div>
                                                    </div>
		                        </div>
                                        
                                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Email</label>
						<div class="col-md-9">
                                                     <div class="position-relative has-icon-left">
		                            	<input type="text" aria-describedby="basic-addon1" class="form-control " placeholder="Email" name="email">
                                                    <div class="form-control-position">
                                                                <i class="las la la-at"></i>
                                                    </div>
                                                    </div>
		                            </div>
		                        </div>
                                        
                                        
                                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Cep Tel</label>
						
                                                <div class="col-md-9"> 
                                                     <div class="position-relative has-icon-left">
		                            	<input type="text" id="timesheetinput1"  class="form-control " placeholder="Cep Tel" name="Cep_tel">                                        
                                                    <div class="form-control-position">
                                                                <i class="las la la-mobile"></i>
                                                    </div>
                                                    </div>
		                            </div>
                                               
		                        </div>
                                        
                                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Dahili Tel</label>
						<div class="col-md-9">
                                                    <div class="position-relative has-icon-left">
		                            	<input type="text" id="projectinput5" class="form-control" placeholder="Dahili Tel" name="dahili_tel">
                                                    <div class="form-control-position">
                                                                <i class="ft-phone"></i>
                                                    </div>
                                                    </div>
		                            </div>
		                        </div>
                                        
                                        <div class="form-group row">
									<label class="col-md-3 label-control" for="projectinput5">Sıra Numarası</label>
									<div class="col-md-9">
                                                                            <div class="position-relative has-icon-left">
		                            	<input type="number" id="projectinput5" class="form-control" required="" placeholder="Sıra Numarası" name="ssira_no">
		                            <div class="form-control-position">
                                                                <i class="las la la-sort"></i>
                                                    </div>
                                                    </div>
                                                                            </div>
		                        </div>
                                        
                                       
                                        
                                        <input type="hidden"   name="g_id" value="<%= request.getParameter("g_id") %>" required>
								                                
							</div>
	                        <div class="form-actions">
                                    <button type="button" onclick="window.location='?modul=prs_kisi&g_id=<%=request.getParameter("g_id") %>'" class="btn btn-warning btn-lg" style="width: 49%">
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
