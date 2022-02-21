<%-- 
    Document   : duyuru_gnc_isl
    Created on : 27.Eki.2021, 11:16:07
    Author     : casper
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="veri.duyuru"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    db_katmani db = new db_katmani();
    int ckt =0;
    
    
    if(request.getParameter("islem_son") != null && request.getParameter("islem_son")!= "")
{
    
    if(request.getParameter("islem_son").equals("giris_2_son") )
    { //giris_2_son
     
        if(request.getParameter("s_2") != null && request.getParameter("s_2")!= "" && request.getParameter("baslik") != null && request.getParameter("baslik")!= "" && request.getParameter("m_id") != null && request.getParameter("m_id")!= "")
        {
            String baslik = new String(request.getParameter("baslik").getBytes("ISO-8859-9"), "UTF-8");
            String durum = request.getParameter("s_2");
            String icerik = new String(request.getParameter("icerik").getBytes("ISO-8859-9"), "UTF-8");
            String sd_id = request.getParameter("m_id");
            int d_id = Integer.parseInt(sd_id);
            db.duyuru_guncelle(baslik, icerik, durum, d_id);
            ckt =1;
            //response.sendRedirect("../panel.jsp?modul=duyuru_guncelle_isl&m_id="+request.getParameter("m_id")+"&islem=bsr");       
        }
        
    }
    
    
}
    
if( request.getParameter("m_id") != null && request.getParameter("m_id") != "" )
        {
        ArrayList<duyuru> duyurular = db.duyurular();
        String sm_id = request.getParameter("m_id");
        int m_id = Integer.parseInt(sm_id);
        for(int i=0;i<duyurular.size();i++)
    {
        if(m_id == duyurular.get(i).getDyr_id())
{

%>


<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
            
<%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("bsr"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Duyuru Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
            
            
            
<section id="horizontal-form-layouts">
	<div class="row">
	    <div class="col-md-12">
	        <div class="card">
	            
	            <div class="card-content collpase show">
	                <div class="card-body">
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=duyuru_guncelle_isl&islem=bsr&islem_son=giris_2_son" method="post">
	                    	<div class="form-body">
	                    		
			                    

					<h4 class="form-section"><i class="ft-clipboard"></i> Duyuru Güncelle</h4>

		                        <div class="form-group row">
						<label class="col-md-2 label-control" for="projectinput5">Baslık</label>
						<div class="col-md-10">
                                                    <input type="text" id="projectinput5" class="form-control " value="<%=duyurular.get(i).getDyr_baslik() %>" name="baslik">
		                            </div>
		                        </div>

		                        <div class="form-group row">
		                        	<label class="col-md-2 label-control" for="projectinput6">Durum</label>
		                        	<div class="col-md-10">
			                            <select id="projectinput6" name="s_2" class="form-control ">
                                                        <%if(duyurular.get(i).getDyr_durum().equals("Aktif"))
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
									<label class="col-md-2 label-control" for="projectinput9">İçerik</label>
									<div class="col-md-10">							
                                                                            <textarea id="editor" rows="5" class="form-control" name="icerik" ><%=duyurular.get(i).getDyr_icerik()%></textarea>
                                                                            
									</div>
								</div>
                                                                        
                                        
                            <input type="hidden"   name="m_id" value="<%= duyurular.get(i).getDyr_id() %>" required>
                            <input type="hidden"   name="g_baslik" value="<%= duyurular.get(i).getDyr_baslik()%>" required>    
                                        
                            
				</div>
                           
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=duyuru_islm'" class="btn btn-warning btn-lg" style="width: 49%">
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

<%
    }
    }
  }

%>
