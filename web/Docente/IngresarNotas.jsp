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
    <script type="text/javascript">
        
        function getMisSecciones(){
            var direccion = "../GetSeccionesParaNotas";
            var parametro={}; 
            $.get(direccion,parametro,function(respuest){
                    $("#titulo").html(respuest);
                 });
            $.post(direccion,parametro,function(resp){
                $("#bodyMisSecciones").html(resp);                
            });
            
            
            
            
            
             direccion = "../GetSeccionesConNotas";
                       
            $.post(direccion,parametro,function(resp){
                $("#bodyMisSeccionesConNotas").html(resp);
            });
            
            
            direccion = "../GetSeccionesRevisionYRechazados";
                       
            $.post(direccion,parametro,function(resp){
                $("#bodyMisSeccionesConNotasRevision").html(resp);
                $.get(direccion,parametro,function(resp){
                $("#bodyMisSeccionesConNotasRechazado").html(resp);
            });
            });
            
            
        }
       
        
      
        
        
    </script>

</head>
<body onload="getMisSecciones()">

<%@include file='../include/includeDocente.jsp' %>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title" id="titulo">Subir Notas</h4>                               
                            </div>
                            <div class="header">
                                <h4 class="title" >Secciones sin Notas</h4>                               
                            </div>
                            <div class="content ">                                
                                  
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>ID</th>
                                        <th>Grado</th>
                                    	<th>Seccion</th>
                                        <th>Materias</th>
                                        <th></th>
                                        <th></th>
                                    	
                                    </thead>
                                    <tbody id="bodyMisSecciones">                                      
                                        	
                                    </tbody>
                                </table>                                
                                <br/><br/><br/>

                            </div>
                        </div>
                        </div>
                    </div>   
                    
                    
                    <div class="col-md-12">
                        <div class="card">                            
                            <div class="header">
                                <h4 class="title" >Secciones con Notas</h4>                               
                            </div>
                            <div class="content ">                                
                                  
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>ID</th>
                                        <th>Grado</th>
                                    	<th>Seccion</th>
                                        <th>Materias</th>
                                        <th></th>
                                        <th></th>
                                    	
                                    </thead>
                                    <tbody id="bodyMisSeccionesConNotas">                                      
                                        	
                                    </tbody>
                                </table>                                
                                <br/><br/><br/>

                            </div>
                        </div>
                        </div>
                    </div> 
                    <div class="col-md-12">
                        <div class="card">                            
                            <div class="header">
                                <h4 class="title" >Secciones con Notas en Revisión</h4>                               
                            </div>
                            <div class="content ">                                
                                  
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>ID</th>
                                        <th>Grado</th>
                                    	<th>Seccion</th>
                                        <th>Materias</th>
                                        <th></th>
                                        <th></th>
                                    	
                                    </thead>
                                    <tbody id="bodyMisSeccionesConNotasRevision">                                      
                                        	
                                    </tbody>
                                </table>                                
                                <br/><br/><br/>

                            </div>
                        </div>
                        </div>
                    </div> 
                    <div class="col-md-12">
                        <div class="card">                            
                            <div class="header">
                                <h4 class="title" >Secciones con Notas Rechazadas</h4>                               
                            </div>
                            <div class="content ">                                
                                  
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>ID</th>
                                        <th>Grado</th>
                                    	<th>Seccion</th>
                                        <th>Materias</th>
                                        <th></th>
                                        <th></th>
                                    	
                                    </thead>
                                    <tbody id="bodyMisSeccionesConNotasRechazado">                                      
                                        	
                                    </tbody>
                                </table>                                
                                <br/><br/><br/>

                            </div>
                        </div>
                        </div>
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

