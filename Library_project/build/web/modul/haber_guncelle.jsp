<%-- 
    Document   : haber_guncelle
    Created on : 23.Ara.2021, 15:56:03
    Author     : casper
--%>

<%@page import="veri.haber"%>
<%@page import="degiskenler.degiskenler"%>
<%@page import="java.util.ArrayList"%>
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
     haber sql_slider=new haber();
        boolean resim_geldi=false; 
        boolean sonuc=false;
        boolean fotolar=false;
        String filesnames="";
        String hbr_trh="null";
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
                                                sql_slider.setHbr_foto(fileName);
                                                rsm_knt =1;
                                        }
                                        break;
                                       
                                    default:
                                 
                                }

                            } else {

                          
                                switch (fi.getFieldName()) { //etkinlik_baslik,etkinik_durum,etknlk_bsl_trh,etknlk_bts_trh,icerik
                                    
                                    case "hbr_baslik":
                                        sql_slider.setHbr_baslik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                         break;
                                    case "hbr_durum":
                                        sql_slider.setHbr_durum(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                         break;
                                    
                                         
                                    case "hbr_trh": //hbr_baslik,hbr_durum,hbr_trh,icerik
                                        hbr_trh= (new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        hbr_trh = hbr_trh.replace("T", " ");
                                        hbr_trh+=":00";
                                        //System.out.println("vt_kpns_trh="+etknlk_bts_trh);
                                         break;     
                                    
                                    case "icerik":
                                        sql_slider.setHbr_icerik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                         break;
                                        
                                    case "r_id":
                                        r_id = (Integer.parseInt(fi.getString()));
                     
                                        break;
                             
                                    case "rsm":
                                        
                                        if(rsm_knt == 0)
                                        {
                                            sql_slider.setHbr_foto(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        }
                                        
                                        break;                  
                                     
                                    default:
//                                            System.out.println("Başka bir field");
                                    }
                            }
                        }
                        
                        db.haber_guncelle(sql_slider.getHbr_baslik(),sql_slider.getHbr_foto(),sql_slider.getHbr_durum(),sql_slider.getHbr_icerik(),hbr_trh,r_id);
                        ckt = 1;
                        

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
									<strong>Haber Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 
                                                                       
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
     
    ArrayList<haber> resimler = db.haberlerr();
   int id=r_id;
   for(int i=0;i<resimler.size();i++)
   {
       if(resimler.get(i).getHbr_id()== id)
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
						
                            <form class="form form-horizontal striped-rows form-bordered" action="?modul=hbr_guncelle&islem=basarili" method="post" enctype="multipart/form-data" >
	                    	<div class="form-body">
	                    		
					<h4 class="form-section"><i class="ft-clipboard"></i> İçerik Güncelle</h4>
                                                            <input type="hidden" name="duzen">
                                                                <div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput5">Başlık</label>
									<div class="col-md-10">
                                                                            <input type="text" id="projectinput5" class="form-control"  value="<%= resimler.get(i).getHbr_baslik()%>" name="hbr_baslik">
                                                                        </div>
                                                                </div>
                                                                        
                                                                <div class="form-group row">
                                                                <label class="col-md-2 label-control" for="projectinput6">Durum</label>
                                                                <div class="col-md-10">
                                                                <select id="projectinput6" name="hbr_durum" class="form-control">
                                                                    <%if(resimler.get(i).getHbr_durum().equals("Aktif"))
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
											<input type="file" name="file" id="file" accept=".png, .PNG, .jpg, .JPG, .jpeg, .JPEG">
                                                                                            
											<span class="file-custom"></span>
                                                                                        <b>Yüklü Resmi Göster : <a href="?modul=rsm_gstr&res_ad=<%= resimler.get(i).getHbr_foto()%>&r_id=<%= resimler.get(i).getHbr_id()%>&nereden=hbr_guncelle">Göster</a></b>
										</label>
									</div>
								</div> 
                                                                                
                                                                  <%
                                                                    String vt_aclis_trh =  (resimler.get(i).getHbr_trh()).toString(); 
                                                                    vt_aclis_trh = vt_aclis_trh.replace(" ", "T");
                                                                    vt_aclis_trh=vt_aclis_trh.substring(0, 16);
                                                                    System.out.println("vt_aclis_trh:"+vt_aclis_trh);
                                                                  %>        
                                                                  <div class="form-group row">
                                                                        <label class="col-md-2 label-control">Tarih</label>
                                                                        
									<div class="form-group col-md-10 mb-2">
                                                                            
                                                                            <input type="datetime-local" value="<%=vt_aclis_trh%>" id="timesheetinput3" class="form-control" name="hbr_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Opened" data-original-title="" title="">
                                                                                
                                                                        </div>
                                                                        
                                                                     </div>                             
                                                                                
                                                                     
								<div class="form-group row">
									<label class="col-md-2 label-control" for="projectinput9">İçerik</label>
									<div class="col-md-10">							
                                                                            <textarea id="editor" rows="5" class="form-control" name="icerik" > <%= resimler.get(i).getHbr_icerik()%> </textarea>
									</div>
								</div>
                                                                        
                                          <input type="hidden"   name="r_id" value="<%= id %>" required> 
                                          <input type="hidden"   name="rsm" value="<%= resimler.get(i).getHbr_foto()%>" required>
                            
                        </div>
	                        <div class="form-actions">
                                    <button  type="button" onclick="window.location='?modul=haber_islm'" class="btn btn-warning btn-lg" style="width: 48%">
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

