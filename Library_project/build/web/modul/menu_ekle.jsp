<%-- 
    Document   : menu_ekle
    Created on : 27.Eki.2021, 14:17:11
    Author     : casper
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="veri.menu"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    veri.db_katmani db = new veri.db_katmani();
    if(request.getParameter("islem") != null && request.getParameter("islem") !="")
    {
        if(request.getParameter("islem").equals("basarili"))
            {
                if(request.getParameter("baslik") !=null && request.getParameter("baslik") !="" && request.getParameter("sira_no") !=null && request.getParameter("sira_no") !="")
                {
                    String url = "null";
                    String icerik ="null";

                    String baslik =(String) request.getParameter("baslik");
                    String durum =(String) request.getParameter("durum");              
                    String menu_tip = "sabit_menu";
                    String ssira_no =(String) request.getParameter("sira_no");
                    System.out.println("sira_no"+ssira_no);
                    int sira_no = Integer.parseInt(ssira_no);
                    System.out.println("secili:"+request.getParameter("secili"));
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

                    db.menu_ekle(baslik, durum, icerik,menu_tip,sira_no,url);
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
										<span aria-hidden="true">×</span>
									</button>
									<strong>Sabit Menü Ekleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
								</div>
<%}else{%>
 <div class="alert bg-danger alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Uyarı! </strong> İşleminiz Gerçekleştirilirken Bir Hata Oluştu.
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
						
                            <form class="form form-horizontal striped-labels form-bordered" id="form" action="?modul=menu_ekle&islem=basarili" method="post">
	                    	<div class="form-body">
	                    		
			                    

					<h4 class="form-section"><i class="ft-clipboard"></i> Sabit Menü Ekle</h4>

		                        <div class="form-group row">
						<label class="col-md-2 label-control" for="projectinput5">Menü İsmi</label>
						<div class="col-md-10">
		                            	<input type="text" id="baslik" class="form-control" placeholder="Baslık" name="baslik">
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
						<label class="col-md-2 label-control" for="projectinput5">Sıra No</label>
						<div class="col-md-10">
		                            	<input type="number" id="sira_no" class="form-control" placeholder="Sıra No" name="sira_no">
		                            </div>
		                        </div>
                                        
                                        <div class="form-group row">
		                        	<label class="col-md-2 label-control" for="projectinput6">İşlem Türünü Seçiniz</label>
		                        	<div class="col-md-10">
			                            <select id="ddselect" onchange="ddlselect();"  class="form-control">
			                                <option value="Aktif" >İçerik Ekle</option>
                                                        <option value="Beklemede">Url Ekle</option>         			                                		                                
			                            </select>
		                            </div>
                                        </div>	

                                            <div class="form-group row" id="ttare">
                                                    <label class="col-md-2 label-control" for="projectinput9">İçerik</label>
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
                                        
                                        <input type="hidden"  id="secme_islem" name="secme_islem" value="icerik" required>  
                                            
							</div>
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=menu'" class="btn btn-warning btn-lg" style="width: 49%">
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
            if(displaytext === "İçerik Ekle")
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