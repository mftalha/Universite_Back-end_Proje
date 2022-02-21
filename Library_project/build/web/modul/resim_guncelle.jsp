<%-- 
    Document   : resim_guncelle
    Created on : 11.Kas.2021, 16:12:11
    Author     : casper
--%>


<%@page import="degiskenler.degiskenler"%>
<%@page import="slider.slider_sql"%>
<%@page import="slider.db_slider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="veri.slider"%>
<%@page import="veri.db_katmani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="slider.slider_sql"%>
<%@page import="slider.db_slider"%>


<!DOCTYPE html>

<%
int aaaa =0;
int r_id =-5;
int ckt =0;
db_slider db = new db_slider();
    
if(request.getParameter("islem")!=null & request.getParameter("islem")!=""){
    degiskenler degisken = new degiskenler();
    String y_sirano ="";
    String ssira_no = "";
    int sira_no=0;
    int rsm_knt =0;
    int knt =0;
    
    String fileName = ""; // ben
    String donus = "";
     db_slider slider_db=new db_slider();
     slider_sql sql_slider=new slider_sql();
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
                                                fileName = fileName.substring(fileName.lastIndexOf("."));

                                                fileName = UUID.randomUUID().toString() + fileName;
                                                
                                               
                                                file = new File(filePath + "/" + fileName);
                                                long sizeInBytes = fi.getSize();
                                             

                                                fi.write(file);
                                                sql_slider.setResim(fileName);
                                                rsm_knt =1;
                                        }
                                        break;
                                       
                                    default:
                                 
                                }

                            } else {

                          
                                switch (fi.getFieldName()) {
                                    
                                    case "sira_no":
                                        ssira_no = (new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        
                                       
                                        break;
                                    case "icerik":
                                        sql_slider.setIcerik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                     
                                        break;
                                        
                                    case "r_id":
                                        r_id = (Integer.parseInt(fi.getString()));
                     
                                        break;
                             
                                     case "y_sirano":
                                        y_sirano =(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                     
                                        break; 
                                        
                                    case "rsm":
                                        
                                        if(rsm_knt == 0)
                                        {
                                            sql_slider.setResim(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        }
                                        
                                        break;                  
                                     
                                    default:
//                                            System.out.println("Başka bir field");
                                    }
                            }
                        }
                        
                        /*
                        String savePath = "C:/Users/casper/Desktop/sil/Library_project/web/resimler/";
                      //C:\Users\casper\Desktop\sil\Library_project\web\resimler

                           if(rsm_knt == 1)
                           {
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
                           }  
                           }   */
                    
                        if(!y_sirano.equals(ssira_no)) 
                        {
                            knt=1;
                        }
                        sira_no = Integer.parseInt(ssira_no);
                        db.resim_guncelle(sql_slider.getIcerik(),r_id,sira_no,knt,sql_slider.getResim());
                        ckt = 1;
                        
                    //sonuc=slider_db.save(sql_slider);
                       //System.out.println("iç="+sql_slider.getIcerik()+"res="+sql_slider.getResim()+"sira_no="+sql_slider.getSira_no());
                       //slider_db.save(sql_slider.getIcerik(),sql_slider.getResim(),sql_slider.getSira_no());
                       //sonuc=true;

                    } catch (Exception ex) {
                        ex.printStackTrace();
                        
                    }
                } else { 

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        }

}
else
{
    r_id = Integer.parseInt(request.getParameter("r_id"));
}
%>

       
<!-- Ben -->

<%
    if(request.getParameter("islem") != null && request.getParameter("islem") != "" )//islem=basarili
    {// basarili
        
        
        if(request.getParameter("islem").equals("basarili"))
        {
%>
<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
            <section id="horizontal-form-layouts">
<%
    aaaa=1;
if(ckt == 1){
   
%>

<div class="alert bg-success alert-dismissible mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<strong>Slider Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
}

   if(r_id != -5 )
   {
     
    ArrayList<slider_sql> resimler = db.sliderlar();
   int id=r_id;
   for(int i=0;i<resimler.size();i++)
   {
       if(resimler.get(i).getId()== id)
       {

    if(aaaa ==0 )
    {
%>
<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
<section id="horizontal-form-layouts">
    
   
    <%
        }
     %>
	<div class="row">
	    <div class="col-md-12">
	        <div class="card">
	            
	            <div class="card-content collpase show">
	                <div class="card-body">
						
                            <form class="form form-horizontal striped-labels form-bordered" action="?modul=resim_guncelleme&islem=basarili" method="post" enctype="multipart/form-data" >
	                    	<div class="form-body">
	                    		
					<h4 class="form-section"><i class="ft-clipboard"></i> İçerik Güncelle</h4>

                                                                <div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput5">Sıra Numarası</label>
									<div class="col-md-10">
                                                                            <input type="number" id="projectinput5" class="form-control"  value="<%= resimler.get(i).getSira_no() %>" name="sira_no">
                                                                        </div>
                                                                </div>
                                        
                                                                <div class="form-group row">
									<label class="col-md-2 label-control">Resim Dosyası</label>  
									<div class="col-md-10">
										<label id="projectinput8" class="file center-block">
											<input type="file" name="file"  id="file" accept=".png, .PNG, .jpg, .JPG, .jpeg, .JPEG">
                                                                                            
											<span class="file-custom"></span>
                                                                                        <b>Yüklü Resmi Göster : <a href="?modul=rsm_gstr&res_ad=<%= resimler.get(i).getResim() %>&r_id=<%= resimler.get(i).getId()%>&nereden=resim_guncelleme">Göster</a></b>
										</label>
									</div>
								</div>        
                                                                     
								<div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput9">İçerik</label>
									<div class="col-md-10">							
                                                                            <textarea id="editor" rows="5" class="form-control" name="icerik" > <%= resimler.get(i).getIcerik() %> </textarea>
									</div>
								</div>
                                                                        
                                          <input type="hidden"   name="r_id" value="<%= id %>" required> 
                                          <input type="hidden"   name="y_sirano" value="<%= resimler.get(i).getSira_no() %>" required>
                                          <input type="hidden"   name="rsm" value="<%= resimler.get(i).getResim()%>" required>
                            
                        </div>
	                        <div class="form-actions">
                                    <button  type="button" onclick="window.location='?modul=slider_islemler'" class="btn btn-warning btn-lg" style="width: 48%">
					<i class="ft-x"></i> Geri
                                    </button>
	                            <button type="submit" class="btn btn-primary btn-lg" style="width: 50%">
	                                <i class="la la-check-square-o"></i> Kaydet
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