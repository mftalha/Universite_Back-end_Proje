<%-- 
    Document   : menu_gnc_isl
    Created on : 27.Eki.2021, 15:31:46
    Author     : casper
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="veri.menu"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    db_katmani db = new db_katmani();
    int ckt=0;
    String secili ="";// url veya icerik hangisinin seçili oldugunu konturol edip js te ona gore gorunurluk ayarlana
    
    if(request.getParameter("islem_son") != null && request.getParameter("islem_son")!= "")
{
    if(request.getParameter("islem_son").equals("giris_2_son") )
    { //giris_2_son
        if(request.getParameter("s_2") != null && request.getParameter("s_2")!= "" && request.getParameter("baslik") != null && request.getParameter("baslik")!= "" && request.getParameter("km_id") != null && request.getParameter("km_id")!= "" && request.getParameter("sira_no") != null && request.getParameter("sira_no")!= "")
        {
            String icerik = "null";
            String url = "null";
            int knt =0;
            String baslik = new String(request.getParameter("baslik").getBytes("ISO-8859-9"), "UTF-8");                   
             
            String durum = new String(request.getParameter("s_2").getBytes("ISO-8859-9"), "UTF-8");
            String ssira_no = request.getParameter("sira_no");
            int sira_no = Integer.parseInt(ssira_no);
            
            
            
            String sm_id = request.getParameter("km_id");
            int m_id = Integer.parseInt(sm_id); // y_sirano
            
            String y_sirano = request.getParameter("y_sirano");
            if(!y_sirano.equals(ssira_no)) 
            {
                knt=1;
            }
            
            //secme_islem
            String secme_islem = new String(request.getParameter("secme_islem").getBytes("ISO-8859-9"), "UTF-8");
            if(secme_islem.equals("icerik"))
            {
                icerik = new String(request.getParameter("icerik").getBytes("ISO-8859-9"), "UTF-8");
                url="null";
            }
            else
            {
                url = new String(request.getParameter("url").getBytes("ISO-8859-9"), "UTF-8");
                icerik="null";
            }
            db.menu_guncelle(baslik, icerik, durum,sira_no, m_id,knt,url);
            
            ckt =1;
            //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=menu&ss=bsr");       
        }     
    }
}
   
if(request.getParameter("km_id") != null && request.getParameter("km_id") != "" )
        {
        int km_id = Integer.parseInt(request.getParameter("km_id"));
        ArrayList<menu> duyurular = db.menuler_gunc(km_id); 
        for(int i=0;i<duyurular.size();i++)
    {
    String icerik_default = "";//icerik_default,url_default
    String url_default = "";
%>


<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
<section id="horizontal-form-layouts">
    
    <%
    if(request.getParameter("islem_son") != null && request.getParameter("islem_son") != "")
    {
        if(request.getParameter("islem_son").equals("giris_2_son"))
        {
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Sabit Menü Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
						
                            <form class="form form-horizontal striped-labels form-bordered" id="form" action="?modul=menu_guncelle_isl&islem_son=giris_2_son" method="post" name="form">
	                    	<div class="form-body">
	                    	
					<h4 class="form-section"><i class="ft-clipboard"></i> Sabit Menü Güncelle</h4>

		                        <div class="form-group row">
						<label class="col-md-2 label-control" for="projectinput5">Menü Adı</label>
						<div class="col-md-10">
                                                    <input type="text" id="baslik" class="form-control" value="<%=duyurular.get(i).getBaslik()%>" name="baslik">
		                            </div>
		                        </div>
                                            
                                         

		                        <div class="form-group row">
		                        	<label class="col-md-2 label-control" for="projectinput6">Durum</label>
		                        	<div class="col-md-10">
			                            <select id="projectinput6" name="s_2" class="form-control">
                                                        <%if(duyurular.get(i).getDurum().equals("Aktif"))
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
						<label class="col-md-2 label-control" for="projectinput5">Sıra No</label>
						<div class="col-md-10">
		                            	<input type="number" id="sira_no" class="form-control" value="<%=duyurular.get(i).getSira_no()%>" name="sira_no">
		                            </div>
		                        </div>
                                            
                                        <div class="form-group row">
		                        	<label class="col-md-2 label-control" for="projectinput6">İşlem Türünü Seçiniz</label>
		                        	<div class="col-md-10">
			                            <select id="ddselect" onchange="ddlselect()"  class="form-control " >
                                                        <%
                                                        if(duyurular.get(i).getUrl().equals("null"))
                                                        {
                                                            secili = "icerik_ekle";//icerik_default,url_default
                                                            icerik_default = duyurular.get(i).getIcerik();
                                                            url_default = "";
                                                        %>
			                                <option value="icerik_ekle" >İçerik Ekle</option>
                                                        <option value="url_ekle">Url Ekle</option>
                                                        <%
                                                         }
                                                         else
                                                         { 
                                                           secili="url_ekle";
                                                           icerik_default = "";
                                                           url_default = duyurular.get(i).getUrl();
                                                        %>
                                                         <option value="url_ekle">Url Ekle</option>
                                                         <option value="icerik_ekle" >İçerik Ekle</option>
                                                        <%
                                                         }
                                                        %>
			                            </select>
		                            </div>
                                        </div>
                                         
                                       
                                            
                                        <div class="form-group row" id="ttare">
                                                <label class="col-md-2 label-control" for="projectinput9">İçerik</label>
                                                <div class="col-md-10">							
                                                    <textarea id="editor" rows="5" class="form-control" name="icerik" ><%=icerik_default%></textarea>

                                                </div>
                                        </div>
                                        
                                        
                                               
                                        <div class="form-group row" id="url" >
                                            <label class="col-md-2 label-control" for="projectinput5">URL</label>
                                            <div class="col-md-10">
                                                <!--<input type="url" name="url"  placeholder="https://example.com" pattern="https://.*" size="30"  required> -->
                                               
                                                <input type="url" id="url_id" class="form-control" value="<%=url_default%>" placeholder="https://example.com"    name="url">
                                                
                                            </div>
                                         </div>
                                        
                                        
                            <input type="hidden"   name="km_id" value="<%= duyurular.get(i).getMenu_id()%>" required>
                            <input type="hidden"   name="g_baslik" value="<%= duyurular.get(i).getBaslik()%>" required>    
                            <input type="hidden"   name="y_sirano" value="<%= duyurular.get(i).getSira_no()%>" required>    
                            <input type="hidden"  id="secme_islem" name="secme_islem" <%if(duyurular.get(i).getUrl().equals("null")){%>value="icerik"<%}else{%>value="url"<%}%> required>  
                                
				</div>
                           
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=menu'" class="btn btn-warning btn-lg" style="width: 49%">
					<i class="ft-x" ></i> Geri <!-- class="ft-x" -->
                                      </button>
	                              <button type="submit"   class="btn btn-primary btn-lg" style="width: 50%">
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

<%
    }
  }
 secili = "\""+secili+"\"";
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script  type="text/javascript">
        
        var edtr = document.querySelector('#ttare');
        var urll = document.getElementById("url_id");
        var url_bas_knt="";
        var url_knt_snc= true;
        //let xxyy = document.getElementById("editor").value;
        //console.log("editor:"+xxyy);
        //xxyy.value="js de degis";
        //var Myelement = document.querySelector('textarea[name="icerik"]');
        
            //Myelement.value=("asds");
       
        //var dene = document.getElementById("ttare");
        //console.log("edtr"+edtr);
        //console.log("dene"+dene);
        var ur = document.querySelector('#url');
        var secili = <%=secili%>;//icerik,url // veritabanında seçili olarak gelen
        //alert(secili);
        
        if(secili ==="url_ekle") //seçili hangisiyse ona göre görünürlugu saglıyoruz
        {
           edtr.style.display='none';
           ur.style.display='';
        }
        else
        {
            ur.style.display='none';
            edtr.style.display='';
        }
     
        function ddlselect()
        {
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
                //xxyy.value="js de degis_2";
                edtr.style.display='none';
                ur.style.display='';
                document.getElementById("secme_islem").value="url";
            }
        }
        
</script>