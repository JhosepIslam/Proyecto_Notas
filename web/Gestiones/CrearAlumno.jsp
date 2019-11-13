<%-- 
    Document   : Tabla
    Created on : 29-oct-2019, 17:29:37
    Author     : osmin_000
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Controllers.GetGrados"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
       }else{
    %>
      <%@ include file='../include/includeAcademico.jsp' %>
    <%
        }
         }catch(Exception ex){}
               
    %>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
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
                                <form onsubmit="return validarForm()">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                              <label>Nombre</label>
                                              <input type="text" name="txtNombre" id="txtNombre" class="form-control" placeholder="Nombre" value="" required="Requerido">
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Apellido</label>
                                                <input type="text" name ="txtApellido" id="txtApellido" class="form-control" placeholder="Apellido" value="" required="Requerido">
                                            </div>
                                        </div></div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Fecha de matricula</label>
                                                <input type="date" name="txtfechaMatricula" id="txtfechaMatricula" class="form-control"required="Requerido" >
                                            </div>
                                        </div><div class="col-md-5">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">NIE</label>
                                                <input type="number" name="txtNie" id="txtNie" max="99999999" class="form-control" placeholder="00265873" required="Requerido">
                                                <div style="display:none;color:#F41C1C; font-size: 10px" id="carnetDiv">NIE no valido</div>
                                            </div>
                                        </div>
                                    </div>
                                           <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Grado</label>
                                                <select class="form-control" name="sGrados" id="sGrados" onchange="getSecciones(); validarGrado()">
                                                    <option value= 0>SELECCIONE</option>
                                                    <%
                                                        try {
                                                                GetGrados grados = new GetGrados();

                                                            ArrayList Id = grados.getId_Grado();
                                                            ArrayList Grados = grados.getGrado();

                                                            String ID= Id.get(0).toString();
                                                            String Grado= Grados.get(0).toString();

                                                            for (int i = 0; i < grados.size(); i++) {
                                                                    out.print("<option value="+Id.get(i)+">"+Grados.get(i)+"</option>" );
                                                                }
                                                                
                                                            } catch (Exception e) {
                                                            }
                                                        
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Seccion</label>
                                                <select class="form-control" name="sSeccion" id="sSeccion" onchange=" validarSeccion()">
                                                    <option value= 0>SELECCIONE</option>
                                                    <script type="text/javascript">
                                                        function getSecciones(){
                                                            
                                                            $("#sSeccion").empty();
                                                            
                                                            
                                                            var direccion ="../GetSecciones";
                                                            var elemento = $("#sGrados").val();
                                                            var parametro ={id_grado : elemento};
                                                            
                                                            $.post(direccion,parametro,function(respuesta){                                                                
                                                                $("#sSeccion").html(respuesta);
                                                            });
                                                            
                                                        }
                                                    </script>
                                                             
                                                </select>
                                            </div>
                                        </div></div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="Password" name="txtPass"  id="txtPass"class="form-control" placeholder="******" value="" required="Requerido">
                                                <div style="display:none;color:#F41C1C; font-size: 10px" id="passDiv">Las contraseñas no coinciden</div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Repetir Password</label>
                                                <input type="Password" id="txtRepPass" class="form-control" placeholder="******" value="" required="Requerido">
                                                <script type="text/javascript">
                                                    $( "#txtRepPass" ).blur(function() {
 
                                                            validarPass();

                                                         });
                                                         $( "#txtNie" ).blur(function() {                                                                                                                       
                                                            validarCarnet();
                                                         });                                                         
                                                        
                                                        
                                                        

                                                </script> 
                                                <script type="text/javascript">                                                    
                                                    var input=  document.getElementById('txtNie');
                                                        input.addEventListener('input',function(){
                                                          if (this.value.length > 8) 
                                                             this.value = this.value.slice(0,8); 
                                                        });
                                                </script>
                                           
                                            </div>  
                                            
                                            
                                             <script type="text/javascript">
                                                
                                                    var carnet = false;                                                   
                                                    var pass = false;
                                                    var Grado = false;
                                                    var Seccion = false;
                                                    
                                                    function validarGrado(){
                                                        
                                                        if ($("#sGrados").val() === '0') {  
                                                            document.getElementById("sGrados").style.borderColor="#F41C1C";
                                                            var Grado = false;
                                                        }else{
                                                            document.getElementById("sGrados").style.borderColor="#D9D9D9";
                                                            var Grado = true;
                                                        }
                                                        return Grado;
  
                                                    }
                                                    
                                                    function validarSeccion() {
                                                        if ($("#sSeccion").val() === '0') {
                                                                 document.getElementById("sSeccion").style.borderColor="#F41C1C";
                                                                var Seccion = false;
                                                            }else{
                                                                 document.getElementById("sSeccion").style.borderColor="#D9D9D9";                                                                
                                                                 var Seccion = true;
                                                            }                                                          
                                                            return Seccion;
                                                    }
    



                                                function validarCarnet(){                                                     
                                                    
                                                    try{
                                                         var direccion = "../ValidarCarnet";                                                    
                                                            var elemento = $("#txtNie").val();
                                                            var parametro ={carnet : elemento}; 
                                                            
                                                            $.post(direccion,parametro,function (resp){                                                        
                                                         if (resp === 'true') {                                                         
                                                             document.getElementById('carnetDiv').style.display='block';
                                                             document.getElementById("txtCarnet").style.borderColor="#F41C1C";
                                                             carnet = false;                                                            
                                                             return carnet;
                                                         }else {
                                                             document.getElementById('carnetDiv').style.display='none';
                                                             document.getElementById("txtCarnet").style.borderColor="#D9D9D9";
                                                             carnet = true;                                                              
                                                             return carnet;
                                                         }

                                                        });                                                     
                                                    }catch (exception) {
                                                        alert(exception);
                                                    }
 
                                                    return false;
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
    
                                               
                                                
                                                function validarForm(){                                                                                                 
                                                    validarCarnet();
                                                    validarCarnet();
                                                    validarGrado();
                                                    validarSeccion();
                                                    if(carnet && pass  && Grado && Seccion){
                                                        
                                                       
                                                        return true;
                                                    }
                                                    
                                                    return false;
                                                }
                                            </script>
                                            
                                        </div></div>

                                    <button type="submit" class="btn btn-info btn-fill pull-right">Crear Perfil</button>
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


</html>
