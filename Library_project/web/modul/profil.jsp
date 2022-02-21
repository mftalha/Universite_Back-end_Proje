<%-- 
    Document   : profil
    Created on : 11.Eki.2021, 23:01:04
    Author     : casper
--%>

<%@page import="veri.db_katmani"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.kisi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
     ArrayList<kisi> ss = (ArrayList)session.getAttribute("kullanicibilgisi");
     int ckt=0;
     int ckt_2=0;
     int ckt_3=0;
     if(request.getParameter("knt") != null && request.getParameter("knt") != "")
     {
     if(request.getParameter("knt").equals("sifre_degis"))
        {
            if(request.getParameter("eski_sifre") != null && request.getParameter("eski_sifre") != "" &&  request.getParameter("yeni_sifre_1") != null &&  request.getParameter("yeni_sifre_1") != "" && (String)request.getParameter("yeni_sifre_2") != null && (String)request.getParameter("yeni_sifre_2") != "")
            {
                 String esk_sif =(String)request.getParameter("eski_sifre");
                 String yeni_sif_1 =(String)request.getParameter("yeni_sifre_1");
                 String yeni_sif_2 =(String)request.getParameter("yeni_sifre_2");

                 String sifre =(String) ss.get(0).getSifre();

                 String hash_sifre = org.apache.commons.codec.digest.DigestUtils.sha256Hex(esk_sif);

                 if(hash_sifre.equals(sifre)) // girilen sifre ,kayıtlı şifreyle aynıysa
                 {
                     if(yeni_sif_1.equals(yeni_sif_2)) // sifreler aynımı konturolünün doğru olması //2-3
                     {     
                         veri.db_katmani db = new veri.db_katmani();
                         String hash_sifre_2 = org.apache.commons.codec.digest.DigestUtils.sha256Hex(yeni_sif_1);
                         int id = ss.get(0).getId();
                         db.sif_güncelle(hash_sifre_2,id);
                         ss.get(0).setSifre(hash_sifre_2);
                         //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=profil&durum=sif_basarilii");
                         ckt_2=1;                       
                     }
                     else  // sifreler aynımı konturolünün yanlıs olması //2-3
                     {
                         ckt_3 =1;
                         //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=profil&durum=sif_ayni");
                     }
                 }
                 else // girilen sifre ,kayıtlı şifreden farklıysa
                 {
                     ckt_3 =2;
                     //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=profil&durum=sif_farkli");
                 }
            }
        }
 
      if(request.getParameter("knt").equals("guncelle"))
      {
          if(request.getParameter("email") != null && request.getParameter("email") !="" && request.getParameter("durum") != null && request.getParameter("durum") !="" && request.getParameter("ad_soyad") != null && request.getParameter("ad_soyad") !="" && request.getParameter("unirversite") != null && request.getParameter("unirversite") !="" && request.getParameter("unvan") != null && request.getParameter("unvan") !="")
            { 
                 String email =new String(request.getParameter("email").getBytes("ISO-8859-9"), "UTF-8");
                 String durum =(String)request.getParameter("durum");
                 String ad_soyad =new String(request.getParameter("ad_soyad").getBytes("ISO-8859-9"), "UTF-8");
                 String uni =new String(request.getParameter("unirversite").getBytes("ISO-8859-9"), "UTF-8");
                 String unvan =new String(request.getParameter("unvan").getBytes("ISO-8859-9"), "UTF-8");

                 int id =(int) ss.get(0).getId();
                 veri.db_katmani db = new veri.db_katmani();

                 //db.ver_guncelle(email, durum, ad_soyad, uni, unvan, id);
                 db.ver_guncelle(email, durum, ad_soyad, uni, unvan, id);
                 ss.get(0).setMail(email);
                 ss.get(0).setDurum(durum);
                 ss.get(0).setAd_soyad(ad_soyad);
                 ss.get(0).setUniversite(uni);
                 ss.get(0).setUnvan(unvan);
                 ss = (ArrayList)session.getAttribute("kullanicibilgisi");     
                
                 //boostraplar = db.boostraplar();   
                 ckt=1;
                 response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=profil&knt=guncelle&ckt=1");
            }
          else
          {
              response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=profil&knt=guncelle&ckt=0");
          }     
      }
     }
        int id = ss.get(0).getId();
        String mail = ss.get(0).getMail();        
        String durum = ss.get(0).getDurum();
        String ad_soyad = ss.get(0).getAd_soyad();
        String universt = ss.get(0).getUniversite();
        String unvan = ss.get(0).getUnvan();       
%>
    <!-- ////////////////////////////////////////////////////////////////////////////-->

    <div class="app-content content">
      <div class="content-wrapper">
        
            
<%
    if(request.getParameter("knt") != null && request.getParameter("knt") != "")
    {
        if(request.getParameter("knt").equals("guncelle"))
        {
             ckt= Integer.parseInt(request.getParameter("ckt"));
       if(ckt ==1)
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Kullanıcı Bilgi Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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

if(request.getParameter("knt").equals("sifre_degis"))
        {
       if(ckt_2 ==1 )
       {
    
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
                                                                       
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
                                                                        <strong>Şifre Değiştirme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
									
								</div>
<%}else if(ckt_2 ==0 && ckt_3 ==1){ %>
 <div class="alert bg-danger alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Uyarı! </strong> Girilen Yeni Şifreler Birbirinden Farklı.
								</div>                
<%
    }

else if(ckt_2 ==0 && ckt_3 ==2){ %>
 <div class="alert bg-danger alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Uyarı! </strong> Girilen Şifre Yanlış.
								</div>                
<%
    }

else { %>
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
            
                 
        
        <div class="content-body"><!-- Basic form layout section start -->
<section id="horizontal-form-layouts">
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
	                <div class="card-body"> <!--?modul=profil&knt=guncelle -->
						
	                    <form action ="modul/profil.jsp?knt=guncelle&ckt=0" method="post" class="form form-horizontal striped-labels form-bordered">
	                    	<div class="form-body">
	                    		<h4 class="form-section"><i class="ft-user"></i> Kullanıcı Bilgi</h4>
			                    <div class="form-group row">
	                            	<label class="col-md-3 label-control" for="projectinput1">Ad Soyad</label>
		                            <div class="col-md-9">
		                            	<input type="text" id="projectinput1" class="form-control" name="ad_soyad"  value="<%=ad_soyad %>" >
		                            </div>
		                        </div>
		                        <div class="form-group row">
	                            	<label class="col-md-3 label-control" for="projectinput2">Email</label>
									<div class="col-md-9">
	                            		<input type="text" id="projectinput2" class="form-control" name="email"  value="<%=mail %>" >
	                            	</div>
		                        </div>

		                        <div class="form-group row">
		                            <label class="col-md-3 label-control" for="projectinput3">Üniversite</label>
		                            <div class="col-md-9">
		                            	<input type="text" id="projectinput3" class="form-control" name="unirversite"  value="<%=universt %>" >
		                            </div>
		                        </div>

		                        <div class="form-group row">
		                            <label class="col-md-3 label-control" for="projectinput4"> Ünvan </label>
		                            <div class="col-md-9">
		                            	<input type="text" id="projectinput4" class="form-control" name="unvan" value="<%=unvan %>" >
		                            </div>
		                        </div>
                                            
                                        <div class="form-group row">
		                            <label class="col-md-3 label-control" for="projectinput4"> Durum </label>
		                            <div class="col-md-9">
		                            	<input type="text" id="projectinput4" class="form-control" name="durum" value="<%=durum %>" >
		                            </div>
		                        </div>                
                                </div>
                                            
                                    <div class="form-actions">	                           
	                            <button type="submit" class="btn btn-primary btn-lg" style="width: 100%">
	                                <i class="la la-check-square-o"></i> Verileri Güncelle
	                            </button>
	                        </div>
                            </form>
                                                                                                      
                                            
                           <form action ="?modul=profil&knt=sifre_degis" method="post" class="form form-horizontal striped-labels form-bordered">
	                    	<div class="form-body">

								<h4 class="form-section"><i class="ft-clipboard"></i> Şifre Değiştir</h4>

		                        <div class="form-group row">
									<label class="col-md-3 label-control" for="projectinput5">Aktif Şifreniz</label>
									<div class="col-md-9">
		                            	<input type="password" id="projectinput5" class="form-control" placeholder="Aktif Şifreniz" name="eski_sifre">
		                            </div>
		                        </div>
                                        
                                         <div class="form-group row">
									<label class="col-md-3 label-control" for="projectinput5">Yeni Şifre</label>
									<div class="col-md-9">
		                            	<input type="password" id="projectinput5" class="form-control" placeholder="Yeni Şifre" name="yeni_sifre_1" >
		                            </div>
		                        </div>
                                                                
                                         <div class="form-group row">
									<label class="col-md-3 label-control" for="projectinput5">Yeni Şifre Tekrar</label>
									<div class="col-md-9">
		                            	<input type="password" id="projectinput5" class="form-control" placeholder="Yeni Şifre" name="yeni_sifre_2">
		                            </div>
		                        </div>                 	
				</div>

	                        <div class="form-actions">	                            
	                            <button type="submit" class="btn btn-primary btn-lg" style="width: 100%">
	                                <i class="la la-check-square-o"></i> Şifreyi Değiştir
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

