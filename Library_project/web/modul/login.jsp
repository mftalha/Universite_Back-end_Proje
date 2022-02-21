<%-- 
    Document   : login
    Created on : 08.Eki.2021, 15:43:36
    Author     : casper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <link rel="apple-touch-icon" href="../app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="--/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i%7CQuicksand:300,400,500,700" rel="stylesheet">
    <!-- BEGIN VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="../app-assets/css/vendors.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/icheck/icheck.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/icheck/custom.css">
    <!-- END VENDOR CSS-->
    <!-- BEGIN MODERN CSS-->
    <link rel="stylesheet" type="text/css" href="../app-assets/css/app.css">
    <!-- END MODERN CSS-->
    <!-- BEGIN Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="../app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/pages/login-register.css">
    <!-- END Page Level CSS-->
    <!-- BEGIN Custom CSS-->
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <!-- END Custom CSS-->
    
</head>
<body class="vertical-layout vertical-menu 1-column  bg-full-screen-image menu-expanded blank-page blank-page" data-open="click" data-menu="vertical-menu" data-col="1-column">

    <div class="app-content content">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body"><section class="flexbox-container">
    <div class="col-12 d-flex align-items-center justify-content-center">
        <div class="col-md-4 col-10 box-shadow-2 p-0">
            <div class="card border-grey border-lighten-3 px-1 py-1 m-0">
                <div class="card-header border-0">
                    <div class="card-title text-center">
                        <img src="../images/login3.png" alt="branding logo">
                    </div>
                    
                </div>
                <div class="card-content">
                    
                    <p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"><span>Kullanıcı Erişimi</span></p>
                    <div class="card-body">                       
                        <form class="form-horizontal" action="konturol.jsp?knt=grs" method="post" novalidate>
                            <fieldset class="form-group position-relative has-icon-left">
                                <input type="text" class="form-control" id="user-name" name="mail" placeholder="Mail" required>
                                <div class="form-control-position">
                                    <i class="ft-user"></i>
                                </div>
                            </fieldset>
                            <fieldset class="form-group position-relative has-icon-left">
                                <input type="password" class="form-control" id="user-password" name="sifre" placeholder="Şifre" required>
                                <div class="form-control-position">
                                    <i class="la la-key"></i>
                                </div>
                            </fieldset>
                            <% 
                                if(request.getParameter("durum") != null)
                                {
                                    String konturol =(String) request.getParameter("durum");
                                    if(konturol.equals("yanlis"))
                                { %>
                                    <p> <span style="color:red">Email veya Password Hatalı.</span> </p>
                              <%  }
                                }
                         
                            %>
                            
                            <button type="submit" class="btn btn-outline-info btn-block"><i class="ft-unlock"></i> Login</button>
                        </form>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
</section>

        </div>
      </div>
    </div>

<!-- BEGIN VENDOR JS-->
    <script src="../app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <script src="../app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
    <script src="../app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN MODERN JS-->
    <script src="../app-assets/js/core/app-menu.js"></script>
    <script src="../app-assets/js/core/app.js"></script>
    <!-- END MODERN JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="../app-assets/js/scripts/forms/form-login-register.js"></script>
    <!-- END PAGE LEVEL JS-->

</body>
</html>