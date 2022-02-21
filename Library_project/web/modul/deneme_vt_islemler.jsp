<%-- 
    Document   : deneme_vt_islemler
    Created on : 20.Ara.2021, 10:39:05
    Author     : casper
--%>

<%@page import="veri.boostrap"%>
<%@page import="veri.veritabanlari"%>
<%@page import="degiskenler.degiskenler"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    db_katmani db = new db_katmani();
    int ckt=0;
    
    //modal islemleri
    boolean bst_vrm=false;
    String bst_baslik="";
    String bst_icerik="";
    ArrayList<boostrap> bstrp = db.boostraplar();
    for(int i=0;i<bstrp.size();i++)
    {
        if(bstrp.get(i).getSayfa().equals("deneme_veritabani") && bstrp.get(i).getDurum().equals("Aktif"))
        {
            bst_vrm=true;
            bst_baslik=bstrp.get(i).getBaslik();
            bst_icerik=bstrp.get(i).getIcerik();
        }
    }
    // modal islemleri end
          
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )
    {
       
        if(request.getParameter("islem").equals("veritbanı_sil"))
        {
            if(request.getParameter("m_id") != null && request.getParameter("m_id") != "" ) 
            {
                String sm_id = (String) request.getParameter("m_id");
                int m_id = Integer.parseInt(sm_id);
                db.vt_sil(m_id);
                ckt=1;
                //response.sendRedirect("../panel.jsp?modul=slider_islemler");              
            }
        }
        
    }
%>
<!-- // Basic form layout section end -->
      
    <!-- ////////////////////////////////////////////////////////////////////////////-->
  
<!-- Select start -->
<!-- Tooltip Triggers start -->

<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
            
             <!-- Modal - Bootstrap start-->
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="modal fade" tabindex="-1" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title"><%= bst_baslik %></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>                                      
                                    </div>
                                    <div class="modal-body">
                                        <p><%= bst_icerik %></p> 
                                    </div>
                                    <div class="modal-footer">
                                        <!-- buraya foother eklenebilir -->
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>                          
                                </div>                              
                            </div>                            
                        </div>
                       <!-- <a href="#" data-toggle="modal" data-target="#myModal">Open Modal</a>   = sayfada tıklanma butonu-->
                    </div>
                </div>
            </div>
            
<!-- Modal - Bootstrap end-->

<%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "")
    {
        if(request.getParameter("islem").equals("veritbanı_sil"))
        {
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Veritabanı Silme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
<div class="row" id="alerts">
    <div class="col-12">
        <div class="card">
            
            <div  class="card-header" style="position: relative;" >
                 
                <h4 class="card-title" style=" font-size: 130%;"> Deneme Veritabanı Kontrol Tablosu </h4>
                
                <button type="button" onclick="window.location='?modul=deneme_vt_ekle'" class="btn btn-outline-primary  btn-min-width mr-1 mb-1" style=" margin: auto; position: absolute; right:  0.2%; top: 14%; font-size: 110%" ><i class="la la-check"></i> Veritabanı Ekle</button>                                                 
                                                    
            </div>
           
            <div class="card-content collapse show">
                <div class="table-responsive">
                    <table class="table table-bordered mb-0" >
                        <thead>
				<tr>
                                                        <th>Vt Logo</th>
                                                        <th>Vt İsmi</th>
                                                        <th>Vt Durum</th>	
                                                        <th>İşlemler</th>	
				</tr>
			</thead>                     
                        <%                          
                                            int m_id = 0;
                                             ArrayList<veritabanlari> ab_vt = db.vt_lari();
                                            for(int i=0;i< ab_vt.size();i++)
                                            {
                                                if(!ab_vt.get(i).getVt_durum().equals("Sil") && ab_vt.get(i).getVt_tur().equals("deneme_vt"))
                                                {
                                                    m_id = ab_vt.get(i).getVt_id(); //ab_vt.get(i).getVt_logo()
                                                    degiskenler degisken = new degiskenler();
                        %>
						<tbody> <!--C:\Users\casper\Desktop\sil\Library_project\web\resimler -->
							<tr > <!-- String savePath = "C:/Users/casper/Desktop/sil/Library_project/web/resimler/"; -->
                                                            <td> <img src="<%=degisken.tablo_resim_goster_yol+ab_vt.get(i).getVt_logo()%>" width="80" height="80"/> </td>
                        
                                                            <td style="padding-top: 4%; padding-bottom: 3%; text-align: center; font-size: 118%;"><%= ab_vt.get(i).getVt_isim()%></td>
                                                
                                                            <td style="padding-top: 4%; padding-bottom: 3%; text-align: center; font-size: 115%;"><%= ab_vt.get(i).getVt_durum()%></td>
                                                            
                                                            <td>
                                                                <div class="text-center" style="padding-top: 5%;  text-align: center; ">  

                                                                    <button type="button" onclick="window.location='?modul=deneme_vt_guncelle&r_id=<%= m_id%>'" class="btn btn-outline-info round btn-min-width mr-1 mb-1">Düzenle</button>
                                                                    <button type="button" onclick="window.location='?modul=deneme_vt_islmlr&m_id=<%=m_id%>&islem=veritbanı_sil'"  class="btn btn-outline-danger round btn-min-width mr-1 mb-1">Kaldır</button>                                                                                                                
                                                                </div>
                                                            </td>      
							</tr>
						</tbody>
                                                <% 
                                                    }
                                                    }
                                                 %>    
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Tooltip Triggers end -->
<!-- Select end -->

  </div>
      </div>
    </div>

                    
<%
    //modal islemleri_start
    if(bst_vrm == true)
    {
%>                                      
<!-- Boolstrep modal -->  
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#myModal").modal('show');
        
    });
</script>
<%
    }
        //modal islemleri_end
%>