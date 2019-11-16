<%-- 
    Document   : Tabla
    Created on : 29-oct-2019, 17:29:37
    Author     : osmin_000
--%>

<%@page import="Controllers.Materias.ListarMaterias"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controllers.ListadoDeGrados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="../image/png" href="../assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<title>UTEC</title>
        <script type="text/javascript">
            function show(respuesta,snack){
            var x = document.getElementById(snack);

            // Add the "show" class to DIV
            x.className = "show";
            $("#"+snack).html(respuesta);
            setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
          }
          function setValueTab(tab){
            $("#tabSelected").val(tab);          
          }
          function cargar(){ 
              SetPaginado();
                var thisTab;
                var size = $("#SizeArray").val();
               
                var tabs= Math.ceil(size/5);
                
                var lastTab;
                var tabSelected =$("#tabSelected").val();
                
               var start = ((tabSelected)*5)-5;
               

               //dos o mas tabs
              if(tabs >=2){

                  //si el tab seleccionado * 5 es mayor que size
                if((tabSelected*5)>size){
                  lastTab =(size-((tabs*5)-5));
                  thisTab= lastTab;
               

                }
              //si size mod 5 es 0
                else if(size % 5 ===0){
                  thisTab=5;
                  lastTab=5;
                  
                }
                //cuando size es mayor o igual que tab * 5
                else{
                  lastTab =(size-((tabs*5)-5));
                  thisTab=5;
                   
                }
               //cuando lastTab es igual a tab * 5 = 0 
                if(lastTab===0){
                  lastTab=5;
                  thisTab= 5;
                  
                }  
              //cuando lastTab es menor que 0
                else if(lastTab<0){
                  lastTab = lastTab*-1;
                  thisTab = lastTab;
                  

                }


              }//solo un tab
              else{
                lastTab =(size-((tabSelected*5)-5));                
                if(lastTab===0){
                  lastTab=5;
                  thisTab=5;
                }  
                else if(lastTab<0){
                  lastTab = lastTab*-1;
                  thisTab= lastTab;
                }else{
                  thisTab= lastTab;
                }

              }
               
               var direccion="../ListarMaterias";
               var parametros ={inicio : start , fin : thisTab };
               $.post(direccion,parametros,function (respuesta){                                     
                   $("#tbodyGrados").html(respuesta);                   
               });


          }
          
          function SetPaginado(){   
              
                 var size = $("#SizeArray").val();               
                var tabs= Math.ceil(size/5);                                
                var tabSelected =$("#tabSelected").val();
                
                var Paginado="";
                
                if (tabSelected>=2) {
                    var prev = tabSelected-1;                    
                    Paginado +="<li class=\"page-item\"> <a class=\"page-link\" href=\"#\" tabindex=\"1\" onclick=\"setValueTab("+prev+"); cargar()\" >Previous</a>  </li>";
                    
                }else{
                    Paginado +="<li class=\"page-item disabled\"> <a class=\"page-link\" href=\"#\" tabindex=\"1\">Previous</a> </li>";
                    
                }
                for (var i = 1, max = tabs; i <= max; i++) {
                    Paginado +="<li class=\"page-item\"><a class=\"page-link\"  href=\"#\" onclick=\"setValueTab("+i+"); cargar()\">"+i+"</a></li>";
                    
                }
                if (tabSelected >=tabs) {
                    Paginado +="<li class=\"page-item disabled\"> <a class=\"page-link\" href=\"#\" tabindex=\"1\">Next</a> </li>";
                    
                }else{
                    var next = parseInt(tabSelected)+ parseInt(1);
                    Paginado +="<li class=\"page-item\"><a class=\"page-link\" href=\"#\" onclick=\"setValueTab("+next+"); cargar()\" >Next</a></li>";
                    
                }
                
                $("#ulPagination").html(Paginado);
                
                
          }
            
        </script>

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
    <link href="../assets/popup/popup_1.css" rel="stylesheet">
    <link href="../assets/popup/snackbar.css" rel="stylesheet" type="text/css"/>
</head>
<body onload="cargar()">

<%@ include file='../include/includeAdmin.jsp' %>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Grados</h4>
                               
                            </div>
                            <div class="content table-responsive table-middle-width">
                                <table class="table table-hover ">
                                    
                                    <thead> 
                                    <th class="col-md-2">Nº</th>
                                         <th class="col-md-3">ID</th>
                                        <th class="col-md-4">Materia</th>
                                        <th class="col-md-4"> Codigo</th>
                                        <th class="col-md-3"></th>                                    	
                                        
                                    </thead>
                                    <input type="hidden" id="tabSelected" value="1">
                                    <input type="hidden" id="SizeArray" value="<%
                                        ListarMaterias materias = new ListarMaterias();
                                        
                                        out.print(materias.getID_MateriaSize());
                                           %>">
                                    <tbody id="tbodyGrados">
                                    
                                        

                                    </tbody>
                                    
                                </table>
                                    <hr>
                                         <div class="col-md-12">
                                             <button type="button" class="btn btn-info btn-fill pull-right" role="link" onclick="window.location=href='#popupGrado'">Nuevo</button>
                                        <div class="col-md-11"> 
                                           
                                         </div>
                                        <script type="text/javascript">
                                            
                                            function eliminar(id){                                               
                                              
                                                 var direccion="../EliminarMateria";
                                                 var parametro={ id_materia : id};                                                 
                                                 $.post(direccion,parametro,function(respuesta){                                                     
                                               //     $("#tbodyGrados").html(respuesta); 
                                                    location.reload();
                                                    
                                                 });
                                            }
                                            
                                        </script>
                                        
                                        </div>
                                        <br/><br/><br/>
                                
                                
                                    
                                      <div class="col-md-12">
                                            
                                          <ul class="pagination" id="ulPagination">
                                                
                                            </ul>
                                            
                                     </div>                                
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
                               
                                             
                                             
        <div id="popupGrado" class="overlay">
            <div id="popupBody">                                        
                <form id="AgregarGrado" method="POST">
                    <h2>Agregar</h2>                                                
                    <a id="cerrar" href="#">&times;</a>                                               
                    <div class="popupContent">                                                                              
                        <div class="left">
                            <div id="snackbar" >Some text some message..</div>  
                            <div class="col-md-4">                                
                            </div>                                                       
                            <div class="col-md-9">                                                        
                                <div class="col-md-6">                                                          
                                    <label for="sel1">Código de la Materia</label>                                                           
                                    <input type="text" id="txtCodigo" class="form-control" placeholder="" value="" required="Requerido">                    
                                    <div style="display:none;color:#F41C1C; font-size: 10px" id="CodDiv">Codigo No válido</div>
                                </div><div class="col-md-6">                                                          
                                    <label for="sel1">Nombre de la Materia</label>                                                           
                                    <input type="text" id="txtMateria" class="form-control" placeholder="" value="" required="Requerido">                    
                                </div> 
                            </div><br><div class="col-md-3">                                              
                                <div class="form-group">                                                       
                                    <button type="button" class="btn btn-info btn-fill pull-left " onclick="add()">Agregar</button>                                                       
                                    <script type="text/javascript">
                                        var codigo_com=false;
                                        $("#txtCodigo").blur(function (){
                                           
                                            var codigo = $("#txtCodigo").val();
                                            var direccion ="../CrearMateria";
                                            var parametro ={codigo_materia : codigo};
                                            $.get(direccion,parametro,function (respuesta){
                                                
                                                if (respuesta === 'false') {
                                                    codigo_com = false;
                                                    document.getElementById('CodDiv').style.display='block';
                                                    document.getElementById("txtCodigo").style.borderColor="#F41C1C";
                                                }else{
                                                    codigo_com = true;
                                                    document.getElementById('CodDiv').style.display='none';
                                                    document.getElementById("txtCodigo").style.borderColor="#D9D9D9";
                                                }
    

                                            });
                                            
                                        });
                                        
                                        function add(){
                                            if (!codigo_com) {
                                                return false;
                                            }
    

                                          var direccion  ="../CrearMateria";
                                          var codigo = $("#txtCodigo").val();
                                          var materia = $("#txtMateria").val();
                                          var parametro = {codigo : codigo , materia : materia};
                                         $.post(direccion,parametro,function(respuesta){
                                              if (respuesta === 'true') {
                                                  var x = document.getElementById("snackbar");                                               
                                                x.className = "show";
                                                $("#snackbar").html("Agregado Exitosamente!");
                                                setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000); 
                                                  location.reload();
                                              }else{                                                  
                                                 var x = document.getElementById("snackbar");                                               
                                                x.className = "show";
                                                $("#snackbar").html("Error: complete los campos vacios");
                                                setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
                                              }                                                                                             
                                          });                                        
                                      }
                               
                                    </script>
                                </div></div>  
                            
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
