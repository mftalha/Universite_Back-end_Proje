<%-- 
    Document   : slider_
    Created on : 11.Kas.2021, 17:33:00
    Author     : casper
--%>

<%@page import="slider.slider_sql"%>
<%@page import="slider.db_slider"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="app-content content">  <!-- 1. -->
      <div class="content-wrapper">   <!-- 2. -->
          <div class="content-body"><!-- Basic Carousel start -->            <!-- 3. -->

<!-- Carousel Options start -->
<%
    db_slider db = new db_slider();
    ArrayList<slider_sql> resimler = db.sliderlar();
%>
<section id="carousel-options">   <!-- 4. -->
	
	<div class="row">
		<div class="col-md-10 col-sm-12">
			<div class="card">
				
				<div class="card-content">
					<div class="card-body">
                                            
                                            <div class="center" >
						<div id="carousel-interval" class="carousel slide" data-ride="carousel" data-interval="5000">
							<ol class="carousel-indicators">
                                                            <%
                                                                for(int i=0;i<resimler.size();i++)
                                                                {
                                                                    if(i==0)
                                                                    {
                                                            %>
								<li data-target="#carousel-interval" data-slide-to="<%= i %>" class="active"></li>
                                                            <%
                                                                }
                                                                else
                                                                {
                                                            %>
								<li data-target="#carousel-interval" data-slide-to="<%= i %>"></li>					
                                                            <%
                                                                }
                                                                }  
                                                            %>
							</ol>
							<div class="carousel-inner" role="listbox">
                                                            <%
                                                                for(int i=0;i<resimler.size();i++)
                                                                {
                                                                    if(i==0)
                                                                    {
                                                            %>
								<div class="carousel-item active">
                                                                    <img src="dosyalar/<%= resimler.get(i).getResim()%>"  width="800" height="600"> 
								</div>
                                                            <%
                                                                }
                                                                else
                                                                {
                                                            %>
								<div class="carousel-item">
                                                                    <img src="dosyalar/<%= resimler.get(i).getResim()%>"  width="850" height="600">
								</div>
								
                                                            <%
                                                                }
                                                                }
                                                            %>
							</div>
							<a class="carousel-control-prev" href="#carousel-interval" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carousel-interval" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
                                                        </div>
					</div>
				</div>
			</div>
		</div>
		
	</div> <!-- ss -->
	
</section>
<!-- Carousel Options end -->
        </div>
      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->

