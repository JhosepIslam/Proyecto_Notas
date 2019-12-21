

<%@page import="Controllers.Docentes.GetDocentes"%>
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
               
               var direccion="../GetDocentes";
               var parametros ={inicio : start , fin : thisTab };
               $.post(direccion,parametros,function (respuesta){                    
                   $("#tbodyDocentes").html(respuesta);           
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
<body onload="cargar(); window.location.href='#'">

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
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Docentes</h4>
                               
                            </div>
                            <div class="content table-responsive table-middle-width">
                                <table class="table table-hover ">
                                    
                                    <thead> 
                                    <th class="col-md-2">Nº</th>
                                         <th class="col-md-3">ID</th>
                                        <th class="col-md-4">Apellidos</th>
                                        <th class="col-md-4"> Nombres</th>
                                        <th class="col-md-3"></th>                                    	
                                        <th class="col-md-3"></th> 
                                        
                                    </thead>
                                    <input type="hidden" id="tabSelected" value="1">
                                    <input type="hidden" id="SizeArray" value="<%
                                        GetDocentes docentes = new GetDocentes();                                        
                                        out.print(docentes.getSize());
                                           %>">
                                    <tbody id="tbodyDocentes">
                                    
                                        

                                    </tbody>
                                    
                                </table>
                                    <hr>
                                         <div class="col-md-12">
                                        
                                             <button type="button" class="btn btn-info btn-fill pull-right" role="link" onclick="window.location=href='CrearUsuarios.jsp'">Nuevo</button>
                                             
                                        <div class="col-md-11"> 
                                           
                                         </div>                                      
                                        
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
                   
        <div id="popUpSecciones" class="overlay">
            <div id="popupBody">                                        
                <form id="AgregarGrado" method="POST">
                    <h3>Secciones y Materias</h3> <a id="cerrar" href="#">
                        &times;</a>                                               
                    <input type="hidden" id="idDocHidden" value="0">
                    <input type="hidden" id="tabSelectedMatDoc" value="1">
                    <div class="popupContent">                                                                              
                        <div class="left">
                                      <div class="col-md-3">
                                          
                                          <label>Grado</label>
                                          <select class="form-control" id="Grado" name="Grado" onchange="getSecciones()">
                                            <option value='0' selected="">SELECCIONAR</option>
                                        </select></div>
                                        <div class="col-md-3">
                                            <label>Seccion</label>
                                            <select class="form-control" name="Seccion" id="Seccion" onchange="getMaterias()">
                                            <option value='0' selected="">SELECCIONAR</option>
                                        </select></div>                            
                                        <div class="col-md-3">
                                            <label>Materia</label>
                                            <select class="form-control" name="Materia" id="Materia" onchange="onChangeMateria()">
                                            <option value='0' selected="">SELECCIONAR</option>
                                        </select></div>
                                        
                                        <br>      
                                        <div>
                                            <input type="button" class="btn btn-info btn-fill pull-right" onclick="insertarMateriaDocente()" value="Agregar">
                                        </div>                                               
                            
                                                                                     
                                    <script type="text/javascript">
                                                                          
                                        var ID_Docente =0;                                        
                                        
                                        var  Inicio=0; 
                                            var Fin=0;
                                            function setValueTabMatDoc(tab){
                                                $("#tabSelectedMatDoc").val(tab); 
                                                
                                                
                                              }
                                              function cargarMatDoc(Size){                                                   
                                                    var thisTab;
                                                    var size = Size;
                                                   
                                                    if ($("#tabSelectedMatDoc").val() === '0') {
                                                        setValueTabMatDoc(1);
                                                       
                                                        
                                                    }
                                                    SetPaginadoMatDoc(size);                                                    
                                                     
                                                    var tabs= Math.ceil(size/3);

                                                    var lastTab;
                                                    var tabSelected =$("#tabSelectedMatDoc").val();
                                                   

                                                   var start = ((tabSelected)*3)-3;
                                                   


                                                   //dos o mas tabs
                                                  if(tabs >=2){

                                                      //si el tab seleccionado * 5 es mayor que size
                                                    if((tabSelected*3)>size){
                                                      lastTab =(size-((tabs*3)-3));
                                                      thisTab= lastTab;


                                                    }
                                                  //si size mod 5 es 0
                                                    else if(size % 3 ===0){
                                                      thisTab=3;
                                                      lastTab=3;

                                                    }
                                                    //cuando size es mayor o igual que tab * 5
                                                    else{
                                                      lastTab =(size-((tabs*3)-3));
                                                      thisTab=3;

                                                    }
                                                   //cuando lastTab es igual a tab * 5 = 0 
                                                    if(lastTab===0){
                                                      lastTab=3;
                                                      thisTab= 3;

                                                    }  
                                                  //cuando lastTab es menor que 0
                                                    else if(lastTab<0){
                                                      lastTab = lastTab*-1;
                                                      thisTab = lastTab;


                                                    }


                                                  }//solo un tab
                                                  else{
                                                    lastTab =(size-((tabSelected*3)-3));                
                                                    if(lastTab===0){
                                                      lastTab=3;
                                                      thisTab=3;
                                                    }  
                                                    else if(lastTab<0){
                                                      lastTab = lastTab*-1;
                                                      thisTab= lastTab;
                                                    }else{
                                                      thisTab= lastTab;
                                                    }

                                                  }                                                  
                                                   Inicio= start;
                                                   Fin = thisTab;


                                              }
                                              
                                              /*
                                               * 
                                               * @param {int} Size :Tamaño de los datos
                                               * @returns {no retorna}
                                               */
                                              function SetPaginadoMatDoc(Size){   

                                                     var size = Size;               
                                                    var tabs= Math.ceil(size/3);    
                                                    var tabSelected =$("#tabSelectedMatDoc").val();
                                                    
                                                    if (size<=((tabSelected*3)-3) && size !==0 ) {
                                                        tabSelected= tabSelected-1;
                                                        $("#tabSelectedMatDoc").val(tabSelected);
                                                        
                                                    }

                                                    var Paginado="";

                                                    if (tabSelected>=2) {
                                                        var prev = tabSelected-1;                    
                                                        Paginado +="<button type='button'  class='page-item' onclick=\"setValueTabMatDoc("+prev+"); cargarMateriasDocente($('#idDocHidden').val())\"  > <a class='page-link'>Previous</a>  </button>";

                                                    }else{
                                                        Paginado +="<button type='button'  class='page-item disabled'> <a class='page-link'>Previous</a>  </button>";

                                                    }
                                                    for (var i = 1, max = tabs; i <= max; i++) {
                                                        Paginado +="<button type='button'  class='page-item' onclick=\"setValueTabMatDoc("+i+"); cargarMateriasDocente($('#idDocHidden').val())\"  > <a class='page-link'>"+i+"</a>  </button>";

                                                    }
                                                    if (tabSelected >=tabs) {
                                                        Paginado +="<button type='button'  class='page-item disabled'> <a class='page-link'>Next</a>  </button>";

                                                    }else{
                                                        var next = parseInt(tabSelected)+ parseInt(1);
                                                        Paginado +="<button type='button'  class='page-item' onclick=\"setValueTabMatDoc("+next+"); cargarMateriasDocente($('#idDocHidden').val())\"  > <a class='page-link'>Next</a>  </button>";

                                                    }

                                                    $("#ulPaginationMatDoc").html(Paginado);


                                              }
                                        
                                        
                                        
                                        
                                        
                                        /*
                                         * 
                                         * funciones de gestion
                                         */
                                        
                                        function getSecciones(){                                            
                                            var idGrado = $("#Grado").val();
                                            if (idGrado === '0') {  
                                                document.getElementById("Grado").style.borderColor="#F41C1C";
                                                $("#Seccion").html("<option value=\"0\" selected>SELECCIONAR</option>");                                                 
                                                $("#Materia").html("<option value=\"0\" selected>SELECCIONAR</option>");
                                            }else{
                                                document.getElementById("Grado").style.borderColor="#D9D9D9";                                                 
                                                var direccion = "../GetSeccionesByGradoDoc";
                                                var parametro = {id_Grado : idGrado};
                                                $.post(direccion,parametro,function(resp){
                                                    $("#Seccion").html(resp);
                                                });
                                            }                                            
                                        }
                                        function getMaterias(){
                                            var IdSeccion = $("#Seccion").val();
                                            if (IdSeccion === '0') {  
                                                document.getElementById("Seccion").style.borderColor="#F41C1C";
                                                  $("#Materia").html("<option value=\"0\" selected>SELECCIONAR</option>");
                                            }else{
                                                document.getElementById("Seccion").style.borderColor="#D9D9D9";                                                 
                                                var direccion ="../GetMateriasDocenteByIDSeccion";
                                                var parametro = {IdSeccion : IdSeccion};
                                                $.post(direccion,parametro,function(resp){
                                                    $("#Materia").html(resp);
                                                });
                                                
                                            }                                            
                                        }
                                        function onChangeMateria(){
                                            var IdMateria = $("#Materia").val();
                                            if (IdMateria === '0') {  
                                                document.getElementById("Materia").style.borderColor="#F41C1C";                                                  
                                            }else{
                                                document.getElementById("Materia").style.borderColor="#D9D9D9";                                               
                                            }
                                            
                                        }
                                        function insertarMateriaDocente(){
                                            var IdSeccion = $("#Seccion").val();
                                            var IdMateria = $("#Materia").val();
                                            var IdDocente = ID_Docente;
                                            
                                            if (IdMateria === '0') {  
                                                document.getElementById("Materia").style.borderColor="#F41C1C";                                                  
                                            }else{
                                                document.getElementById("Materia").style.borderColor="#D9D9D9";                                               
                                                var direccion ="../InsertarMatriaDocente";
                                                var parametro ={IdSeccion : IdSeccion,IdMateria : IdMateria,IdDocente : IdDocente};
                                                
                                                $.post(direccion,parametro,function(resp){
                                                    
                                                    
                                                        cargarMateriasDocente(IdDocente);
                                                        getGrados();
                                                    
  
        
                                                });
                                            }  
                                            
                                        }
                                            
                                        function abrirPopUp(id){
                                            document.getElementById("Grado").style.borderColor="#D9D9D9";                                                 
                                            document.getElementById("Seccion").style.borderColor="#D9D9D9";                                                 
                                            document.getElementById("Materia").style.borderColor="#D9D9D9";                                               
                                           $("#dataMateriaDoc").empty();
                                            ID_Docente = id;
                                            $("#idDocHidden").val(id);
                                            getGrados();
                                            cargarMateriasDocente(id);
                                            window.location.href="#popUpSecciones";
                                        }
                                        function deleteMateriaDocente(id){
                                            var direccion ="../DeleteMateriaDocente";
                                            var parametro = {IdMateriaDocente : id};
                                            $.post(direccion,parametro,function(resp){
                                                var id_Docente =$("#idDocHidden").val();
                                                getGrados();
                                                cargarMateriasDocente(id_Docente);
                                            });
                                        }
                                        function cargarMateriasDocente(id){
                                           
                                            var direccion ="../GetMateriaDocenteByIDDocente";                                            
                                            var parametro ={IdDocente : id};                                            
                                            $.get(direccion,parametro,function(resp){
                                               
                                                cargarMatDoc(resp);                                                
                                                parametro = {inicio : Inicio , fin : Fin, IdDocente : ID_Docente};
                                                $.post(direccion,parametro,function (resp){
                                                $("#dataMateriaDoc").html(resp);
                                            });
                                            });
                                            
                                            
                                        }
                                        
                                        
                                        function getGrados(){
                                            
                                            var direccion = "../GetGrados";
                                            var parametro ={};
                                            $.post(direccion,parametro,function(respuesta){
                                                $("#Seccion").html("<option value=\"0\" selected>SELECCIONAR</option>");
                                               $("#Grado").html(respuesta);
                                               $("#Materia").html("<option value=\"0\" selected>SELECCIONAR</option>");
                                            });
                                        }
                               
                                    </script>
                                    
                                </div> 
                                <div class="row">                                              
                            <div class="col-md-4">                                                
                            </div>                                                  
                            <div class="col-md-12">
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover ">
                                        <thead>
                                        <th>ID</th>
                                        <th>Grado</th>
                                        <th>Seccion</th>
                                        <th>Materia</th>
                                        <th></th>
                                        </thead>                                        
                                        <tbody id="dataMateriaDoc">
                                        </tbody>
                                    </table>
                                    <div class="col-md-12">
                                            
                                          <ul class="pagination" id="ulPaginationMatDoc">                                                                 
                                   
                                          </ul>
                                            
                                     </div> 
                                </div>
                            </div>
                        </div>
                        
                            
                        </div>                               
                   
                </form>
                </div>
                
        </div>
                                    
                                    
                                    
 <div id="popupAlertDelete" class="overlay">
            <div id="popupBody">                                        
                <form id="EliminarDocente" method="POST">
                    <h2>¿Estás Seguro que quieres eliminar este docente?</h2>                                                
                    <a id="cerrar" href="#">&times;</a>                                               
                    <div class="popupContent"> 
                        <script type="text/javascript">
                            function setID(id){
                                $("#IdDocente").val(id); 
                                window.location.href="#";
                                window.location.href="#popupAlertDelete";
                            }
                            function eliminar(){
                                var idDocente =$("#IdDocente").val();
                                var direccion = "../DeleteDocente";
                                var parametro ={idDocente : idDocente};
                                $.post(direccion,parametro,function(respuesta){
                                    if (respuesta === 'true') {
                                        var tam =$("#SizeArray").val();
                                        var tamN = tam - 1;
                                        $("#SizeArray").val(tamN);
                                        cargar();
                                        window.location.href="#";
                                    }else{
                                        window.location.href="#";
                                    }
    

                                });
                            }
    
                        </script>
                        <input type="hidden" id="IdDocente">
                            <div class="col-md-10" >
                                <button type="button" class="btn btn-info btn-fill pull-right" onclick="eliminar()">Eliminar</button>
                            </div><div >
                               <button type="button" class="btn btn-info btn-fill pull-right " onclick="window.location.href='#'">Cancelar</button>                                                                                                               
                           </div>
                                </div>  
                            
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
