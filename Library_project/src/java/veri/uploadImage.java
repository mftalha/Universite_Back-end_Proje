/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package veri;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author casper
 */

@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize=16177216)//1.5mb
public class uploadImage extends HttpServlet {

    PrintWriter out;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
        out =response.getWriter();
        
        if(request.getPart("resim") != null   && request.getParameter("durum") != null && request.getParameter("durum") != "" )
        { //durum
            int result=0;
            Part part =request.getPart("resim");
            String durum =(String) request.getParameter("durum");
            String icerik=(String) request.getParameter("icerik");
            
                 
                try {
                    db_katmani db = new db_katmani();
                    Connection con = db.baglan();
                    PreparedStatement ps = con.prepareStatement("insert into sliderlar(resim,durum,icerik) values(?,?,?)");
                    InputStream is = part.getInputStream();
                    ps.setBlob(1, is);
                    ps.setString(2, durum);
                    ps.setString(3, icerik);
                    result = ps.executeUpdate();
                    if(result > 0)
                    {
                        response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=slider_ekle&durum=dyr_ekl_bsr");
                    }
                    else
                    {
                        response.sendRedirect("http://localhost:8080/Library_project/panel.jsp?modul=slider_ekle&sss=hata");
                    }

                } catch (Exception e) {
                    System.out.println("slider ekleme = ıploadImage hata");
                }
        }
    }

    

}
