<%-- 
    Document   : haber_ekle
    Created on : 23.Ara.2021, 15:32:26
    Author     : casper
--%>

<%@page import="veri.haber"%>
<%@page import="degiskenler.degiskenler"%>
<%@page import="veri.db_katmani"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
int aaaa =0;

if(request.getParameter("islem")!=null & request.getParameter("islem")!=""){
    degiskenler degisken = new degiskenler();
    String fileName = ""; // ben
    String donus = "";
     db_katmani slider_db=new db_katmani();
     haber sql_slider=new haber();
        boolean resim_geldi=false; 
        boolean sonuc=false;
        boolean fotolar=false;
        String filesnames="";
        String haber_tarihi="null";
        
         try {
    
            File file;
            File file_;
            int maxFileSize = 5000000 * 1024;
            int maxMemSize = 5000000 * 1024;
            String filePath = "";
            if (!System.getProperty("os.name").contains("Windows")) {

                filePath = degisken.dosya_digerleri_yol;

            } else {
                filePath = degisken.dosya_windows_yol;
            }
             
            String contentType = request.getContentType();
System.out.println(contentType);
            if (contentType != null) {
                if ((contentType.indexOf("multipart/form-data") >= 0)) {

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setSizeThreshold(maxMemSize);
                    if (!System.getProperty("os.name").contains("Windows")) {

                        factory.setRepository(new File(degisken.dosya_digerleri_yol));

                    } else {
                        factory.setRepository(new File(degisken.dosya_windows_yol));
                    }
                    ServletFileUpload upload = new ServletFileUpload(factory)
;

                    upload.setSizeMax(maxFileSize);
                    try {
                        List fileItems = upload.parseRequest(request);
                        Iterator i = fileItems.iterator();
                        System.out.println("whilebası");
                        while (i.hasNext()) {
                          
                            FileItem fi = (FileItem) i.next();
                            if (!fi.isFormField()) {
                                String fieldName = fi.getFieldName();
                                fileName = fi.getName(); // burda
                                boolean isInMemory = fi.isInMemory();
                                switch (fieldName) {
                                     case "file":
                                        if (fileName != "" & fileName != null) {
                                           resim_geldi=true; 
                                                fileName = fileName.substring(fileName.lastIndexOf("."));//uzantı

                                                fileName = UUID.randomUUID().toString() + fileName;//dosya link ismi
                                                
                                               
                                                file = new File(filePath + "/" + fileName);
                                                long sizeInBytes = fi.getSize();
                                             

                                                fi.write(file);
                                                sql_slider.setHbr_foto(fileName);
                                        }
                                        break;
                                       
                                    default:
                                 
                                }

                            } else {//etknlk_durum,etknlik_bslm_trh,etknlik_bts_trh,icerik

                          
                                switch (fi.getFieldName()) { 
                                    
                                    case "baslik"://baslik,hbr_durum,hbr_trh,icerik
                                        sql_slider.setHbr_baslik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));   
                                        break;
                                    
                                    case "hbr_durum": 
                                        sql_slider.setHbr_durum(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));   
                                        break;
                                    
                                    case "hbr_trh": 
                                        haber_tarihi =(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));   
                                        haber_tarihi = haber_tarihi.replace("T", " ");
                                        haber_tarihi+=":00";
                                        break;    
                                    
                                    case "icerik":
                                        sql_slider.setHbr_icerik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                     
                                        break;
                             
                                       
                                    default:
//                                            System.out.println("Başka bir field");
                                    }

                            }

                        }
                       
                        
                        
                       slider_db.haber_ekle(sql_slider.getHbr_baslik(),sql_slider.getHbr_foto(),sql_slider.getHbr_durum(),sql_slider.getHbr_icerik(),haber_tarihi);
                       sonuc=true;

                    } catch (Exception ex) {
                        ex.printStackTrace();
                       sonuc=false; 
                    }
                } else { 
                    sonuc=false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            sonuc=false; 
        }

%>

<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
            <section id="horizontal-form-layouts">
<!-- Ben -->

<%
    aaaa=1;
if(sonuc==true){
   
%>
<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Heber Ekleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
								</div>
<%}else{ %>
 <div class="alert bg-danger alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Uyarı! </strong> İşleminiz Gerçekleştirilirken Bir Hata Oluştu.
								</div>
<%}
}

if(aaaa==0)
{
%>

<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
<section id="horizontal-form-layouts">
<!-- Ben -->
<%
 }
%>

<div class="row">
	    <div class="col-md-12">
	        <div class="card">
	            <div class="card-header">
	                <h4 class="card-title" id="striped-row-layout-basic">Haber İşlemleri & Haber Ekle</h4>
	                <a class="heading-elements-toggle"><i class="la la-newspaper-o font-medium-3"></i></a>
        			<div class="heading-elements">
	                   
	                </div>
	            </div>
	            <div class="card-content collpase show">
	                <div class="card-body">

	                	<div class="card-text">
							<p><code>Haber İşlemleri & Haber Ekle:</code> Eklemiş Olduğunuz Haber, Haber İşlemleri Sayfasında Eklenme Tarihine Göre Tabloda Gösterilir.</p>
						</div>

                            <form  action="?modul=hbr_ekle&islem=ekle" enctype="multipart/form-data" method="POST" class="form form-horizontal striped-rows form-bordered">
	                    	<div class="form-body">
	                    		       
							<h4 class="form-section"><i class="la la-newspaper-o"></i>Haber İşlemleri & Haber Ekle</h4>
                                                       <input type="hidden"   name="sayfa_duzeni"  required>
                                                     <div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput5">Başlık</label>
									<div class="col-md-10">
                                                                <input type="text" id="projectinput5" class="form-control" required="" placeholder="Haber Başlık" name="baslik">
                                                            </div>
                                                        </div>
   
                                                                <div class="form-group row"> 
                                                                    <label class="col-md-2 label-control" for="projectinput6">Durum</label>
                                                                    <div class="col-md-10">
                                                                        <select id="projectinput6" name="hbr_durum" class="form-control ">
                                                                            <option value="Aktif" >Aktif</option>
                                                                            <option value="Beklemede">Beklemede</option>		                                
                                                                        </select>
                                                                   </div>
                                                                </div>	
                                                                
                                                                <div class="form-group row"> 
									<label class="col-md-2 label-control">Resim Dosyası</label>
									<div class="col-md-10">
										<label id="projectinput8" class="file center-block">
											<input type="file" name="file" required="" id="file" accept=".png, .PNG, .jpg, .JPG, .jpeg, .JPEG">
											<span class="file-custom"></span>
										</label>
									</div>
								</div>
                                                                
                                                                <div class="form-group row">
                                                                        <label class="col-md-2 label-control">Tarih</label>
                                                                        
									<div class="form-group col-md-10 mb-2">
                                                                            
                                                                            
                                                                            <input type="datetime-local" id="startDate" class="form-control" name="hbr_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Opened" data-original-title="" title="" required="">
                                                                                
                                                                        </div>
                                                                        
                                                                </div>
                                                             

								<div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput9">İçerik</label>
									<div class="col-md-10">							
                                                                            <textarea id="editor" rows="10" class="form-control" name="icerik" > </textarea>
									</div>
								</div>
							</div>

	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=haber_islm'" class="btn btn-warning btn-lg" style="width: 49%">
					<i class="ft-x" ></i> Geri <!-- class="ft-x" -->
                                      </button>
	                              <button type="submit" class="btn btn-primary btn-lg" style="width: 50%">
	                                <i class="la la-check-square-o"></i> Ekle
	                            </button>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

<!-- Ben -->
</section>
            </div>
      </div>
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
   $(function(){ 
    //$("#startDate").val(new Date().toJSON().slice(0, 19));
    var today = new Date();
    today.setHours( today.getHours()+(3));
    today = today.toJSON().slice(0, 19);
    today = today.substring(0,16);
    //alert(today);
    $("#startDate").val(today);
   });
</script>
    
    