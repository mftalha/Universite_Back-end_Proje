<%-- 
    Document   : deneme_vt_guncelle
    Created on : 20.Ara.2021, 10:59:13
    Author     : casper
--%>

<%@page import="veri.veritabanlari"%>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%
int aaaa =0;
int r_id =-5;
int ckt =0;
int ynl=0;
db_katmani db = new db_katmani();
ArrayList<veritabanlari> resimler = db.vt_lari();
boolean dolumu = false; // abone veritabanına ilk documanın gelmesi durumunda true olacak else ye girecek sonrasında

if(request.getParameter("islem")!=null & request.getParameter("islem")!=""){
    degiskenler degisken = new degiskenler();
    if(!request.getParameter("islem").equals("sil"))
    {
    int rsm_knt =0;
    int knt =0;
    int dcm_sr=-5; //hangi dokuman 
    String vrt_dk=""; // değiştirilen döküman
    String donus = "";
    
    boolean birincimi = false; //documana veri yuklerken ilk giris ise arraylistten documan verisini almak icin
     
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
                                String fileName = fi.getName(); // burda
                                boolean isInMemory = fi.isInMemory();
                                switch (fieldName) {
                                     case "file":
                                        if (fileName != "" & fileName != null) {
                                           resim_geldi=true; 
                                           System.out.println("fieldName :"+fieldName);
                                                fileName = fileName.substring(fileName.lastIndexOf("."));

                                                fileName = UUID.randomUUID().toString() + fileName;  
                                               
                                                file = new File(filePath + "/" + fileName);
                                                long sizeInBytes = fi.getSize();                        

                                                fi.write(file);
                                                sql_slider.setVt_logo(fileName);
                                                rsm_knt =1;
                                        }
                                        break;
                                        
                                    default:
                                        if (fileName != "" & fileName != null) 
                                        {
                                            System.out.println("fieldName2:"+fieldName);//39 ==500
                                            resim_geldi=true; 
                                           System.out.println("fieldName :"+fieldName);
                                                fileName = fileName.substring(fileName.lastIndexOf("."));
                                                //System.out.println("dd="+fileName);
                                                fileName = UUID.randomUUID().toString() + fileName;  
                                               
                                                file = new File(filePath + "/" + fileName);
                                                long sizeInBytes = fi.getSize();                        
                                                System.out.println("filename:"+fileName);
                                                String asdasd = fileName;
                                                System.out.println(asdasd);
                                                fi.write(file);
                                                
                                                //sql_slider.setVt_logo(fileName);
                                                dcm_sr = Integer.parseInt(fieldName);
                                                
                                                
                                                if(birincimi == false) //documan verisinin bilgileri ilk defa alma
                                                {
                                                for(int j =0;j<resimler.size();j++)
                                                {
                                                    if(r_id == resimler.get(j).getVt_id())
                                                    {
                                                        vrt_dk = resimler.get(j).getVt_dokuman();
                                                    }
                                                }
                                                birincimi=true;
                                                
                                                %>
                                                <script>
                                                    var vr_dcm = <%=vrt_dk%>;
                                                    var jsonVeri=JSON.stringify(vr_dcm.linkler);
                                                </script>      
                                                <%
                                                    }
                                                    String filenm = "\""+fileName+"\"";
                                                %>
                                                
<script>
    var v_id = <%=r_id%>;
    var d_sr = <%=dcm_sr%>;
   

    //alert("asd:"+jsonVeri);
    var veri=JSON.parse(jsonVeri);
    //veri[d_sr].link="yy";
    //alert("ılk = "+jsonVeri);
    veri[d_sr].link=<%=filenm%>;
    jsonVeri=JSON.stringify(veri);
    //alert("1. = "+jsonVeri);
    
    /*$.post("modul/abone_vt_script_isl.jsp",{id:v_id,documan:jsonVeri,islem:"guncelle"},function(data,status){//url,sonra fonksiyonda bi alacağım veri,status da durum = başarılımı
                  $("#result").html(data);//status zorunlu değil
                  if(status==="success")//statusTxt = aramanın durumunu belirtir
                   {
                       //alert("basarili");
                       //window.location.assign("http://localhost:8080/Library_project/panel.jsp?modul=abone_vt_guncelle&r_id="+v_id);
                   }//sonuc yapma sebebim islem nul degile girmemesini istemem
                  if(status==="error")
                      alert("hata");//hatayı yazdırıyor 
              }); */
    
</script>
    
    
                                            
<%     
                                        }
                                }

                            } else {

                          
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
                                    
                                    case "vt_durum": 
                                        sql_slider.setVt_durum(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                     
                                        break;
                                        
                                    case "vt_icerik": 
                                        sql_slider.setVt_icerik(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                     
                                        break;
                                    
                                    case "r_id":
                                        r_id = (Integer.parseInt(fi.getString()));
                     
                                        break;
                                        
                                    case "rsm": 
                                        if(rsm_knt == 0)
                                        {
                                            sql_slider.setVt_logo(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        }
                                        break;
                                    case "dokuman": 
                                        
                                        sql_slider.setVt_dokuman(new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        break;
                                    
                                    case "vt_acls_trh": 
                                        vt_acls_trh= (new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        vt_acls_trh = vt_acls_trh.replace("T", " ");
                                        vt_acls_trh+=":00";
                                        System.out.println("vt_acls_trh="+vt_acls_trh);
                                         break;
                                         
                                    case "vt_kpns_trh": 
                                        vt_kpns_trh= (new String(fi.getString().getBytes("ISO-8859-9"), "UTF-8"));
                                        vt_kpns_trh = vt_kpns_trh.replace("T", " ");
                                        vt_kpns_trh+=":00";
                                        System.out.println("vt_kpns_trh="+vt_kpns_trh);
                                         break;

                                    default:
//                                            System.out.println("Başka bir field");
                                    }
                            }
                        }
                        //String y = "asd";
                        //String zz="\"asdsd\"";
                        //String zz="\""+y+"\"";
                        String v_ad = "\""+sql_slider.getVt_isim()+"\"";
                        String vt_logo = "\""+sql_slider.getVt_logo()+"\"";
                        String vt_aciklama = "\""+sql_slider.getVt_aciklama()+"\"";

                        String icerik_duz=sql_slider.getVt_icerik(); //icerikdeki<p> alt satıra gecirdidgi icin sorundu onu duzelttim
                        icerik_duz = "\""+icerik_duz+"\"";
                        System.out.println("icerik_ilk_hali :"+icerik_duz);
                        String icerik_duz_son ="";
                        System.out.println("for başlıyor");
                        icerik_duz_son=icerik_duz;
                        
                        System.out.println("icerik_duz_son="+icerik_duz_son);
                        String vt_icerik = icerik_duz_son;

                        String vt_durum = "\""+sql_slider.getVt_durum()+"\"";
                        System.out.println("v_Ad:"+v_ad);
                        System.out.println("v_logo"+vt_logo);
                        //System.out.println("vt_icerik:"+vt_icerik);
                        vt_acls_trh = "\""+vt_acls_trh+"\"";
                        vt_kpns_trh = "\""+vt_kpns_trh+"\"";
                        String vt_alan = "\""+sql_slider.getVt_katagori()+"\"";
                        System.out.println("2. alert");
                         if(birincimi == false) //documan verisinin bilgileri ilk defa alma
                           {
                                                                String vrtt_dk = sql_slider.getVt_dokuman();
                                //vrtt_dk = "\""+vrtt_dk+"\"";
                                //vrtt_dk = vrtt_dk.replace("`", "");
                                System.out.println("birinci false ise");
                                //System.out.println("vrtt_dk="+vrtt_dk);
                                //vrtt_dk = vrtt_dk.replace("{\"linkler\":" , "");
                                //System.out.println("vrtt_dk_duzenle="+vrtt_dk);
                                StringBuffer sbf = new StringBuffer(vrtt_dk);// string icinde istedigim indisi silme
                                sbf.deleteCharAt(vrtt_dk.length()-1);
                                //sbf.deleteCharAt(vrtt_dk.length()-2);
                                sbf.deleteCharAt(0);//buraya gelebilmesi icin basına suslu tırnak koymustuk onları kaldırdık jsonda islem yapabilmek icin
                                //sbf.deleteCharAt(0);
                                //System.out.println("vrtt_dk_duzenle2="+sbf); 
                                vrtt_dk = sbf.toString(); 
                                //System.out.println("vrtt_dk_duzenle3="+vrtt_dk);
                                //vrtt_dk = "\""+vrtt_dk+"\"";
                                //System.out.println("vrtt_dk_duzenle4="+vrtt_dk);
                              %>
                              <script>
                                  //alert("jsonVeri degisiklik yoksa");
                                   var v_id = <%=r_id%>;
                                   var vr_dcm = <%=vrtt_dk%>;
                                   //alert("jsonVeri degisiklik yoksa:"+vr_dcm);
                                   //var dess = "ads";
                                   //alert("jsonVeri degisiklik yoksa:"+dess);
                                   var jsonVeri=JSON.stringify(vr_dcm.linkler);
                                   //alert("1"+jsonVeri);
                                   var veri=JSON.parse(jsonVeri);
                                   //alert("2"+veri);
                                   jsonVeri=JSON.stringify(veri);
                                   //alert("jsonVeri degisiklik yoksa:"+jsonVeri);
                              </script>
                              <%
                           }
                        
                        %>
                        
                        <script>
                            
                          var dene="asd";
                          
                          $.post("modul/vt_script_islemleri.jsp",{id:v_id,documan:jsonVeri,vt_isim:<%=v_ad%>,vt_alan:<%=vt_alan%>,vt_logo:<%=vt_logo%>,vt_aciklama:<%=vt_aciklama%>,vt_acls_trh:<%=vt_acls_trh%>,vt_kpns_trh:<%=vt_kpns_trh%>,vt_icerik:<%=vt_icerik.replace("\"","`")%>,vt_durum:<%=vt_durum%>,islem:"guncelle"},function(data,status){//url,sonra fonksiyonda bi alacağım veri,status da durum = başarılımı
                            $("#result").html(data);//status zorunlu değil
                            if(status==="success")//statusTxt = aramanın durumunu belirtir
                             {
                                 //alert("basarili");
                                 window.location.assign("panel.jsp?modul=deneme_vt_guncelle&sonuc=guncelle&r_id="+v_id);
                             }//sonuc yapma sebebim islem nul degile girmemesini istemem
                            if(status==="error")
                                alert("hata");//hatayı yazdırıyor 
                        }); 
          
                        </script>
                            
                        <%
                        
                        //db.abone_vt_guncelle(sql_slider.getVt_isim(), sql_slider.getVt_logo(), sql_slider.getVt_aciklama(), sql_slider.getVt_icerik(), sql_slider.getVt_durum(), r_id);
                        ckt = 1;
                        resimler = db.vt_lari();
                        
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
    else if(request.getParameter("islem").equals("sil"))
    {
        System.out.println("asd");
        r_id = Integer.parseInt(request.getParameter("r_id"));
        ArrayList<veritabanlari> veritabanlari = db.vt_lari();
        String dokuman="";
        for(int i=0;i<veritabanlari.size();i++)
        {
            if(veritabanlari.get(i).getVt_id() == r_id)
            {
                dokuman = veritabanlari.get(i).getVt_dokuman();

                %>
                <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>-->
                <%
                if(request.getParameter("elm")!= null && request.getParameter("elm")!= "")
                {
                    %>
                <script>
               var yenileme =<%=ynl%>;
               var kitaplar = <%=dokuman %>
               //console.log(kitaplar);
               
                //delete kitaplar.ss[2];
                kitaplar.linkler.splice(<%=request.getParameter("elm")%>,1); //soldaki değere kaçıncı indisi sileceğimizi giriyoruz
                var jsonVeri=JSON.stringify(kitaplar.linkler);
                var veri=JSON.parse(jsonVeri);
                //alert(veri[1].kitapAdi); //dizideki json elemana ulaşma
                //alert(jsonVeri);
                
                $.post("modul/vt_script_islemleri.jsp",{id:<%=r_id%>,documan:jsonVeri,islem:"sil"},function(data,status){//url,sonra fonksiyonda bi alacağım veri,status da durum = başarılımı
                  $("#result").html(data);//status zorunlu değil
                  if(status==="success")//statusTxt = aramanın durumunu belirtir
                   {
                       window.location.assign("panel.jsp?modul=deneme_vt_guncelle&r_id=<%=request.getParameter("r_id")%>&sonuc=sill");
                   }//sonuc yapma sebebim islem nul degile girmemesini istemem
                  if(status==="error")
                      alert("hata");//hatayı yazdırıyor
                  
              }); 
                            
                </script>
                <%
                  // response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul/ara_islm&r_id="+request.getParameter("r_id"));
                }
            }
        }
        //response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul/ara_islm&r_id="+request.getParameter("r_id"));
    }

//response.setIntHeader("Refresh",1);
//response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=abone_vt_guncelle&r_id="+request.getParameter("r_id")+"islem=sil");
}
else
{
    r_id = Integer.parseInt(request.getParameter("r_id"));   
}
%>

       
<!-- Ben -->

<%

   if(r_id != -5 )
   {
     
    //ArrayList<abone_vt> resimler = db.abone_vt_ları();
   int id=r_id;
   for(int i=0;i<resimler.size();i++)
   {
       if(resimler.get(i).getVt_id()== id)
       {
       String lnk = resimler.get(i).getVt_dokuman();
    if(aaaa ==0 )
    {
        
%>
<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
            
<%
if(request.getParameter("sonuc")!= null && request.getParameter("sonuc")!= "")
{
    System.out.println("sonuc ="+request.getParameter("sonuc"));
    if(!request.getParameter("sonuc").equals("guncelle"))
    {
        if(request.getParameter("sonuc").equals("sill"))
        {
        %>

        <div class="alert bg-success alert-dismissible mb-2" role="alert">
                                                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                        <span aria-hidden="true">×</span>
                                                                                </button>
                                                                                <strong>Deneme Veritabanı Döküman Silme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 

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
    if(!request.getParameter("sonuc").equals("sill"))
    {
        if(request.getParameter("sonuc").equals("guncelle"))
        {
        %>

        <div class="alert bg-success alert-dismissible mb-2" role="alert">
                                                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                        <span aria-hidden="true">×</span>
                                                                                </button>
                                                                                <strong>Deneme Veritabanı Güncelleme İşleminiz Başarıyla Gerçekleşmiştir.<br> </strong> 

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
%>           
            
<section id="horizontal-form-layouts">
       
    <%
        }
     %>
	<div class="row">
	    <div class="col-md-12">
	        <div class="card">
	            
	            <div class="card-content collpase show">
	                <div class="card-body">
						
                            <form class="form form-horizontal striped-rows form-bordered" action="?modul=deneme_vt_guncelle&islem=basarili" method="post" enctype="multipart/form-data" >
	                    	<div class="form-body">
	                    		
					<h4 class="form-section"><i class="la la-database"></i>Deneme Veritabanı Güncelle</h4>
                                                                <input type="hidden"   name="r_id" value="<%= id %>" required> 
                                                                
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="projectinput5">İsim</label>
                                                                    <div class="col-md-10">
                                                                        <input type="text" id="projectinput5" class="form-control " value="<%=resimler.get(i).getVt_isim()%>" name="vt_isim" required="">
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="projectinput5">Katagori</label>
                                                                    <div class="col-md-10">
                                                                        <select id="projectinput6" name="vt_katagori" class="form-control">
                                                                            <%
                                                                            if(resimler.get(i).getVt_katagori().equals("e_dergi"))
                                                                            {
                                                                            %>
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
                                                                            <%
                                                                            }
                                                                            else if(resimler.get(i).getVt_katagori().equals("e_kitap"))
                                                                            {
                                                                            %>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                            <%
                                                                            }
                                                                            else if(resimler.get(i).getVt_katagori().equals("e_tez"))
                                                                            {
                                                                            %>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                            <%
                                                                            }
                                                                            else if(resimler.get(i).getVt_katagori().equals("e_intihal"))
                                                                            {
                                                                            %>
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                            <%
                                                                            }
                                                                            else if(resimler.get(i).getVt_katagori().equals("e_multimedia"))
                                                                            {
                                                                            %>
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                            <%
                                                                            }
                                                                            else if(resimler.get(i).getVt_katagori().equals("e_referans"))
                                                                            {
                                                                            %>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                            <%
                                                                            }
                                                                            else if(resimler.get(i).getVt_katagori().equals("e_referans_yonetim"))
                                                                            {
                                                                            %>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                            <%
                                                                            }
                                                                            else if(resimler.get(i).getVt_katagori().equals("atif_veritanı"))
                                                                            {
                                                                            %>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                            <%
                                                                            }
                                                                            else if(resimler.get(i).getVt_katagori().equals("bibliyogratif_veritabani"))
                                                                            {
                                                                            %>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                            <%
                                                                            }
                                                                            else if(resimler.get(i).getVt_katagori().equals("deneme_veritabani"))
                                                                            {
                                                                            %>
                                                                            <option value="deneme_veritabani">Deneme Veritanı</option>
                                                                            <option value="e_dergi">E-Dergi</option>
                                                                            <option value="e_kitap">E-Kitap</option>
                                                                            <option value="e_tez">E-Tez</option>	
                                                                            <option value="e_intihal">E-İntihal</option>
                                                                            <option value="e_multimedia">E-Multimedia</option>
                                                                            <option value="e_referans">E-Referans</option>
                                                                            <option value="e_referans_yonetim">E-Referans Yönetim</option>
                                                                            <option value="atif_veritanı">Atıf Veritabanı</option>
                                                                            <option value="bibliyogratif_veritabani">Bibliyogratif Veritabanı</option>
                                                                            <%
                                                                            }
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                  
                                                                <div class="form-group row">
                                                                    <label class="col-md-2 label-control" for="projectinput5">Açıklama</label>
                                                                    <div class="col-md-10">
                                                                    <input type="text" id="projectinput5" class="form-control" value="<%=resimler.get(i).getVt_aciklama()%>" name="vt_aciklama">
                                                                    </div>
                                                                </div>    
                                        
                                                                <div class="form-group row">
									<label class="col-md-2 label-control">Logo</label>  
									<div class="col-md-10">
										<label id="projectinput8" class="file center-block">
											<input type="file" name="file"  id="file" accept=".png, .PNG, .jpg, .JPG, .jpeg, .JPEG">
                                                                                            
											<span class="file-custom"></span>
                                                                                        <b>Yüklü Logoyu Göster : <a href="?modul=rsm_gstr&res_ad=<%=resimler.get(i).getVt_logo()%>&r_id=<%=id%>&nereden=deneme_vt_guncelle">Göster</a></b>
                                                                                        
										</label>
									</div>
								</div>        
                                                                
                                                        <div class="form-group row">
                                                                <label class="col-md-2 label-control" for="projectinput6">Durum</label>
                                                                <div class="col-md-10">
                                                                <select id="projectinput6" name="vt_durum" class="form-control">
                                                                    <%if(resimler.get(i).getVt_durum().equals("Aktif"))
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
                                                                
                                                        </div>
                                                        
                                                        <%
                                                          String vt_aclis_trh =  (resimler.get(i).getVt_acilis_tarihi()).toString(); 
                                                          vt_aclis_trh = vt_aclis_trh.replace(" ", "T");
                                                          vt_aclis_trh=vt_aclis_trh.substring(0, 16);
                                                          System.out.println("vt_aclis_trh:"+vt_aclis_trh);
                                                          
                                                          String vt_kapanis_trh =  (resimler.get(i).getVt_kapanis_tarihi()).toString(); 
                                                          vt_kapanis_trh = vt_kapanis_trh.replace(" ", "T");
                                                          vt_kapanis_trh=vt_kapanis_trh.substring(0, 16);
                                                          System.out.println("vt_aclis_trh:"+vt_kapanis_trh);
                                                          
                                                        %>        
                                                        <div class="form-group row">
                                                                        <label class="col-md-2 label-control">Tarih</label>
                                                                        
									<div class="form-group col-md-5 mb-2">
                                                                            
                                                                            <label for="issueinput3">Veritabanı Açılış Tarihi:</label>
                                                                            <input type="datetime-local" value="<%=vt_aclis_trh%>" id="timesheetinput3" class="form-control" name="vt_acls_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Opened" data-original-title="" title="" required="">
                                                                                
                                                                        </div>
                                                                        <div class="form-group col-md-5 mb-2">
                                                                            <label for="issueinput4">Veritabanı Kapanış Tarihi:</label>
                                                                            <input type="datetime-local" value="<%=vt_kapanis_trh%>" id="issueinput4" class="form-control" name="vt_kpns_trh" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-title="Date Fixed" data-original-title="" title="" required="">
                                                                        </div>
                                                        </div>             
                                                                
                                                        <div class="form-group row">
                                                                <label class="col-md-2 label-control" for="projectinput9">İçerik</label>
                                                                <div class="col-md-10">							
                                                                    <textarea id="editor" rows="5" class="form-control" name="vt_icerik" > <%= resimler.get(i).getVt_icerik()%> </textarea>
                                                                </div>
                                                        </div>
                                                           
                                                        <div class="form-group row">
                                                                <label class="col-md-2 label-control">Dökümanlar</label>  
                                                                <div class="col-md-10">
                                                                        <label id="projectinput8" class="file center-block">
                                                                                <div id="asdzz">
                                                                                  
                                                                                </div>
                                                                        </label>
                                                                </div>
                                                        </div>        
                                                   <p id="result">
                                                       
                                                    </p>  <!--script sonucu için  -->                      
                                          <input type="hidden"   name="dokuman" value=`<%= resimler.get(i).getVt_dokuman()%>` required>
                                          <input type="hidden"   name="rsm" value="<%= resimler.get(i).getVt_logo()%>" required>
                                           
                                    </div>
	                        <div class="form-actions">
                                    <button  type="button" onclick="window.location='?modul=deneme_vt_islmlr'" class="btn btn-warning btn-lg" style="width: 48%">
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

<!--jquary script start -->
    <!-- <script src="js/jquery-3.6.0.min.js"></script> -->
    <!--jquary script fnish -->    
<script type="text/javascript">
  $(document).ready(function() //json diziden eleman silme
        { //sayfa hazır olduğunda bu işlemleri yap
            
            var uzanti="";
            var goster ="";
            var kitaplar =<%= lnk%>;
            var jsonVeri=JSON.stringify(kitaplar.linkler);
            var veri=JSON.parse(jsonVeri);
            //alert(veri[1].kitapAdi); //dizideki json elemana ulaşma
            
            for(var i=0; i<veri.length;i++)
            {
                var sat ="<div id='sss"+i+"'><input type='file' name='"+i+"'  id='file' ";
                sat+="<span class='file-custom'></span>";
                uzanti = veri[i].link;
                for(var j=0;j<uzanti.length;j++)
                {
                    if(uzanti.charAt(j)=='.')
                    {
                        //alert(uzanti.substring(j+1));
                        uzanti =uzanti.substring(j+1);
                        if(uzanti ==="png" || uzanti==="jpg" || uzanti==="jpeg")
                        {
                            //goster ="Resmi Göster";
                            sat+="<b>Yüklü Resim Dosyasını Göster: <a href='?modul=deneme_vt_resm_goster&logo_ad="+ veri[i].link  +"&r_id="+<%=id%>+"'>Göster&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></b>";
                        }
                        else if(uzanti ==="pdf")
                        {
                            sat+="<b>Yüklü Pdf Dosyasını Göster: <a href='dosyalar/"+veri[i].link+"' target='_blank'>Göster&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></b>";
                        }
                        else if(uzanti ==="doc" || uzanti ==="docx")
                        {
                            sat+="<b>Yüklü Word Dosyasını İndir: <a href='dosyalar/"+veri[i].link+"'>İndir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></b>";
                        }
                        else
                        {
                             sat+="<b>Yüklü Döküman Dosyasını Göster: <a href='dosyalar/"+veri[i].link+"' target='_blank'>Göster&nbsp;&nbsp;&nbsp;&nbsp;</a></b>";
                        }
                    }
                }
                //alert(uzanti);
                sat+="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
                sat+="<button  type='button' onclick="+"window.location='?modul=deneme_vt_guncelle&r_id="+<%=id%>+"&elm="+i+"&islem=sil'"+" class='btn btn-outline-danger style='font-size: 20%' '>Sil</button>";   
                sat+="</br></br></div>";
                $("#asdzz").append(sat);
                 //tablonun altına query append fonksiyonu ile bu değerleri ekliyoruz
            }
    });   
</script>
    <%
        }
        }
      }  
    %>
