<%-- 
    Document   : dosya_link_ulstur
    Created on : 26.Kas.2021, 11:35:44
    Author     : casper
--%>
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
String fileName = "";// ben
if(request.getParameter("islem")!=null & request.getParameter("islem")!=""){
    degiskenler degisken = new degiskenler();
    String donus = "";
     db_katmani slider_db=new db_katmani();
     
        boolean resim_geldi=false; 
        boolean sonuc=false;
        boolean fotolar=false;
        String filesnames="";
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
                                                //sql_slider.setResim(fileName);
                                        
                                        }
                                        break;
                                       
                                    default:
                                 
                                }

                            } 

                        }
                        
                        /*
                        String savePath = "C:/Users/casper/Desktop/sil/Library_project/web/dosyalar/";
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
                           }  */
                    
                        
                    //sonuc=slider_db.save(sql_slider);
                      // System.out.println("iç="+sql_slider.getIcerik()+"res="+sql_slider.getResim()+"sira_no="+sql_slider.getSira_no());
                       
                       slider_db.link_ekle(fileName);
                       sonuc=true;

                    } catch (Exception ex) {
                        ex.printStackTrace();
                       sonuc=false; 
                    }
                } else { 

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
									<strong><%= degisken.tablo_resim_goster_yol+fileName %><br> </strong> 
                                                                       
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
	                <h4 class="card-title" id="striped-row-layout-basic">Dosya Link Oluştur</h4>
	                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
        			<div class="heading-elements">
	                   
	                </div>
	            </div>
	            <div class="card-content collpase show">
	                <div class="card-body">

	                	<div class="card-text">
							<p><code>Dosya Link Oluştur:</code> Dosyanızı yükleyip gönderdikten sonra sistem tarafından size bir link veilecektir.
                                                            Bu linki kullanarak sayfalarınıza resim veya dosyalar ekliyebilirsiniz.</p>
						</div>

                            <form  action="?modul=link_olstr&islem=ekle" enctype="multipart/form-data" method="POST" class="form form-horizontal striped-rows form-bordered">
	                    	<div class="form-body">
	                    		
                                    <h4 class="form-section"><i class="la la-link"></i> Dosya Link Oluştur</h4>


                                    <div class="form-group row">
                                            <label class="col-md-2 label-control">Link Oluştur</label>
                                            <div class="col-md-10">
                                                    <label id="projectinput8" class="file center-block">
                                                            <input type="file" name="file" required="" id="file" ><!--accept=".png, .PNG, .jpg, .JPG, .jpeg, .JPEG" -->
                                                            <span class="file-custom"></span>
                                                    </label>
                                            </div>
                                    </div>


                                </div>

	                        <div class="form-actions">
                                      
	                              <button type="submit" class="btn btn-primary btn-lg" style="width: 100%">
	                                <i class="la la-check-square-o"></i> Gönder
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