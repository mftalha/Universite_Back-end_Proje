<%-- 
    Document   : etkinlik_guncelle
    Created on : 22.Ara.2021, 10:20:52
    Author     : casper
--%>

<%@page import="degiskenler.degiskenler"%>
<%@page import="java.util.ArrayList"%>
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
int r_id =-5;
int ckt =0;
db_katmani db = new db_katmani();
    
if(request.getParameter("islem")!=null & request.getParameter("islem")!=""){
    degiskenler degisken = new degiskenler();
    int rsm_knt =0;
    int knt =0;
    
    String fileName = ""; // ben
    String donus = "";
     db_katmani slider_db=new db_katmani();
     etkinlik sql_slider=new etkinlik();
        boolean resim_geldi=false; 
        boolean sonuc=false;
        boolean fotolar=false;
        String filesnames="";
        String etknlk_bsl_trh="null";
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
                                                fileName = fileName.substring(fileName.lastIndexOf("."));

                                                fileName = UUID.randomUUID().toString() + fileName;
                                                
                                               
                                                file = new File(filePath + "/" + fileName);
                                                long sizeInBytes = fi.getSize();
                                             

                                                fi.write(file);
                                                sql_slider.setEtknlik_foto(fileName);
                                                rsm_knt =1;
                                        }
                                        break;
                                       
                                    default:
                                 
                                }

                            } else {

                          
                                switch (fi.getFieldName()) { //etkinlik_baslik,etkinik_durum,etknlk_bsl_trh,etknlk_bts_trh,icerik
                                    
                                    case "etkinlik_baslik":
                                        sql_slider.setEtknlik_baslik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                         break;
                                    case "etkinik_durum":
                                        sql_slider.setEtknlik_durum(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                         break;
                                    case "etknlk_bsl_trh": 
                                        etknlk_bsl_trh= (new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        etknlk_bsl_trh = etknlk_bsl_trh.replace("T", " ");
                                        etknlk_bsl_trh+=":00";
                                        //System.out.println("vt_acls_trh="+vt_acls_trh);
                                         break;
                                         
                                    case "etknlk_bts_trh": 
                                        etknlk_bts_trh= (new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        etknlk_bts_trh = etknlk_bts_trh.replace("T", " ");
                                        etknlk_bts_trh+=":00";
                                        //System.out.println("vt_kpns_trh="+etknlk_bts_trh);
                                         break;     
                                    
                                    case "icerik":
                                        sql_slider.setEtknlik_icerik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                         break;
                                        
                                    case "r_id":
                                        r_id = (Integer.parseInt(fi.getString()));
                     
                                        break;
                             
                                    case "rsm":
                                        
                                        if(rsm_knt == 0)
                                        {
                                            sql_slider.setEtknlik_foto(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
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
                           } */

                        //db.resim_guncelle(sql_slider.getIcerik(),r_id,sira_no,knt,sql_slider.getResim());
                        ckt = 1;
                        
                    //sonuc=slider_db.save(sql_slider);
                       //public void etkinlik_guncelle(String baslik ,String durum ,String foto ,String etk_bsl_trh ,String etk_bts_trh,String icerik,int etk_id)
                       slider_db.etkinlik_guncelle(sql_slider.getEtknlik_baslik(),sql_slider.getEtknlik_durum(),sql_slider.getEtknlik_foto(),etknlk_bsl_trh,etknlk_bts_trh,sql_slider.getEtknlik_icerik(),r_id);
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
									<strong>Etkinlik Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
     
    ArrayList<etkinlik> resimler = db.etkinlikler();
   int id=r_id;
   for(int i=0;i<resimler.size();i++)
   {
       if(resimler.get(i).getEtknlik_id()== id)
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
						
                            <form class="form form-horizontal striped-rows form-bordered" action="?modul=etkinlik_guncelle&islem=basarili" method="post" enctype="multipart/form-data" >
	                    	<div class="form-body">
	                    		
					<h4 class="form-section"><i class="ft-clipboard"></i> İçerik Güncelle</h4>
                                                            <input type="hidden" name="duzen">
                                                                <div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput5">Başlık</label>
									<div class="col-md-10">
                                                                            <input type="text" id="projectinput5" class="form-control"  value="<%= resimler.get(i).getEtknlik_baslik()%>" name="etkinlik_baslik">
                                                                        </div>
                                                                </div>
                                                                        
                                                                <div class="form-group row">
                                                                <label class="col-md-2 label-control" for="projectinput6">Durum</label>
                                                                <div class="col-md-10">
                                                                <select id="projectinput6" name="etkinik_durum" class="form-control">
                                                                    <%if(resimler.get(i).getEtknlik_durum().equals("Aktif"))
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
									<label class="col-md-2 label-control">Resim Dosyası</label>  
									<div class="col-md-10">
										<label id="projectinput8" class="file center-block">
											<input type="file" name="file"  id="file" accept=".png, .PNG, .jpg, .JPG, .jpeg, .JPEG">
                                                                                            
											<span class="file-custom"></span>
                                                                                        <b>Yüklü Resmi Göster : <a href="?modul=rsm_gstr&res_ad=<%= resimler.get(i).getEtknlik_foto()%>&r_id=<%= resimler.get(i).getEtknlik_id()%>&nereden=etkinlik_guncelle">Göster</a></b>
										</label>
									</div>
								</div> 
                                                                                
                                                                  <%
                                                                    String vt_aclis_trh =  (resimler.get(i).getEtknlik_baslangic_tarihi()).toString(); 
                                                                    vt_aclis_trh = vt_aclis_trh.replace(" ", "T");
                                                                    vt_aclis_trh=vt_aclis_trh.substring(0, 16);
                                                                    System.out.println("vt_aclis_trh:"+vt_aclis_trh);

                                                                    String vt_kapanis_trh =  (resimler.get(i).getEtknlik_bitis_tarihi()).toString(); 
                                                                    vt_kapanis_trh = vt_kapanis_trh.replace(" ", "T");
                                                                    vt_kapanis_trh=vt_kapanis_trh.substring(0, 16);
                                                                    System.out.println("vt_aclis_trh:"+vt_kapanis_trh);

                                                                  %>        
                                                                  <div class="form-group row">
                                                                        <label class="col-md-2 label-control">Tarih</label>
                                                                        
									<div class="form-group col-md-5 mb-2">
                                                                            
                                                                            <label for="issueinput3">Etkinlik Başlama Tarihi:</label>
                                                                            <input type="datetime-local" value="<%=vt_aclis_trh%>" id="timesheetinput3" class="form-control" name="etknlk_bsl_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Opened" data-original-title="" title="">
                                                                                
                                                                        </div>
                                                                        <div class="form-group col-md-5 mb-2">
                                                                            <label for="issueinput4">Etkinlik Bitiş Tarihi:</label>
                                                                            <input type="datetime-local" value="<%=vt_kapanis_trh%>" id="issueinput4" class="form-control" name="etknlk_bts_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Fixed" data-original-title="" title="">
                                                                        </div>
                                                                     </div>                             
                                                                                
                                                                     
								<div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput9">İçerik</label>
									<div class="col-md-10">							
                                                                            <textarea id="editor" rows="5" class="form-control" name="icerik" > <%= resimler.get(i).getEtknlik_icerik()%> </textarea>
									</div>
								</div>
                                                                        
                                          <input type="hidden"   name="r_id" value="<%= id %>" required> 
                                          <input type="hidden"   name="rsm" value="<%= resimler.get(i).getEtknlik_foto()%>" required>
                            
                        </div>
	                        <div class="form-actions">
                                    <button  type="button" onclick="window.location='?modul=etkinlik_islmlr'" class="btn btn-warning btn-lg" style="width: 48%">
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
