<%-- 
    Document   : deneme_vt_resim_goster
    Created on : 20.Ara.2021, 11:17:51
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
        
            <td><td><Image src="<%=degisken.tablo_resim_goster_yol+request.getParameter("logo_ad") %>" width="700" height="600" /> </td>
            <button type="button" onclick="window.location='?modul=deneme_vt_guncelle&r_id=<%= request.getParameter("r_id") %>'" class="btn btn-outline-primary round btn-min-width mr-1 mb-1">Geri</button>
        
    </table>
    
        </div>
        </div>
        </div>
