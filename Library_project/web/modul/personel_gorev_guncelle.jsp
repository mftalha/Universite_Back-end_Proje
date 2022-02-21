<%-- 
    Document   : personel_gorev_guncelle
    Created on : 25.Eki.2021, 10:26:49
    Author     : casper
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="veri.per_gorevler"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    db_katmani db = new db_katmani();
    //ArrayList<per_gorevler> gorevler = db.personel_grv();
    int ckt =0;
    
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )//islem=basarili
    {
    if(request.getParameter("m_id") != null && request.getParameter("m_id") != "" && request.getParameter("g_ad") != null && request.getParameter("g_ad") != ""  && request.getParameter("g_durum") != null && request.getParameter("g_durum") != "" && request.getParameter("g_sira") != null && request.getParameter("g_sira") != ""  && request.getParameter("b_ad") != null && request.getParameter("b_ad") != ""  && request.getParameter("b_id") != null && request.getParameter("b_id") != "" && request.getParameter("onceki") != null && request.getParameter("onceki") != "" )
    {
     
    
    String sid = request.getParameter("m_id");
    int g_id = Integer.parseInt(sid);
    String g_ad = request.getParameter("g_ad");
    String g_durum = request.getParameter("g_durum");
    String ssira = request.getParameter("g_sira");
    int g_sira = Integer.parseInt(ssira);
    String bol_ad = request.getParameter("b_ad");
    String sbol_id = request.getParameter("b_id");
    int bol_id = Integer.parseInt(sbol_id);
    //out.println(g_id+g_ad+g_durum+g_sira);
    
   
            int kont =0;
            String sonceki =(String) request.getParameter("onceki");
            if(!ssira.equals(sonceki))
                {
                    kont =1;
                }
            db.gorev_bilgi_guncelleme(g_id, g_durum, g_ad, g_sira,kont);
            ckt=1;    
            //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=prs_grv_gnc&gnd="+sid+"&g_ad="+g_ad+"&g_durum="+g_durum+"&g_sira="+ssira+"&b_ad="+bol_ad+"&b_id="+sbol_id+"&knt=dolu");
    }
    
    } 
    
 
if( request.getParameter("m_id") != null && request.getParameter("m_id") != "" )
        {
        ArrayList<per_gorevler> duyurular = db.personel_grv();
        String sm_id = request.getParameter("m_id");
        int m_id = Integer.parseInt(sm_id);
        for(int i=0;i<duyurular.size();i++)
    {
        if(m_id == duyurular.get(i).getGorev_id())
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
									<strong>Birim Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=prs_grv_gnc&islem=bsr" method="post">
	                    	<div class="form-body">
	                    		
			                    

					<h4 class="form-section"><i class="ft-clipboard"></i> Birim Güncelle</h4>

		                        <div class="form-group row">
						<label class="col-md-3 label-control" for="projectinput5">Baslık</label>
						<div class="col-md-9">
                                                    <input type="text" id="projectinput5" class="form-control " value="<%=duyurular.get(i).getIsmi()%>" name="g_ad">
		                            </div>
		                        </div>

		                        <div class="form-group row">
		                        	<label class="col-md-3 label-control" for="projectinput6">Durum</label>
		                        	<div class="col-md-9">
			                            <select id="projectinput6" name="g_durum" class="form-control ">
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
									<label class="col-md-3 label-control" for="projectinput5">Sıra Numarası</label>
									<div class="col-md-9">
		                            	<input type="number" id="projectinput5" class="form-control" required="" value="<%= duyurular.get(i).getRutbe_no()%>" name="g_sira">
		                            </div>
		                        </div> 
                                                                        
                                        
                            <input type="hidden"   name="m_id" value="<%= duyurular.get(i).getGorev_id()%>" required>
                            <input type="hidden"   name="b_ad" value="<%= request.getParameter("b_ad") %>" required>
                            <input type="hidden"   name="b_id" value="<%= request.getParameter("b_id") %>" required>
                                <input type="hidden"   name="onceki" value="<%= duyurular.get(i).getRutbe_no() %>" required>
                            
				</div>
                           
	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=personel_islemler'" class="btn btn-warning btn-lg" style="width: 49%">
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

