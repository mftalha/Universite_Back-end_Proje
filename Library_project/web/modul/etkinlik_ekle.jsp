<%-- 
    Document   : etkinlik_ekle
    Created on : 21.Ara.2021, 17:14:57
    Author     : casper
--%>
<%@page import="degiskenler.degiskenler"%>
<%@page import="veri.etkinlik"%>
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
     etkinlik sql_slider=new etkinlik();
        boolean resim_geldi=false; 
        boolean sonuc=false;
        boolean fotolar=false;
        String filesnames="";
        String etknlk_bslngc_trh="null";
        String etknlk_bts_trh="null";
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
                                                sql_slider.setEtknlik_foto(fileName);
                                        }
                                        break;
                                       
                                    default:
                                 
                                }

                            } else {//etknlk_durum,etknlik_bslm_trh,etknlik_bts_trh,icerik

                          
                                switch (fi.getFieldName()) { 
                                    
                                    case "baslik":
                                        sql_slider.setEtknlik_baslik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));   
                                        break;
                                    
                                    case "etknlk_durum": 
                                        sql_slider.setEtknlik_durum(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));   
                                        break;
                                    
                                    case "etknlik_bslm_trh": 
                                        etknlk_bslngc_trh =(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));   
                                        etknlk_bslngc_trh = etknlk_bslngc_trh.replace("T", " ");
                                        etknlk_bslngc_trh+=":00";
                                        break;    
                                    
                                    case "etknlik_bts_trh": 
                                        etknlk_bts_trh =(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));   
                                        etknlk_bts_trh = etknlk_bts_trh.replace("T", " ");
                                        etknlk_bts_trh+=":00";
                                        break;    
                                    
                                    case "icerik":
                                        sql_slider.setEtknlik_icerik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                     
                                        break;
                             
                                       
                                    default:
//                                            System.out.println("Başka bir field");
                                    }

                            }

                        }
                       
                        /*
                        String savePath = "C:/Users/casper/Desktop/sil/Library_project/web/resimler/";
                      //C:\Users\casper\Desktop\sil\Library_project\web\resimler

                           Iterator y = fileItems.iterator();

                           while ( y.hasNext () ) 
                           {
                              FileItem yi = (FileItem)y.next();
                              if ( !yi.isFormField () )  {
                                  String fieldName = yi.getFieldName();
                                  //String fileNamee = yi.getName();                    
                                  boolean isInMemory = yi.isInMemory();
                                  long sizeInBytes = yi.getSize();
                                  file_ = new File( savePath + fileName) ;
                                  yi.write( file_ ) ;  
                                  //sonuc = true;
                              }
                           }     */
                        
                       slider_db.Etkinlik_ekle(sql_slider.getEtknlik_baslik(),sql_slider.getEtknlik_durum(),etknlk_bslngc_trh,etknlk_bts_trh,sql_slider.getEtknlik_icerik(),sql_slider.getEtknlik_foto());
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
									<strong>Etkinlik Ekleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
	                <h4 class="card-title" id="striped-row-layout-basic">Etkinlik İşlemleri & Etkinlik Ekle</h4>
	                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
        			<div class="heading-elements">
	                   
	                </div>
	            </div>
	            <div class="card-content collpase show">
	                <div class="card-body">

	                	<div class="card-text">
							<p><code>Etkinlik İşlemleri & Etkinlik Ekle:</code> Eklemiş Olduğunuz Etkinlik, Etkinlik İşlemleri Sayfasında Eklenme Tarihine Göre Tabloda Gösterilir.</p>
						</div>

                            <form  action="?modul=etkinlik_ekle&islem=ekle" enctype="multipart/form-data" method="POST" class="form form-horizontal striped-rows form-bordered">
	                    	<div class="form-body">
	                    		       
							<h4 class="form-section"><i class="la la-ioxhost"></i>Etkinlik İşlemleri & Etkinlik Ekle</h4>
                                                       <input type="hidden"   name="sayfa_duzeni"  required>
                                                     <div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput5">Başlık</label>
									<div class="col-md-10">
                                                                <input type="text" id="projectinput5" class="form-control" required="" placeholder="Etkinlik Başlık" name="baslik">
                                                            </div>
                                                        </div>
   
                                                                <div class="form-group row"> 
                                                                    <label class="col-md-2 label-control" for="projectinput6">Durum</label>
                                                                    <div class="col-md-10">
                                                                        <select id="projectinput6" name="etknlk_durum" class="form-control ">
                                                                            <option value="Aktif" >Aktif</option>
                                                                            <option value="Beklemede">Beklemede</option>		                                
                                                                        </select>
                                                                   </div>
                                                                </div>	
                                                                
                                                                <div class="form-group row"> 
									<label class="col-md-2 label-control">Resim Dosyası</label>
									<div class="col-md-10">
										<label id="projectinput8" class="file center-block">
											<input type="file" name="file"  id="file" accept=".png, .PNG, .jpg, .JPG, .jpeg, .JPEG">
											<span class="file-custom"></span>
										</label>
									</div>
								</div>
                                                                
                                                                <div class="form-group row">
                                                                        <label class="col-md-2 label-control">Tarih</label>
                                                                        
									<div class="form-group col-md-5 mb-2">
                                                                            
                                                                            <label for="issueinput3">Etkinlik Başlama Tarihi:</label>
                                                                            <input type="datetime-local" id="startDate" class="form-control" name="etknlik_bslm_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Opened" data-original-title="" title="" required="">
                                                                                
                                                                        </div>
                                                                        <div class="form-group col-md-5 mb-2">
                                                                            <label for="issueinput4">Etkinlik Bitiş Tarihi:</label>
                                                                            <input type="datetime-local" id="finishDate" class="form-control" name="etknlik_bts_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Fixed" data-original-title="" title="" required="">
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
                                      <button type="button" onclick="window.location='?modul=etkinlik_islmlr'" class="btn btn-warning btn-lg" style="width: 49%">
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
    $("#startDate").val(today);//finishDate
   });
</script>