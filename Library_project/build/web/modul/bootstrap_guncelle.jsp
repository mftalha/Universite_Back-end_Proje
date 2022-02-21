<%-- 
    Document   : bootstrap_guncelle
    Created on : 26.Kas.2021, 17:44:20
    Author     : casper
--%>

<%@page import="veri.boostrap"%>
<%@page import="veri.db_katmani"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    db_katmani db = new db_katmani();
    int ckt =0;
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )//islem=basarili
    {
        if(request.getParameter("baslik") != null && request.getParameter("baslik") != "" && request.getParameter("durum") != null && request.getParameter("durum") != "" && request.getParameter("sayfa") != null && request.getParameter("sayfa") != "" )
            {
                int knt =0;
                String baslik =new String(request.getParameter("baslik").getBytes("ISO-8859-9"), "UTF-8");
                String durum =new String(request.getParameter("durum").getBytes("ISO-8859-9"), "UTF-8");                            
                String sayfa =new String(request.getParameter("sayfa").getBytes("ISO-8859-9"), "UTF-8");                            
                String icerik =new String(request.getParameter("icerik").getBytes("ISO-8859-9"), "UTF-8");
                int id = Integer.parseInt( request.getParameter("m_id"));
                
                if(durum.equals("Aktif"))
                {
                    knt =1; // diğer bütün verileri pasif yapacam.
                }
              
                //public void boostrap_guncelle(String sayfa ,String baslik,String icerik,String durum,int modal_id,int knt) // web sitesine giren kullanıcının son girilme tarihini güncelliyorum
                db.boostrap_guncelle(sayfa, baslik, icerik,durum,id,knt);
                ckt=1;
                //response.sendRedirect("?modul=menu_ekle&durum=dyr_ekl_bsr");
            }
    }   

ArrayList<boostrap> boostraplar = db.boostraplar();    
if( request.getParameter("m_id") != null && request.getParameter("m_id") != "" )
        {
        String kmid = request.getParameter("m_id");
        int km_id = Integer.parseInt(kmid);
        for(int i=0;i<boostraplar.size();i++)
    {
        if(km_id == boostraplar.get(i).getModal_id())
{
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
									<strong>Modal Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=modal_guncelle&islem=basarili" method="post">
	                    	<div class="form-body">
	                   
					<h4 class="form-section"><i class="ft-clipboard"></i> Modal Güncelle</h4>

		                        <div class="form-group row">
						<label class="col-md-2 label-control" for="projectinput5">Modal Başlık</label>
						<div class="col-md-10">
		                            	<input type="text" id="projectinput5" class="form-control" value="<%=boostraplar.get(i).getBaslik()%>" name="baslik">
		                            </div>
		                        </div>
                                       
		                        <div class="form-group row">
		                        	<label class="col-md-2 label-control" for="projectinput6">Durum</label>
		                        	<div class="col-md-10">
			                            <select id="projectinput6" name="durum" class="form-control">
                                                        <%if(boostraplar.get(i).getDurum().equals("Aktif"))
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
		                        	<label class="col-md-2 label-control" for="projectinput6">Eklenecek Sayfa</label>
		                        	<div class="col-md-10">
			                            <select id="ddselect"  name="sayfa" class="form-control "  >
                                                        <%if(boostraplar.get(i).getSayfa().equals("ana_sayfa"))
                                                        {
                                                            %>
			                                <option value="ana_sayfa">Ana Sayfa</option>
                                                        <option value="abone_veritabani">Abone Veritabanı</option>
                                                        <option value="deneme_veritabani">Deneme Veritabanı</option>         			                                		                               
                                                        <%
                                                        }
                                                        else if(boostraplar.get(i).getSayfa().equals("abone_veritabani"))
                                                        {
                                                        %>
                                                        <option value="abone_veritabani">Abone Veritabanı</option>
                                                        <option value="ana_sayfa">Ana Sayfa</option>                                                           
                                                        <option value="deneme_veritabani">Deneme Veritabanı</option>         			                                		                                
                                                        <%
                                                        }
                                                        else if(boostraplar.get(i).getSayfa().equals("deneme_veritabani"))
                                                        {
                                                        %>
                                                        <option value="deneme_veritabani">Deneme Veritabanı</option>
                                                        <option value="ana_sayfa">Ana Sayfa</option>
                                                        <option value="abone_veritabani">Abone Veritabanı</option>         			                                		                                  
                                                        <%
                                                        }
                                                        %>
			                            </select>
		                            </div>
                                        </div>	

                                            <div class="form-group row" >
                                                    <label class="col-md-2 label-control" for="projectinput9">İçerik</label>
                                                    <div class="col-md-10">							
                                                        <textarea id="editor" rows="5" class="form-control" name="icerik" placeholder="İçerik"><%= boostraplar.get(i).getIcerik()%></textarea>
                                                    </div>
                                            </div>
                                        
                                                    <input type="hidden"   name="m_id" value="<%= boostraplar.get(i).getModal_id()%>" required>
						</div>
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=modal_islemleri'" class="btn btn-warning btn-lg" style="width: 49%">
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