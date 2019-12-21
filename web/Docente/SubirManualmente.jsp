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
    <script type="text/javascript">
        function abrirSubirNotas(){
            var params= new URLSearchParams(location.search);
            var v1 = params.get('id');
            $("#ID_MateriaDocente").val(v1);
            var direccion ="../GetListAlumnosNotas";
            var parametro ={id : v1};            
            $.post(direccion,parametro,function (respuesta){
                  $("#tbodyNotasAlumnos").html(respuesta);
            });
            
        }        
    
    </script>

</head>
<body onload="abrirSubirNotas();">
     <%
        
           HttpSession objSesion = request.getSession(true);
            try {
                    int Nivel = Integer.parseInt(objSesion.getAttribute("Nivel").toString());
                    if (Nivel!=3) {  
                        response.sendRedirect("/Notas/");
}
         
}catch(Exception ex){
response.sendRedirect("/Notas/");}
               
    %>

<%@include file='../include/includeDocente.jsp' %>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Notas</h4>
                                <h5 class="title" id="infoSeccion">Info</h5>
                                
                               
                            </div>
                            <form method="POST" action="../SubirNotasManual">
                                 <input type="hidden" id="ID_MateriaDocente" name="ID_MateriDocente" value="0">
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>Nº</th>
                                        <th>NIE</th>
                                        <th>Apellidos </th>
                                    	<th>Nombre </th>
                                        <th>Apellidos </th>
                                    	<th>Nombre </th>
                                        <th>Nota</th>                                    	
                                    </thead>
                                    <tbody id="tbodyNotasAlumnos">
                                   

                                    </tbody>
                                </table>
                                <hr>
                                         <div class="col-md-12">
                                        
                                             <input type="submit" class="btn btn-info btn-fill pull-right"  value="Enviar">
                                             
                                        <div class="col-md-11"> 
                                           
                                         </div>                                      
                                        
                                        </div>
                                       
                            </div>
                                </form>
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

