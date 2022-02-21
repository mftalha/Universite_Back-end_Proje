<%-- 
    Document   : personel_blm_guncelle
    Created on : 21.Eki.2021, 11:31:34
    Author     : casper
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="veri.personel_bolmlr"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%   
      db_katmani db = new db_katmani();
      
      int ckt =0;
      
      String sa_mn_id = request.getParameter("km_id");
      int a_mn_id = Integer.parseInt(sa_mn_id);
    
    if(request.getParameter("knt") != null && request.getParameter("knt")!= "")
    {
        if(request.getParameter("knt").equals("bsr"))
        {
            if(request.getParameter("km_id") != null && request.getParameter("km_id") != "" && request.getParameter("bolum_ad") != null && request.getParameter("bolum_ad") != "" && request.getParameter("durum") != null && request.getParameter("durum") != "" && request.getParameter("ssira_no") != null && request.getParameter("ssira_no") != ""  && request.getParameter("onceki") != null && request.getParameter("onceki") != "" )
            {
                int kont= 0 ;
               
                String bolum_ad =(String) request.getParameter("bolum_ad");
                String durum =(String) request.getParameter("durum");
                String ssira_no =(String) request.getParameter("ssira_no");
                int sira_no = Integer.parseInt(ssira_no);
                
                String sonceki =(String) request.getParameter("onceki");
                //int onceki = Integer.parseInt(sonceki);

                
                if(!ssira_no.equals(sonceki))
                {
                    kont =1;
                }   
                //onceki  
                
                //(int id,String durum,String ad,int sıra_no,int knt)
                db.bolum_bilgi_guncelleme(a_mn_id, durum, bolum_ad, sira_no,kont);
                ckt = 1;
                //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=prs_blm_gnc&isl=bsr");
            }
            
        }
            //knt=bsr
    }
    
ArrayList<personel_bolmlr> bölümler = db.personel_blm();
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
									<strong>Bölüm Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=prs_blm_gnc&knt=bsr" method="post">
	                    	<div class="form-body">
	                    		
					<h4 class="form-section"><i class="ft-clipboard"></i> Personel Bölüm Güncelle</h4>

                                        <% 
                                            for(int i=0;i<bölümler.size();i++)
                                            {
                                                if(a_mn_id == bölümler.get(i).getBolum_id())
                                                {
                                                                      
                                            %>
		                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Menü İsmi</label>
						<div class="col-md-9">
		                            	<input type="text" id="projectinput5" class="form-control" value="<%=bölümler.get(i).getBolum_ad()%>" name="bolum_ad">
		                            </div>
		                        </div>
                                        
                                        

		                        <div class="form-group row">
		                        	<label class="col-md-3 label-control" for="projectinput6">Durum</label>
		                        	<div class="col-md-9">
			                            <select id="projectinput6" name="durum" class="form-control">
                                                        <%if(bölümler.get(i).getDurum().equals("Aktif"))
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
		                            	<input type="number" id="projectinput5" class="form-control" value="<%=bölümler.get(i).getSira_no()%>" name="ssira_no">
		                            </div>
		                        </div>
                                        
                                        <input type="hidden"   name="km_id" value="<%= request.getParameter("km_id") %>" required>
                                        <input type="hidden"   name="onceki" value="<%= bölümler.get(i).getSira_no()%>" required>   
                                        
                                           <% 
                                               } 
                                            }

                                                     
                            %>	
                            
							</div>
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=personem_blm_islm'" class="btn btn-warning btn-lg" style="width: 49%">
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
    

  </div>
      </div>
    </div>