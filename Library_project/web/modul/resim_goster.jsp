<%-- 
    Document   : resim_goster
    Created on : 19.Kas.2021, 11:56:28
    Author     : casper
--%>

<%@page import="degiskenler.degiskenler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    degiskenler degisken = new degiskenler();
%>
<div class="app-content content">
      <div class="content-wrapper">
        
        <div class="content-body"><!-- Basic form layout section start -->
    
    <table >
        
            <td><td><Image src="<%=degisken.tablo_resim_goster_yol+request.getParameter("res_ad") %>" width="700" height="600" /> </td>
            <button type="button" onclick="window.location='?modul=<%=request.getParameter("nereden")%>&r_id=<%=request.getParameter("r_id")%>'" class="btn btn-outline-primary round btn-min-width mr-1 mb-1">Geri</button>
        
    </table>
    
        </div>
        </div>
        </div>