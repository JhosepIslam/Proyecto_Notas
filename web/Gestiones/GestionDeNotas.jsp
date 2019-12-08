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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/node-uuid/1.4.7/uuid.min.js"></script>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" />

    <link href="../assets/popup/popup_1.css" rel="stylesheet">
    <!--     Fonts and icons     -->
    <link rel="icon" type="../image/png" href="../assets/img/favicon.ico">
  <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

  <link href="../assets/css/input.css" rel="stylesheet" type="text/css"/>
  
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <script type="text/javascript">
        
        function getMisSecciones(){
            var direccion = "../GetSeccionesParaNotas";
            var parametro={}; 
            $.get(direccion,parametro,function(respuest){
                    $("#titulo").html(respuest);
                 });
                 //secciones sin Notas
            var direccion = "../getSeccionesSinNotasAcademica";
            $.post(direccion,parametro,function(resp){
                $("#bodyMisSecciones").html(resp); 
                //con nota
             direccion = "../getSeccionesConNotasAcademica";
                       
            $.post(direccion,parametro,function(resp){
                $("#bodyMisSeccionesConNotas").html(resp);
                
                $.get(direccion,parametro,function(resp){
                $("#bodyMisSeccionesConNotasExcel").html(resp);
                
                
                 //revision
            direccion = "../getSeccionesConNotasRevisionAcademica";                       
            $.post(direccion,parametro,function(resp){
                $("#bodyMisSeccionesConNotasRevision").html(resp);
                    $.get(direccion,parametro,function(resp){
                $("#bodyMisSeccionesConNotasRevisionExcel").html(resp);
                    });
                //rechazado
                direccion = "../getSeccionesConNotasRechazadasAcademica";
                $.post(direccion,parametro,function(resp){
                $("#bodyMisSeccionesConNotasRechazado").html(resp);
                
                $.get(direccion,parametro,function(resp){
                $("#bodyMisSeccionesConNotasRechazadoExcel").html(resp);
            });
            });
            });
            });
                
            });
                
            });    
        }
       
        
      function cancelarRevision(id){
          var direccion  = "../CancelarRevision";
          var parametro ={id:id};
          $.post(direccion,parametro,function (resp){
                    getMisSecciones();        
          });
          
      }
      
      function AprobarExcel(idMateriaDocente){
          var direccion ="../AprobaraRechazarExcel";
          var parametro ={IdMateriaDocente : idMateriaDocente};
          
          $.post(direccion,parametro,function(resp){
                    getMisSecciones();        
          });   
      }
      function RechazarExcel(idMateriaDocente){
          var direccion ="../AprobaraRechazarExcel";
          var parametro ={IdMateriaDocente : idMateriaDocente};
          
          $.get(direccion,parametro,function(resp){
                 getMisSecciones();           
          });   
      }
      
      function AprobarNota(id){
          var direccion ="../AprobarRechazarNotas";
          var parametro ={IdMateriaDocente : id};
          $.post(direccion,parametro,function (respuesta){
               getMisSecciones();             
          });
      }
      function RechazarNotas(id){
          var direccion ="../AprobarRechazarNotas";
          var parametro ={IdMateriaDocente : id};
          $.get(direccion,parametro,function (respuesta){
               getMisSecciones();             
          });
      }
       
      function verNotas(id){
          var win =window.open("VerNotasAlumnos.jsp?id="+id,'_blank');
          win.focus();
      }
      function verNotasEXCEL(id){
          var win =window.open("descargar.jsp?id="+id,'_blank');                    
      }
        
        
    </script>

</head>
<body onload="getMisSecciones() ; window.location.href='#'">
  
    <%@include file='../include/includeAcademico.jsp' %>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <h4 class="title" id="titulo">Subir Notas</h4>                               
                    <div class="col-md-12">
                        <div class="card">                            
                            <div class="header">
                                <h4 class="title" >Secciones sin Notas</h4>                               
                            </div>
                            <div class="content ">                                
                                  
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                         <th class="col-md-1">ID</th>
                                        <th class="col-md-3">Grado</th>
                                    	<th class="col-md-3">Seccion</th>
                                        <th class="col-md-4">Materias</th>
                                        <th class="col-md-4"></th>
                                        <th class="col-md-4"></th>
                                    	
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
                                <h4 class="title" >Secciones con Notas en Excel</h4>                               
                            </div>
                            <div class="content ">                                
                                  
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>ID</th>
                                        <th>Grado</th>
                                    	<th>Seccion</th>
                                        <th>Materias</th>                                        
                                    	
                                    </thead>
                                    <tbody id="bodyMisSeccionesConNotasExcel">                                    
                                        	
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
                                <h4 class="title" >Secciones con Notas en Revisión </h4>                               
                            </div>
                            <div class="content ">                                
                                  
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th class="col-md-2">ID</th>
                                        <th class="col-md-2"> Grado</th>
                                    	<th class="col-md-2">Seccion</th>
                                        <th class="col-md-2">Materias</th>
                                        <th></th>                                        
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
                                <h4 class="title" >Secciones con Notas en Excel en Revisión </h4>                               
                            </div>
                            <div class="content ">                                
                                  
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <th class="col-md-2">ID</th>
                                        <th class="col-md-2"> Grado</th>
                                    	<th class="col-md-2">Seccion</th>
                                        <th class="col-md-2">Materias</th>
                                        <th></th> 
                                        <th></th> 
                                        <th></th> 
                                    	
                                    </thead>
                                    <tbody id="bodyMisSeccionesConNotasRevisionExcel">                                      
                                        	
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
                                        <th class="col-md-1">ID</th>
                                        <th class="col-md-3">Grado</th>
                                    	<th class="col-md-3">Seccion</th>
                                        <th class="col-md-4">Materias</th>
                                        <th class="col-md-3"></th>                                        
                                    	
                                    </thead>
                                    <tbody id="bodyMisSeccionesConNotasRechazado">                                      
                                        	
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
                                <h4 class="title" >Secciones con Notas en Excel Rechazadas</h4>                               
                            </div>
                            <div class="content ">                                
                                  
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th class="col-md-1">ID</th>
                                        <th class="col-md-3">Grado</th>
                                    	<th class="col-md-3">Seccion</th>
                                        <th class="col-md-4">Materias</th>
                                        <th class="col-md-3"></th>                                        
                                    	
                                    </thead>
                                    <tbody id="bodyMisSeccionesConNotasRechazadoExcel">                                      
                                        	
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
<div id="popupNotas" class="overlay">
            <div id="popupBody">                                        
                <form id="SubirNota" method="POST">
                    <h2>Opciones</h2>                                                
                    <a id="cerrar" href="#">&times;</a>                                               
                    <div class="popupContent">                                                                              
                        <div class="left">                                               
                            <input type="hidden" name="id" id="ID">
                            <div class="col-md-6">                                                        
                                <div class="form-group">                              
                                    <button type="button" class="btn btn-info btn-fill pull-left" onclick="SubirManual()">Subir Manualmente</button>                                                       
                                </div>                   
                            </div>
                            <div class="col-md-6">                                                        
                                <div class="form-group">                              
                                    <button type="button" class="btn btn-info btn-fill pull-right" onclick="abrirPopExcel($('#ID').val())">Subir Excel</button>                                                       
                                </div>                   
                            </div>
                            
                            <script type="text/javascript">
                                function abrirPopNotas(id){
                                    window.location.href='#';
                                    window.location.href='#popupNotas';
                                    $("#ID").val(id);
                                    console.log(id);
                                    //window.location=href='#popupGrado'
                                    
                                }  
                                
                                function SubirManual(){
                                    var id = $("#ID").val();
                                    window.location.href=("SubirManualmente.jsp?id="+id);
                                }
                            </script>

                        </div>                                           
                        
                        </div>
                    </div>
                </form>  
                  
            </div>
 
<div id="popupExcel" class="overlay">
            <div id="popupBody">                                        
                <form action="../RecibirArchivo" id="SubirNota" method="POST" enctype="multipart/form-data">
                    <h2>Subir</h2>                                                
                    <a id="cerrar" href="#">&times;</a>                                               
                    <div class="popupContent">                                                                              
                        <div class="right">                                               
                            <center>
                            <div class="col-md-5">                                                        
                                <div  id="div_file">   
                                    <p id="texto">Agregar</p>
                                    <input type="hidden" id="Nombre" name="name">
                                    <input type="hidden" id="idDoceM" name="idDoceM">
                                    <input type="file" class="btn btn-info btn-fill "
                                           id="enviar"
                                           name="file"
                                           accept=".xlsx, .xlsm"
                                           onchange="archivoSubido()"
                                           >
                                </div> 
                            </div>
                                                                                       
                            <div class="col-md-6">                                                        
                                <div class="form-group">                              
                                    <input type="submit" id="enviarBu" disabled="Seleccione Archivo" class="btn btn-info btn-fill " value="Enviar">                                                     
                                </div>                   
                            </div>
                            </div>
                        </center>
                            
                            <script type="text/javascript">
                                function abrirPopExcel(id){
                                    $("#idDoceM").val(id);
                                    
                                    window.location.href='#';
                                    window.location.href='#popupExcel';
                                    //window.location=href='#popupGrado'
                                }  
                                
                                function archivoSubido(){
                                    
                                    var allowedExtensions = /(.xlsx|.xlsm)$/i;
                                    var fileInput = document.getElementById("enviar");
                                    var filePath = fileInput.value;
                                     if(!allowedExtensions.exec(filePath)){
                                         document.getElementById("enviarBu").disabled = true;
                                        alert('Por Favor Suba la Plantilla de Excel');                                        
                                        fileInput.value = '';                                        
                                        return false;
                                    }else{
                                        var nombre = uuid.v4();
                                        $("#Nombre").val(nombre);
                                        document.getElementById("enviarBu").disabled = false;
                                    }
                                    
                                    
                                }
                                
                            </script>

                        </div>                                           
                        </form> 
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

