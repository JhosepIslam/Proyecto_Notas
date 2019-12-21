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

</head>


<body>
 <%
        
           HttpSession objSesion = request.getSession(true);
            try {
                    int Nivel = Integer.parseInt(objSesion.getAttribute("Nivel").toString());
                    if (Nivel==1) {                            
    
    %>
         <%@ include file='../include/includeAdmin.jsp' %>        
    <%
       }else if(Nivel == 2){
    %>
      <%@ include file='../include/includeAcademico.jsp' %>
    <%
        }else{
        response.sendRedirect("/Notas/");
}
         
}catch(Exception ex){
response.sendRedirect("/Notas/");}
               
    %>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header" >
                                <h4 class="title">Usuarios</h4>
                                
                                <div class="col-md-3" align="left">
                                            <div class="form-group" >
                                                <label>Buscar</label>
                                                <input type="text" class="form-control"  value="">
                                            </div>
                                        </div>
                                        <br><br>
                            </div>
                            

                            <div class="content table-responsive table-middle-width">
                                <table class="table table-hover ">
                                    <thead>
                                        
                                    <th class="col-md-1">Nombre</th>
                                        <th>Apellido</th>
                                    	<th>Carnet</th>
                                        <th>Correo</th>
                                        <th>Estado</th>
                                        
                                    	
                                    </thead>
                                    <tbody>

                                        <tr>
                                                   
                                        	
                                        	<td>123</td>
                                                <td>14</td>
                                                <td>12</td>
                                                <td>12</td>
                                                <td> <div>
                                                   <button class="btn btn-info pull-left">Dar de Baja</button></div> 
                                                </td>
                                        	
                                        </tr>

                                        <tr>
                                          
                                        	
                                        	<td>123r</td>
                                                <td>14</td>
                                                <td>14</td>
                                        	<td>12</td>
                                                <td>  <div>
                                                   <button class="btn btn-info pull-left">Dar de Baja</button> 
                                                </div></td>
                                        </tr>
                                        <tr>
                                        
                                        	
                                        	<td>S12</td>
                                                <td>14</td>
                                                <td>14</td>
                                                <td>12</td>
                                                <td>  <div>
                                                   <button class="btn btn-info pull-left">Dar de Baja</button> 
                                                </div></td>
                                        </tr>
                                        <tr>
                                          
                                        	
                                        	<td>123</td>
                                                <td>14</td>
                                                <td>14</td>
                                                <td>12</td>
                                                <td>  <div>
                                                   <button class="btn btn-info pull-left">Dar de Baja</button> 
                                                </div></td>
                                        </tr>
                                        <tr>
                                           
                                        	
                                        	<td>123</td>
                                                <td>14</td>
                                                <td>14</td>
                                                <td>12</td>
                                                <td>  <div>
                                                   <button class="btn btn-info pull-left">Dar de Baja</button> 
                                                </div></td>
                                        </tr>
                                        <tr>
                                        
                                        	
                                        	<td>M123</td>
                                                <td>14</td>
                                                <td>14</td>
                                                <td>12</td>
                                        	<td>  <div>
                                                   <button class="btn btn-info pull-left">Dar de Baja</button> 
                                                </div></td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                        <div class="col-md-12">
                                            <nav aria-label="..." >
                                              <ul class="pagination">
                                                <li class="page-item disabled">
                                                  <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item active">
                                                  <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
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
