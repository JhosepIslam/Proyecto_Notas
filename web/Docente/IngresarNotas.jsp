<%-- 
    Document   : Tabla
    Created on : 29-oct-2019, 17:29:37
    Author     : osmin_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="../image/png" href="../assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>UTEC</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="../assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="../assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link rel="icon" type="../image/png" href="../assets/img/favicon.ico">
  <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

 
   
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <link href="../assets/popup/popup.css" rel="stylesheet">

</head>
<body>
<%@include file='../include/includeDocente.jsp' %>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Ingresar Notas</h4>
                            </div>
                           <!--  <form class="col s12">
                                <div class="materialContainer">


   <div class="box">

      <div class="title">LOGIN</div>

      <div class="input">
         <label for="name">Username</label>
         <input type="text" name="name" id="name">
         <span class="spin"></span>
      </div>
       </div>

</div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">First Name</label>
        </div -->
                            <div class="content">
                                <form>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <button type="submit" onclick="window.location=href='SubirManualmente.jsp'"class="btn btn-info btn-fill pull-right">Subir Manualmente</button>
                                            </div>
                                         </div>
                                          
                                        
                                        <div class="col-md-2">
                                            <div class="form-group">
                                               <button type="submit"  class="btn btn-info btn-fill pull-right">Subir Excel</button>
                                            </div>
                                            
                                        </div>
                                          <div class="col-md-2">
                                            <div class="form-group">
                                               <button type="submit" class="btn btn-info btn-fill pull-right">Resubir Notas</button>
                                            </div>
                                            
                                        </div>
                                    </div><br/><br/>
                                            

                                   

                                   

                                  
                                     <button type="submit" class="btn btn-info btn-fill pull-right" role="link" onclick="window.location=href='#popup'">Descargar Plantilla</button>
                                    <div id="popup" class="overlay">
                                        
                                        <div id="popupBody">
                                              
                                            
                                            <h2>Descargar Plantilla</h2> 
                                            <a id="cerrar" href="">&times;</a>
                                            <div class="popupContent">
                                                <div class="col-md-3">
                                                <select class="form-control" name="Materia">
                                                    <option>Ciencias</option>
                                                </select></div>
                                                <div class="col-md-3">
                                                <select class="form-control" name="Grado">
                                                    <option>Primer grado</option>
                                                </select></div>
                                                <div class="col-md-3">
                                                <select class="form-control" name="Seccion">
                                                    <option>01</option>
                                                </select></div>
                                                <div>
                                                   <button class="btn btn-info btn-fill pull-right">Descargar</button> 
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        
                    </div>

                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                
                <p class="copyright pull-right">
                    &copy; 2019 <a href="http://portal.utec.edu.sv/(S(r1thqz1h21icufurv4r015yp))/login.aspx">UTEC</a>
                </p>
            </div>
        </footer>

    </div>
</div>


</body>

  <!--   Core JS Files   -->
    <script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="../assets/js/bootstrap-checkbox-radio-switch.js"></script>

	<!--  Charts Plugin -->
	<script src="../assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="../assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="../assets/js/light-bootstrap-dashboard.js"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="../assets/js/demo.js"></script>


</html>

