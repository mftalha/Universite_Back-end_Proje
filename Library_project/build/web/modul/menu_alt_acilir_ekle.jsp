<%-- 
    Document   : menu_alt_acilir_ekle
    Created on : 01.Kas.2021, 17:36:07
    Author     : casper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int ckt =0;
    String km_id =(String) request.getParameter("km_id");
    int m_id = Integer.parseInt(km_id);
    veri.db_katmani db = new veri.db_katmani();
    
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )//islem=basarili
    {
        if(request.getParameter("islem").equals("basarili"))
        {
            if(request.getParameter("baslik") != null && request.getParameter("baslik") != "" && request.getParameter("durum") != null && request.getParameter("durum") != "" && request.getParameter("sira_no") != null && request.getParameter("sira_no") != "" )
            {
                String url = "null";
                String icerik ="null";

                String baslik =(String) request.getParameter("baslik");
                String durum =(String) request.getParameter("durum"); 
                String ssira_no = (String)request.getParameter("sira_no");
                int sira_no = Integer.parseInt(ssira_no);
                
                String secme_islem = request.getParameter("secme_islem"); 

                if(secme_islem.equals("icerik"))
                {
                    icerik = request.getParameter("icerik");
                    url="null";
                }
                else
                {
                    url = request.getParameter("url");
                    icerik="null";
                }

                db.alt_acilir_menu_ekle(baslik, durum, icerik,sira_no,m_id,url);
                ckt =1;
                //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=alt_acilir_menu_ekle&km_id="+km_id);
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
        if(request.getParameter("islem").equals("basarili"))
        {
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">??</span>
									</button>
									<strong>Alt A????l??r Men?? Ekleme ????leminiz Ba??ar??yla Ger??ekle??mi??tir.<br> </strong> 
                                                                       
								</div>
<%}else{ %>
 <div class="alert bg-danger alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">??</span>
									</button>
									<strong>Uyar??! </strong> ????leminiz Ger??ekle??tirilirken Bir Hata Olu??tu.
								</div>                
<%
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
						
                            <form class="form form-horizontal striped-labels form-bordered" id="form" action="?modul=alt_acilir_menu_ekle&islem=basarili" method="post">
	                    	<div class="form-body">
	                    		
					<h4 class="form-section"><i class="ft-clipboard"></i> Alt A????l??r Men?? Ekle</h4>

		                        <div class="form-group row">
						<label class="col-md-2 label-control" for="projectinput5">Men?? ??smi</label>
						<div class="col-md-10">
		                            	<input type="text" id="baslik" class="form-control" placeholder="Basl??k" name="baslik">
		                            </div>
		                        </div>
                                        
                                        

		                        <div class="form-group row">
		                        	<label class="col-md-2 label-control" for="projectinput6">Durum</label>
		                        	<div class="col-md-10">
			                            <select id="projectinput6" name="durum" class="form-control">
			                                <option value="Aktif" >Aktif</option>
			                                <option value="Beklemede">Beklemede</option>		                                
			                            </select>
		                            </div>
                                        </div>
                                        
                                        <div class="form-group row">
						<label class="col-md-2 label-control" for="projectinput5">S??ra No</label>
						<div class="col-md-10">
		                            	<input type="number" id="sira_no" class="form-control" placeholder="S??ra No" name="sira_no">
		                            </div>
		                        </div>
                                        
                                       

                                        <div class="form-group row">
		                        	<label class="col-md-2 label-control" for="projectinput6">????lem T??r??n?? Se??iniz</label>
		                        	<div class="col-md-10">
			                            <select id="ddselect" onchange="ddlselect();"  class="form-control">
			                                <option value="Aktif" >????erik Ekle</option>
                                                        <option value="Beklemede">Url Ekle</option>         			                                		                                
			                            </select>
		                            </div>
                                        </div>	

                                            <div class="form-group row" id="ttare">
                                                    <label class="col-md-2 label-control" for="projectinput9">????erik</label>
                                                    <div class="col-md-10">							
                                                        <textarea  rows="5" class="ckeditor" id="editor1" name="icerik" ></textarea>
                                                    </div>
                                            </div>
                                        
                                         <div class="form-group row" id="url" style='display: none'>
                                            <label class="col-md-2 label-control" for="projectinput5">URL</label>
                                            <div class="col-md-10">
                                                <!--<input type="url" name="url"  placeholder="https://example.com" pattern="https://.*" size="30"  required> -->
                                                <input type="url" id="url_id" class="form-control" placeholder="https://example.com"  pattern="https://.*" name="url">
                                            </div>
                                         </div>                                    
                                        
                                        <input type="hidden"  id="km_id" name="km_id" value="<%= request.getParameter("km_id") %>" required>
                                        <input type="hidden"  id="secme_islem" name="secme_islem" value="icerik" required>  
                                            
							</div>
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=acilir_menu_guncelle&km_id=<%=m_id %>'" class="btn btn-warning btn-lg" style="width: 49%">
					<i class="ft-x" ></i> Geri <!-- class="ft-x" -->
                                      </button>
	                              <button type="submit"  class="btn btn-primary btn-lg" style="width: 50%">
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        var url_bas_knt="";
        var url_knt_snc= true;
        
        function ddlselect()
        {
            var edtr = document.querySelector('#ttare');
            var ur = document.querySelector('#url');
            
            var d=document.getElementById("ddselect");
            var displaytext=d.options[d.selectedIndex].text ;
            
            //ur.style.display='';           
            if(displaytext === "????erik Ekle")
            {               
                ur.style.display='none';
                edtr.style.display='';
                document.getElementById("secme_islem").value="icerik";
            }
           
            else if(displaytext === "Url Ekle")
            {                
                edtr.style.display='none';
                ur.style.display='';
                document.getElementById("secme_islem").value="url";
            }
            //console.log("secili:"+secili);
     } 
 
    </script>