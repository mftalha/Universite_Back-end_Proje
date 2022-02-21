<%-- 
    Document   : abone_vt_ekle
    Created on : 07.Ara.2021, 10:56:38
    Author     : casper
--%>

<%@page import="veri.veritabanlari"%>
<%@page import="degiskenler.degiskenler"%>
<%@page import="java.sql.Timestamp"%>
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
int d_syc = 0; // json dizisine attığım elemanların sırası için
if(request.getParameter("islem")!=null & request.getParameter("islem")!=""){

    degiskenler degisken = new degiskenler();
    //String birlestir = "{'linkler':[ "; // abone veritabanı dokumanı bilestirdigim string // ]} , {"ss":[
    String birlestir = "{\"linkler\":[ ";
    String donus = "";
    boolean dolumu = false; // abone veritabanına ilk documanın gelmesi durumunda true olacak else ye girecek sonrasında
     db_katmani slider_db = new db_katmani();
     veritabanlari sql_slider=new veritabanlari();
        boolean resim_geldi=false; 
        boolean sonuc=false;
        boolean fotolar=false;
        String filesnames="";
        String vt_acls_trh="null";
        String vt_kpns_trh="null";
         try {
    
            File file;
            File file_;
            int maxFileSize = 5000000 * 1024;
            int maxMemSize = 5000000 * 1024;
            String filePath = "";
            if (!System.getProperty("os.name").contains("Windows")) {

                filePath = degisken.dosya_digerleri_yol;

            } else {
                //filePath = "C:/Program Files/Apache Software Foundation/Tomcat 9.0_Tomcat_9/webapps/data";
                filePath = degisken.dosya_windows_yol;
            }
             
            String contentType = request.getContentType();
System.out.println(contentType);
            if (contentType != null) {
                System.out.println("1");
                if ((contentType.indexOf("multipart/form-data") >= 0)) {
                    System.out.println("2");
                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setSizeThreshold(maxMemSize);
                    if (!System.getProperty("os.name").contains("Windows")) {

                        factory.setRepository(new File(degisken.dosya_digerleri_yol));

                    } else {
                        //factory.setRepository(new File("C:/Program Files/Apache Software Foundation/Tomcat 9.0_Tomcat_9/webapps/data"));
                        factory.setRepository(new File(degisken.dosya_windows_yol));
                    }
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(maxFileSize);
                    try {
                        List fileItems = upload.parseRequest(request);
                        Iterator i = fileItems.iterator();
                        System.out.println("whilebası");
                        while (i.hasNext()) {
                          
                            FileItem fi = (FileItem) i.next();
                            if (!fi.isFormField()) {
                                System.out.println("3");
                                String fieldName = fi.getFieldName();
                                String fileName = fi.getName(); // burda
                                
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
                                                sql_slider.setVt_logo(fileName);
                                        }
                                        break;
                                       
                                        case "file_multi": 
                                        if ( fileName!= "" & fileName != null) {
                                           resim_geldi=true; 
                                                fileName = fileName.substring(fileName.lastIndexOf("."));//uzantı

                                                fileName = UUID.randomUUID().toString() + fileName;//dosya link ismi         
                                               
                                                file = new File(filePath + "/" + fileName);
                                                long sizeInBytes = fi.getSize();
                                                
                                                fi.write(file);
                                                if(dolumu == false) //birlestir bossa
                                                {
                                                    //birlestir=fileName;
                                                    //birlestir+="{'id':"+d_syc+",'link':'"+fileName+"'}";
                                                    birlestir+="{\"id\":"+d_syc+",\"link\":\""+fileName+"\"}";
                                                    dolumu = true;
                                                }
                                                else
                                                {
                                                    //birlestir+=";;;"+fileName;
                                                    //birlestir+=",{'id':"+d_syc+",'link':'"+fileName+"'}";
                                                    birlestir+=",{\"id\":"+d_syc+",\"link\":\""+fileName+"\"}";
                                                }
                                                d_syc+=1;
                                                //sql_slider.setVt_dokuman(birlestir);
                                        }
                                        break; 
                                    default:
                                }

                            } else {

                                System.out.println("4");
                                switch (fi.getFieldName()) {
                                    
                                    case "vt_isim": 
                                        sql_slider.setVt_isim(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        break;
                                        
                                    case "vt_katagori": //vt_alan
                                        sql_slider.setVt_katagori(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        break;
                                    
                                    case "vt_aciklama": 
                                        sql_slider.setVt_aciklama(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                     
                                        break;
                                        
                                    case "vt_icerik": 
                                        sql_slider.setVt_icerik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        System.out.println("zzz="+sql_slider.getVt_logo());
                                        break;
                                        
                                    case "vt_durum": //vt_acls_trhvt_kpns_trh
                                        sql_slider.setVt_durum(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                         break;
                                         
                                    case "vt_acls_trh": 
                                        vt_acls_trh= (new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        vt_acls_trh = vt_acls_trh.replace("T", " ");
                                        vt_acls_trh+=":00";
                                         break;
                                         
                                    case "vt_kpns_trh": 
                                        vt_kpns_trh= (new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        vt_kpns_trh = vt_kpns_trh.replace("T", " ");
                                        vt_kpns_trh+=":00";
                                         break;
                                         
                                    default:
//                                            System.out.println("Başka bir field");
                                    }
                            }
                        }
                        if(sql_slider.getVt_logo() == null) 
                        { //eğer logo veya dokuman seçilmediyse bunu yapıyorum yoksa null yapıp veritabanına eklemyor
                            sql_slider.setVt_logo("null");
                        }
                        if(sql_slider.getVt_dokuman()== null)
                        {
                            sql_slider.setVt_dokuman("null");
                        }
                        //String savePath = "C:/Users/casper/Desktop/sil/Library_project/web/resimler/";
                        //String savePath_2 = "C:/Users/casper/Desktop/sil/Library_project/web/dosyalar/";
                      //C:\Users\casper\Desktop\sil\Library_project\web\resimler 
                      
                        birlestir +="]}";  
                        
                    //sonuc=slider_db.save(sql_slider);
                       //System.out.println("iç="+sql_slider.getIcerik()+"res="+sql_slider.getResim()+"sira_no="+sql_slider.getSira_no());
                       slider_db.vt_ekle(sql_slider.getVt_isim(),sql_slider.getVt_logo(),sql_slider.getVt_aciklama(),sql_slider.getVt_icerik(),sql_slider.getVt_durum(),birlestir,vt_acls_trh,vt_kpns_trh,sql_slider.getVt_katagori(),"abone_vt");
                       sonuc=true;
                    } catch (Exception ex) {
                        ex.printStackTrace();
                       sonuc=false; 
                    }
                } else { 
                    
                }
            }
            else
            {
                sonuc=false;
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
									<strong>Abone Veritabanı Ekleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
								</div>
<%}else{ %>
 <div class="alert bg-danger alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Uyarı! </strong> İşleminiz Gerçekleştirilirken Bir Hata Oluştu.
								</div>
<%}
} // islem bitis 

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
	                <h4 class="card-title" id="striped-row-layout-basic">Veritabanı İşlemleri & Abone Veritabanı Ekle</h4>
	                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
        			<div class="heading-elements">
	                   
	                </div>
	            </div>
	            <div class="card-content collpase show">
	                <div class="card-body">

	                	<div class="card-text">
							<p><code>Veritabanı İşlemleri & Abone Veritabanı Ekle:</code> Eklemiş Olduğunuz Veritabanı, Abone Veritabanı İşlemleri Sayfasında Eklenme Tarihine Göre Sıralı Bir Şekilde Tabloda Gösterilir.</p>
						</div>

                            <form  action="?modul=abone_vt_ekle&islem=ekle" enctype="multipart/form-data" method="POST" class="form form-horizontal striped-rows form-bordered">
	                    	<div class="form-body">
	                    		
								<h4 class="form-section"><i class="la la-database"></i>Veritabanı İşlemleri & Abone Veritabanı Ekle </h4>
                                                                <input type="hidden" name="duzen">
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="projectinput5">İsim</label>
                                                                    <div class="col-md-10">
                                                                    <input type="text" id="projectinput5" class="form-control " placeholder="Veritabanı İsim" name="vt_isim" required="">
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="projectinput5">Katagori</label>
                                                                    <div class="col-md-10">
                                                                        <select id="projectinput6" name="vt_katagori" class="form-control ">
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                        </select>
                                                                   </div>
                                                                </div>
                                                                
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="projectinput5">Açıklama</label>
                                                                    <div class="col-md-10">
                                                                    <input type="text" id="projectinput5" class="form-control " placeholder="Veritabanı Açıklama" name="vt_aciklama" >
                                                                    </div>
                                                                </div>

								<div class="form-group row">
									<label class="col-md-2 label-control">Logo</label>
									<div class="col-md-10">
										<label id="projectinput8" class="file center-block"> <!-- required="" -->
											<input type="file" name="file"  id="file" accept=".png, .PNG, .jpg, .JPG, .jpeg, .JPEG" >
											<span class="file-custom"></span>
										</label>
									</div>
								</div>
                                                                
                                                                
                                                         
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="projectinput6">Durum</label>
                                                                    <div class="col-md-10">
                                                                        <select id="projectinput6" name="vt_durum" class="form-control ">
                                                                            <option value="Aktif" >Aktif</option>
                                                                            <option value="Beklemede">Beklemede</option>		                                
                                                                        </select>
                                                                   </div>
                                                                </div>	
                                                                
                                                                <div class="form-group row">
                                                                        <label class="col-md-2 label-control">Tarih</label>
                                                                        
									<div class="form-group col-md-5 mb-2">
                                                                            
                                                                            <label for="issueinput3">Veritabanı Açılış Tarihi:</label>
                                                                            <input type="datetime-local" id="startDate" class="form-control" name="vt_acls_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Opened" data-original-title="" title="" required="">
                                                                                
                                                                        </div>
                                                                        <div class="form-group col-md-5 mb-2">
                                                                            <label for="issueinput4">Veritabanı Kapanış Tarihi:</label>
                                                                            <input type="datetime-local" id="issueinput4" class="form-control" name="vt_kpns_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Fixed" data-original-title="" title="" required="">
                                                                        </div>
                                                                </div>
                                                             
								<div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput9">İçerik</label>
									<div class="col-md-10">							
                                                                            <textarea id="editor" rows="10" class="form-control" name="vt_icerik" > </textarea>
									</div>
								</div>
                                                                
                                                                
                                                                <div class="form-group row">
									<label class="col-md-2 label-control">Döküman</label>
									<div class="col-md-10">
										<label id="projectinput8" class="file center-block">
											<input type="file" name="file_multi" id="file" multiple>
											<span class="file-custom"></span>
										</label>
									</div>
								</div>       
							</div>
                                

	                        <div class="form-actions">
                                      <button type="button" onclick="window.location='?modul=abone_vt_islmlr'" class="btn btn-warning btn-lg" style="width: 49%">
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