<%-- 
    Document   : Tabla
    Created on : 29-oct-2019, 17:29:37
    Author     : osmin_000
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Controllers.ListadoDeGrados"%>
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

    <link href="../assets/popup/popup_1.css" rel="stylesheet" type="text/css"/>
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

  <link href="../assets/popup/tabla_scroll.css" rel="stylesheet" type="text/css"/>
   
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <link href="../assets/popup/popup.css" rel="stylesheet">

</head>
<body>

<%@ include file='../include/includeAdmin.jsp' %>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Usuarios</h4>
                               
                            </div>
                            <div class="content table-responsive table-middle-width">
                                <table class="table table-hover " >
                                    <thead>
                                        <th><label class="checkbox">
                                                    
                                                    </label></th>
                                                    <center><th>ID</th></center>
                                        <center><th>Grado</th></center>
                                        <center><th>Secciones</th></center>
                                        <th></th>
                                    	
                                    </thead>
                                    <tbody id="tbody">
                                        <%
                                            ListadoDeGrados list = new ListadoDeGrados();
                                            ArrayList Id = list.getID_Grado();
                                            ArrayList Grado = list.getGrados();
                                            ArrayList Secciones = list.getSecciones();
                                            
                                            for (int i = 0; i < Id.size(); i++) {
                            
                                        %>

                                                    <tr>
                                                        <td><label class="checkbox">
                                                        <input type="checkbox" value="
                                                               <%
                                                 //id
                                                            Id.get(i);
                                                        %>
                                                               " data-toggle="checkbox" >
                                                        </label>
                                                        </td>
                                                        <td>
                                                            <%
                                                 //id
                                                            out.print(Id.get(i));
                                                        %>
                                                        </td>  
                                                        <td><%
                                                 //grado
                                                           out.print(Grado.get(i));
                                                        %></td>  
                                                        <td><%
                                                 //secciones
                                                            out.print(Secciones.get(i));
                                                        %></td>
                                                        <td><button type="submit" class="btn btn-info btn-fill pull-right" role="link" onclick="window.location=href='#popup'">Ver Secciones</button></td>
                                                    </tr>
                                                  
                                                    
                                             <%
                                                 }
                                             %>

                                       
                                    </tbody>
                                    
                                    <script type="text/javascript">
                                        function limpiar(){
                                        $("#tbody").empty();
                                    }
                                    
                                    
                                    </script>
                                </table>
                                             <hr>
                                         <div class="col-md-12">
                                        <button type="submit" class="btn btn-info btn-fill pull-right" role="link" onclick="window.location=href='#popup'">Modificar</button>
                                        <div class="col-md-11"> 
                                            <button type="button" class="btn btn-info btn-fill pull-right" onclick="limpiar()" role="link" >Eliminar</button>
                                         </div>
                                        
                                        </div>
                                        <br/><br/><br/>
                                
                                
                                    
                                      <div class="col-md-12">
                                            <nav aria-label="..." >
                                              <ul class="pagination">
                                                <li class="page-item disabled">
                                                  <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item ">
                                                  <a class="page-link" href="#">2</a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item">
                                                  <a class="page-link" href="#">Next</a>
                                                </li>
                                              </ul>
                                            </nav>
                            </div>
                                
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
      
                                             
        <div id="popup" class="overlay">
                                        
                                    <div id="popupBody">
                                        <form id="ModificarGradoSeccion" method="POST">    
                                            
                                                <h2>Modificar</h2> 
                                                <a id="cerrar" href="#">&times;</a>
                                                <div class="popupContent">
                                            <div class="row">
                                                    <div class="col-md-5">
                                                        <div class="form-group">
                                                            <label>Grado</label>
                                                            <input type="text" class="form-control" placeholder="" value="">
                                                        </div>
                                                    </div>
                                                        <div class="col-md-5">
                                                            <div class="form-group">
                                                                <label for="sel1">Seccion</label>
                                                                <select class="form-control" id="sel1">
                                                                    <option></option>
                                                                </select>

                                                            </div>          
                                                        </div>
                                                <div class="col-md-12 ">
                                            <button type="submit" class="btn btn-info btn-fill pull-right ">Actualizar</button>
                                            </div> 
                                            </div>
                                                </div>
                                        </form>  
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
