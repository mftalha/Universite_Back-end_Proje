<%-- 
    Document   : personel_bolum_sil
    Created on : 22.Eki.2021, 11:19:23
    Author     : casper
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="veri.personel_bolmlr"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%   
      db_katmani db = new db_katmani();
      ArrayList<personel_bolmlr> bölümler = db.personel_blm();
   
      
    if(request.getParameter("kntt") != null && request.getParameter("kntt") != "" && request.getParameter("knt") == null )
    {     
        if(request.getParameter("kntt").equals("bsr"))
        {
            if(request.getParameter("ust_arama") != null && request.getParameter("ust_arama") !="") //tıklanmadığında buna geliyor
            {
                if(!request.getParameter("ust_arama").equals("none"))
                {
                    int id=0;
                    String ad=(String) request.getParameter("ust_arama");
                    for(int i=0;i<bölümler.size();i++)
                    {
                        if(ad.equals(bölümler.get(i).getBolum_ad()))
                        {
                            id= bölümler.get(i).getBolum_id();
                        }
                    }
                    db.bolum_sil(id);
                    response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=prs_blm_sl&isl=bsr");       
                }
                
            }
            else //birseye tıklanmadığında
            {
                response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=prs_blm_sl&isl=ust_bos");
            }
        }
    }
    
    
    
    
    

%>



<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
<section id="basic-form-layouts">
	<div class="row match-height">
		<div class="col-md-6">
                    
                    <!-- basla -->
                    
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
				<div class="card-content collapse show">
					<div class="card-body">
						
						<form class="form" action="modul/personel_bolum_sil.jsp?kntt=bsr" method="post">
							<div class="form-body">
								

								<h4 class="form-section"><i class="la la-paperclip"></i> Personel Bölüm Sil</h4>

								

								<div class="row">
									

									<div class="col-md-12">
										<div class="form-group">
											<label for="projectinput6">Bölüm Adı</label>
											<select id="projectinput6" name="ust_arama" class="form-control">
                                                                                            <option value="none" selected="" disabled="">İşlem Yapmak İstediğiniz Bölüm Adı</option>
                                                                                            <%
                                                                                                for(int i=0;i<bölümler.size();i++)
                                                                                                {
                                                                                            %>
												<option value= "<%= bölümler.get(i).getBolum_ad()%>" > <%= bölümler.get(i).getBolum_ad()%>  </option>
                                                                                                
                                                                                            <%
                                                                                              }
                                                                                              
                                                                                            %>
												
											</select>
										</div>
									</div>
                                                                    
                                                                        
                
								</div>
                                                                
                                            <% 
                                if(request.getParameter("isl") != null)
                                {
                                    String konturol =(String) request.getParameter("isl");
                                    if(konturol.equals("ust_bos"))
                                { %>
                                    <p> <span style="color:red">Bir Seçim Yapınız.</span> </p>
                              <%  }

                                    if(konturol.equals("bsr"))
                                    { %>
                                    <p> <span style="color:green">İsleminiz Basarili.</span> </p>
                              <% 
                                  }
                                }
                            %>              
                
                                    <div class="form-group">
                                        <button type="button" onclick="window.location='http://localhost:8080/Library_project/panel.jsp?modul=personel_gorev'" class="btn btn-warning mr-1">
									<i class="ft-x"></i> Geri
								</button>
					<button type="submit" class="btn btn-primary">
                                        <i class="la la-check-square-o"></i> Sil
                                        </button>
				    </div>
							</div>
							
						</form>
					</div>			
			</div>
                    
                     <!--BİTİS -->
                     
                    
                       
                  
                    
				
                                                        <!-- buraya gelecek -->
			</div>
		</div>
            
        <!--  form bitis  -->    
        
            
        
        <!-- Default borders start-->

	<div class="col-6">
		<div class="card">
			<div class="card-header">
				<h4 class="card-title"> Bölümler </h4>
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
			<div class="card-content">
				
				<div class="table-responsive">
					<table class="table mb-0">
						<thead>
							<tr>
								<th>Bölüm Adı</th>
								<th>Durum</th>
                                                                <th>Sıra No</th>
								
							</tr>
						</thead>
                                                <%
                                                    for(int i=0;i< bölümler.size();i++)
                                                    {
                                                    %>
						<tbody>
							<tr>
                                                            <td><%= bölümler.get(i).getBolum_ad()%></td>
							    <td> <%= bölümler.get(i).getDurum()%>  </td>
                                                            <td> <%= bölümler.get(i).getSira_no()%>  </td>
							</tr>
							
						</tbody>
                                                <%
                                                    }
                                                 %>
                                               
					</table>
				</div>
			</div>
		</div>
	</div>
</div>    
            
    </section>        
            
            
            
        <!-- alt kısım -->    
            </div>
      </div>
    </div>
