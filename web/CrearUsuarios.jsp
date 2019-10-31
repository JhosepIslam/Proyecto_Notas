<%-- 
    Document   : crearusuario
    Created on : 17-oct-2019, 21:45:35
    Author     : osmin_000
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Controllers.ListNiveles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>UTEC</title>
            

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    
        


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="style.css">
<link rel='stylesheet' href='https://cdn.materialdesignicons.com/1.1.34/'>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color="azure" data-image="assets/img/sidebar-5.jpg">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


    	
        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://portal.utec.edu.sv" class="simple-text">
                    UTEC
                </a>
            </div>

            <ul class="nav">
               
                <li >
                    <a href="modificarusuario.html">
                        <i class="pe-7s-id"></i>
                        <p>Modificar Usuario</p>
                    </a>
                </li>
                 <li>
                    <a href="CrearUsuarios.jsp">
                        <i class="pe-7s-add-user"></i>
                        <p>Crear Usuario</p>
                    </a>
                </li>
                <li>
                    <a href="table.html">
                        <i class="pe-7s-note2"></i>
                        <p>Lista Usuario</p>
                    </a>
                </li>
              <!----- <li>
                     <a href="typography.html">
                        <i class="pe-7s-news-paper"></i>
                        <p>Typography</p>
                    </a>
                </li>
                <li>
                    <a href="icons.html">
                        <i class="pe-7s-science"></i>
                        <p>Icons</p>
                    </a>
                </li>
                <li>
                    <a href="maps.html">
                        <i class="pe-7s-map-marker"></i>
                        <p>Maps</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="pe-7s-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li> ----->
				
            </ul>
    	</div>
    </div>

   <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="admin.jsp">Inicio</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                      
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret"></b>
                                    <span class="notification">5</span>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notificacion 1</a></li>
                                <li><a href="#">Notificacion 2</a></li>
                                <li><a href="#">Notificacion 3</a></li>
                              </ul>
                        </li>
                        <li>
                           <a href="">
                                <i class="fa fa-search"></i>
                            </a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        
                       <li>
                            <a href="#">
                                Perfil
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Cerrar Sesion
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Crear Perfil</h4>
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
                                <form action="CrearUsuario" id="form" method="post" onsubmit="return validarForm()" >
                                    <div class="row">
                                      
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Usuario</label> 
                                                <input type="text" class="form-control" name ="txtUser" id="txtUser" required="Requerido"  placeholder="Usuario" value="">                                               
                                                <div style="display:none;color:#F41C1C; font-size: 10px" id="userDiv">Nombre de Usuario no valido</div>
                                            </div>                                              
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Email </label>
                                                <input type="email" name="txtEmail" id ="txtEmail" class="form-control" required="Requerido"  placeholder="Email">
                                            </div>
                                        </div>
                                         <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Nivel </label>
                                                <select  name="dnivel" id="dnivel" onchange="validarNivel()" class ="form-control">
                                                    
                                                    
                                                    <%
                                                        ListNiveles niveles = new ListNiveles();
                                                        ArrayList id,Nivel = new ArrayList();                                                        
                                                        id= niveles.getIdNiveles();
                                                        Nivel = niveles.getNiveles();
                                                        for (int i = 0; i < id.size(); i++) {
                                                           out.print("<option value="+id.get(i).toString()+" selected>"+Nivel.get(i).toString()+"</option>");
                                                            }
                                                    %>
                                                    <option value="0" selected>SELECCIONE</option> 
                                                 </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <input type="text" id="txtNombre" name="txtNombre" class="form-control" placeholder=""  required="Requerido"  value="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Apellido</label>
                                                <input type="text" id ="txtApellido" name="txtApellido" class="form-control" placeholder="" required="Requerido" value="">
                                            </div>
                                        </div>
                                    </div><div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="Password" class="form-control" name="txtPass" id="txtPass" placeholder="" required="Requerido" value="">
                                                 <div style="display:none;color:#F41C1C; font-size: 10px" id="passDiv">Las contraseñas no coinciden</div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                                                <label>Repetir Password</label>
                                                <input type="Password" class="form-control" id="txtRepPass" placeholder="" required="Requerido" value="">
                                            </div>
                                             <script type="text/javascript">
                                                    $( "#txtRepPass" ).blur(function() {
                                                        validarPass();                                                   

                                                         });
                                                         
                                                     $( "#txtUser" ).blur(function() {                                                    
                                                         validarUser();                                                     

                                                         });

                                            </script>
                                            
                                            <script type="text/javascript">
                                                
                                                    var user = false;
                                                    var nivel = false;
                                                    var pass = false;
                                                    
                                                function validarUser(){ 
                                                    
                                                    var direccion = "ValidarUsuarioExist";
                                                    var elemento = $("#txtUser").val();
                                                    var parametro ={nombreUsuario : elemento};
                                                    $.post(direccion,parametro,function (respuesta){                                                         
                                                     if (respuesta === 'true') {                                                         
                                                         document.getElementById('userDiv').style.display='block';
                                                         document.getElementById("txtUser").style.borderColor="#F41C1C";
                                                         user = false;
                                                         return user;
                                                     }else {
                                                         document.getElementById('userDiv').style.display='none';
                                                         document.getElementById("txtUser").style.borderColor="#D9D9D9";
                                                         user = true;
                                                         return user;
                                                     }
                                                    
                                                    });                                                                                                      
                                                }                                                                      
                                                function validarPass(){
                                                    var Rep=document.getElementById("txtRepPass").value;
                                                    var Pass=document.getElementById("txtPass").value;
                                                    
                                                    if (Rep!==Pass) {                                                       
                                                        document.getElementById("txtRepPass").style.borderColor="#F41C1C";
                                                        document.getElementById("txtPass").style.borderColor="#F41C1C";
                                                        document.getElementById('passDiv').style.display='block';
                                                        pass = false;
                                                        return pass;
                                                    }else{                                                        
                                                        document.getElementById("txtRepPass").style.borderColor="#D9D9D9";
                                                        document.getElementById("txtPass").style.borderColor="#D9D9D9";
                                                        document.getElementById('passDiv').style.display='none';
                                                        pass = true;                                                        
                                                        return pass;
                                                    }
                                                }
    
                                               function validarNivel(){
                                                   
                                                   var lvl=document.getElementById("dnivel").value;                                                    
                                                    if (lvl === "0") {
                                                        document.getElementById("dnivel").style.borderColor="#F41C1C";
                                                        nivel = false;
                                                        return nivel;
                                                    }else{                                                        
                                                        document.getElementById("dnivel").style.borderColor="#D9D9D9";
                                                        nivel = true;
                                                        return nivel;
                                                    }
                                               }
                                                
                                                function validarForm(){  
                                                    validarNivel();
                                                    validarUser();
                                                    validarNivel();
                                                    if(user && nivel && pass){
                                                        
                                                        document.getElementById("form").submit();
                                                        return true;
                                                    }
                                                    
                                                    return false;
                                                }
                                            </script>
                                        </div> </div>
                                                    <button type="submit" onclick="validarForm()" class="btn btn-info btn-fill pull-right">Crear Perfil</button>
                                    <div class="clearfix"></div>
                                </form>
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

    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Checkbox, Radio & Switch Plugins -->
    <script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="assets/js/light-bootstrap-dashboard.js"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){

            demo.initChartist();

            $.notify({
                icon: 'pe-7s-world',
                message: "Bienvenido a <b>Colegio........</b>"

            },{
                type: 'info',
                timer: 4000
            });

        });
    </script>

</html>
