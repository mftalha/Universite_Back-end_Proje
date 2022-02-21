<%-- 
    Document   : kisi_guncelle
    Created on : 18.Kas.2021, 14:21:22
    Author     : casper
--%>

<%@page import="veri.db_katmani"%>
<%@page import="veri.personel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    db_katmani db = new db_katmani();
    int ckt =0;
   
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
    {
        if(request.getParameter("islem").equals("kisi_guncelle"))
        {
        if(request.getParameter("ad_soyad") != null && request.getParameter("ad_soyad") != "" && request.getParameter("ssira_no") != null && request.getParameter("ssira_no") != "")
            {

                String ad_soyad =new String(request.getParameter("ad_soyad").getBytes("ISO-8859-9"), "UTF-8");
                String unvan =new String(request.getParameter("unvan").getBytes("ISO-8859-9"), "UTF-8");
                String email =new String(request.getParameter("email").getBytes("ISO-8859-9"), "UTF-8");
                
                String cep_tel = request.getParameter("Cep_tel");          

                String dahili_tel = request.getParameter("dahili_tel");

                String ssira_no = request.getParameter("ssira_no");
                int sira_no = Integer.parseInt(ssira_no);

                String sk_id =(String) request.getParameter("k_id");
                int k_id = Integer.parseInt(sk_id);

                int kont =0;
                String sonceki =(String) request.getParameter("onceki");
                if(!ssira_no.equals(sonceki))
                    {
                        kont =1;
                    }
                String gnd = request.getParameter("g_id");

                //public void personel_ekle(String ad_soyad,String unvan,String email,int cep_tel,int dahili_tel ,int sira_no,int g_id)
                db.personel_guncelle(ad_soyad, unvan, email, cep_tel, dahili_tel, sira_no, k_id,kont);
                
                ckt=1;
                //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=prs_kisi&islem=giris_1&b_id="+b_id);     
                
            }
    }
    }
    
    
    ArrayList<personel> kisiler = db.personel_b();
 if(request.getParameter("k_id") != null && request.getParameter("k_id") != "")
 {
     
    int k_id = Integer.parseInt((String) request.getParameter("k_id"));
    for(int i=0;i<kisiler.size();i++)
    {
        if(k_id == kisiler.get(i).getKisi_id())
        {
%>

<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
            <section id="horizontal-form-layouts">
            
<%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("kisi_guncelle"))
        {
       if(ckt ==1)
       {
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Kişi Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
	            
	            <div class="card-content collpase show"> 
	                <div class="card-body">
                           
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=prs_kisi_guncelle&islem=kisi_guncelle" method="post">
	                    	<div class="form-body">
	                    		
					<h4 class="form-section"><i class="ft-clipboard"></i> Kişi Güncelle</h4>

		                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Ad Soyad</label>
						<div class="col-md-9">
                                                    <div class="position-relative has-icon-left">
                                                        <input type="text" id="timesheetinput1" class="form-control"  value="<%=kisiler.get(i).getAd_soyad() %>" name="ad_soyad" required>
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
		                            	<input type="text" id="projectinput5" class="form-control" value="<%= kisiler.get(i).getUnvan()%>" name="unvan">
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
		                            	<input type="text" aria-describedby="basic-addon1" class="form-control " value="<%= kisiler.get(i).getEmail()%>" name="email">
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
		                            	<input type="text"  class="form-control " value="<%= kisiler.get(i).getCep_tel()%>" name="Cep_tel">                                        
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
		                            	<input type="text" id="projectinput5" class="form-control" value="<%= kisiler.get(i).getDahili_tel()%>" name="dahili_tel">
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
		                            	<input type="number" id="projectinput5" class="form-control" required="" value="<%= kisiler.get(i).getSira_no()%>" name="ssira_no">
		                            <div class="form-control-position">
                                                                <i class="las la la-sort"></i>
                                                    </div>
                                                    </div>
                                                                        </div>
		                        </div>
                                        
                                        <input type="hidden"   name="g_id" value="<%= request.getParameter("g_id") %>" required>
					<input type="hidden"   name="k_id" value="<%= request.getParameter("k_id") %>" required>
                                        <input type="hidden"   name="onceki" value="<%= kisiler.get(i).getSira_no() %>" required>
							</div>
	                        <div class="form-actions">
                                    <button type="button" onclick="window.location='?modul=prs_kisi&g_id=<%=request.getParameter("g_id") %>'" class="btn btn-warning btn-lg" style="width: 49%">
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
        </div>
      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    
    
<%            
        }
    }
  }  
%>
