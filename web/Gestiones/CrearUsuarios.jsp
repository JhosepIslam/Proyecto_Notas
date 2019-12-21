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
	<link rel="icon" type="image/png" href="../assets/img/favicon.ico">
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
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
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
                            <div class="header">
                                <h4 class="title">Crear Usuario</h4>
                            </div>
                            <div class="content" >
                                <form action="../CrearUsuario"  id="form" method="post" onsubmit="return validarForm()" >
                                    <div class="row">
                                      
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Usuario</label> 
                                                <input type="text" class="form-control" name ="txtUser" id="txtUser" required="Requerido"  placeholder="Usuario" value="">                                               
                                                <div style="display:none;color:#F41C1C; font-size: 10px" id="userDiv">Nombre de Usuario no valido</div>
                                            </div>                                              
                                        </div>
                                        
                                        <div class="col-md-3">
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
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <input type="text" id="txtNombre" name="txtNombre" class="form-control" placeholder=""  required="Requerido"  value="">
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Apellido</label>
                                                <input type="text" id ="txtApellido" name="txtApellido" class="form-control" placeholder="" required="Requerido" value="">
                                            </div>
                                        </div>
                                    </div><div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="Password" class="form-control" name="txtPass" id="txtPass" placeholder="" minlength="6" required="Requerido" value="">
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
                                                    var direccion = "../ValidarUsuarioExist";
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
                                                    validarPass();
                                                    validarUser();
                                                        if(user && nivel && pass){                                                      
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
