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
               
               var direccion="../ListadoDeGrados";
               var parametros ={inicio : start , fin : thisTab };
               $.post(direccion,parametros,function (respuesta){                                     
                   $("#tbodyGrados").html(respuesta);                   
               });


          }
          
          function SetPaginado(){   
              
                 var size = $("#SizeArray").val();               
                var tabs= Math.ceil(size/5);                                
                var tabSelected =$("#tabSelected").val();
                
                if ( size<=((tabSelected*5)-5) ) {
                    tabSelected= tabSelected-1;
                    $("#tabSelected").val(tabSelected);
                    
                }
                
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
                                    
                                        <th class="col-md-3">Nº</th>
                                         <th class="col-md-3">ID</th>
                                         <th class="col-md-4">Grado</th>
                                        <th class="col-md-4">Secciones</th>
                                        <th class="col-md-3"></th>                                    	
                                        <th class="col-md-3"></th>
                                        <th class="col-md-3"></th>
                                        
                                    </thead>
                                    <input type="hidden" id="tabSelected" value="1">
                                    <input type="hidden" id="SizeArray" value="<%
                                        ListadoDeGrados list = new ListadoDeGrados();
                                        ArrayList Id = list.getID_Grado();
                                        out.print(Id.size());
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
                                              
                                                 var direccion="../EliminarGrado";
                                                 var parametro={ id_grado : id};                                                 
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
                                             
                                             
                                             
        <div id="popup" class="overlay">
            <div id="popupBody">                                        
                <form id="ModificarGradoSeccion" method="POST">
                    <h2>Modificar</h2>                                                
                    <a id="cerrar"  href="ListadoDeGrado.jsp">&times;</a>                                               
                    <div class="popupContent">                                           
                        <div class="row"><br>                                                   
                            <div class="col-md-5">                                                      
                                <div class="form-group">    
                                    <label>Grado</label>
                                    <input type="hidden" id="idHidden" value="">
                                    <input type="text" id="txtGradoAdd" class="form-control" placeholder="" value="">                  
                                </div>                
                            </div>                                                  
                            <br>                                                       
                            <div class="col-md-5">                                                       
                                <div class="form-group">                                                          
                                    <button type="button" class="btn btn-info btn-fill pull-left " onclick="updateNombre()">Actualizar</button>                                                        
                                </div>                  
                            </div>                                           
                        </div>           
                        <div class="left">                                               
                            <div class="col-md-4">                                
                            </div>                                                       
                            <div class="col-md-5">                                                        
                                <div class="form-group">                                                          
                                    <label for="sel1">Seccion</label>                                                           
                                    <input type="text" id="txtSeccion" class="form-control" placeholder="" value="">                    
                                </div>                   
                            </div><br>                                               
                            <div class="col-md-3">                                              
                                <div class="form-group">                                                       
                                    <button type="button" class="btn btn-info btn-fill pull-left  " onclick="CrearSeccion()">Agregar</button>                                                       
                                </div></div>                                           
                        </div>                                           
                        <div class="row">                                              
                            <div class="col-md-4">                                                
                            </div>                                                  
                            <div class="col-md-12">
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover ">
                                        <thead>
                                        <th>ID</th>
                                        <th>Seccion</th>
                                        <th></th>
                                        </thead>
                                        <input type="hidden" id="tabSelectedSec" value="1">
                                        
                                        <tbody id="dataSecciones">
                                        <script type="text/javascript">
                                            var  Inicio=0; 
                                            var Fin=0;
                                            function setValueTabSec(tab){
                                                $("#tabSelectedSec").val(tab); 
                                              }
                                              function cargarSec(Size){ 

                                                  
                                                    var thisTab;
                                                    var size = Size;
                                                    SetPaginadoSeccion(size);
                                                    
                                                    
                                                    
                                                    var tabs= Math.ceil(size/3);

                                                    var lastTab;
                                                    var tabSelected =$("#tabSelectedSec").val();

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

                                              function SetPaginadoSeccion(Size){   

                                                     var size = Size;               
                                                    var tabs= Math.ceil(size/3);    
                                                    var tabSelected =$("#tabSelectedSec").val();
                                                    if ( size<=((tabSelected*3)-3) ) {
                                                        tabSelected= tabSelected-1;
                                                        $("#tabSelectedSec").val(tabSelected);
                                                        
                                                    }

                                                    var Paginado="";

                                                    if (tabSelected>=2) {
                                                        var prev = tabSelected-1;                    
                                                        Paginado +="<button type='button'  class='page-item' onclick=\"setValueTabSec("+prev+"); getSeccionesF5($('#idHidden').val(), $('#txtGradoAdd').val());\"  > <a class='page-link'>Previous</a>  </button>";

                                                    }else{
                                                        Paginado +="<button type='button'  class='page-item disabled'> <a class='page-link'>Previous</a>  </button>";

                                                    }
                                                    for (var i = 1, max = tabs; i <= max; i++) {
                                                        Paginado +="<button type='button'  class='page-item' onclick=\"setValueTabSec("+i+"); getSeccionesF5($('#idHidden').val(), $('#txtGradoAdd').val());\"  > <a class='page-link'>"+i+"</a>  </button>";

                                                    }
                                                    if (tabSelected >=tabs) {
                                                        Paginado +="<button type='button'  class='page-item disabled'> <a class='page-link'>Next</a>  </button>";

                                                    }else{
                                                        var next = parseInt(tabSelected)+ parseInt(1);
                                                        Paginado +="<button type='button'  class='page-item' onclick=\"setValueTabSec("+next+"); getSeccionesF5($('#idHidden').val(), $('#txtGradoAdd').val());\"  > <a class='page-link'>Next</a>  </button>";

                                                    }

                                                    $("#ulPaginationSec").html(Paginado);


                                              }
                                              function getSeccionesF5(id,grado){
                                                    $("#idHidden").val(id);                                                
                                                     var direccion="../GetSeccionesList";
                                                     var elemento =id;
                                                     var parametro = {id_grado : id };
                                                     $.get(direccion,parametro,function (respuesta){
                                                         if (respuesta !==0) {
                                                             cargarSec(respuesta);  
                                                             parametro ={id_grado : elemento , inicio : Inicio , fin : Fin};
                                                            $.post(direccion,parametro,function(respuesta2){ 
                                                                $("#dataSecciones").html(respuesta2);                                                                
                                                            });
                                                         }  
                                                });                                                  
                                              }
                                            
                                            
                                                function getSecciones(id,grado){
                                               
                                                    $("#txtGradoAdd").val(grado);
                                                    $("#idHidden").val(id);                                                
                                                     var direccion="../GetSeccionesList";
                                                     var elemento =id;
                                                     var parametro = {id_grado : id };
                                                     $.get(direccion,parametro,function (respuesta){                                                         
                                                         if (respuesta !==0) {
                                                             cargarSec(respuesta);  
                                                             parametro ={id_grado : elemento , inicio : Inicio , fin : Fin};
                                                            $.post(direccion,parametro,function(respuesta2){ 
                                                                $("#dataSecciones").html(respuesta2);
                                                                window.location=href='#popup';
                                                            });
                                                         }   
                                                    
                                                });
                                                 

                                            }
                                            
                                            function CrearSeccion() {
                                                var direccion ="../CrearSeccion";
                                                var id = $("#idHidden").val();                                                
                                                var seccion_Nombre =$("#txtSeccion").val();                                                 
                                                $("#txtSeccion").val("");                                                                                                 
                                                var parametro ={id_grado : id , seccion : seccion_Nombre };
                                                
                                                if (seccion_Nombre.trim() !=="") {                                                    
                                                    $.post(direccion,parametro,function (respuesta){
                                                        getSecciones(id,$("#txtGradoAdd").val());                                                        
                                                    });
                                                }    
                                            }
                                            
                                            function DeleteSeccion(ID){
                                                var direccion ="../EliminarSeccion";
                                                parametro = {id_seccion : ID};
                                               $.post(direccion,parametro,function (respuesta){                                                            
                                                   getSecciones($("#idHidden").val(),$("#txtGradoAdd").val());
                                               });
                                                
                                            }
                                            
                                            function updateNombre(){
                                                var direccion ="../ActualizarNombreGrado";
                                                var id = $("#idHidden").val();                                                
                                                var Nombre =$("#txtGradoAdd").val();                                                 
                                                
                                                var parametro ={id_grado : id , grado : Nombre };
                                                
                                                if (Nombre.trim() !=="") {                                                    
                                                    $.post(direccion,parametro,function (respuesta){
                                                        //alert(respuesta);
                                                        if (respuesta ==='true') {
                                                            show("Actualizado!","snackbar");
                                                        }else{
                                                            show("Error!","snackbar");
                                                        }

                                                    });
                                                }else{
                                                    show("LLene los Campos","snackbar");
                                                }
                                            }
    
                                        </script>
                                        </tbody>
                                    </table>
                                    <div class="col-md-12">
                                            
                                          <ul class="pagination" id="ulPaginationSec">                                                                 
                                   
                                          </ul>
                                            
                                     </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </form>  
            </div>
            <div id="snackbar">Some text some message..</div>  
        </div>
                                    
                                    
     <div id="popupMaterias" class="overlay">
            <div id="popupBody">                                        
                <form id="ModificarGradoSeccion" method="POST">
                    <h2>Agregar Materias</h2>                                                
                    <a id="cerrar"  href="ListadoDeGrado.jsp">&times;</a>                                               
                    <div class="popupContent">                                           
                        <div class="row"><br>                                                   
                            <div class="col-md-5">                                                      
                                <div class="form-group">    
                                    <label>Materias</label>
                                    <input type="hidden" id="idHidden" value="">                                    
                                </div>                
                            </div>                                                                                                                                                                                                           
                        </div>           
                        <div class="left">                                               
                            <div class="col-md-4">                                
                            </div>                                                       
                            <div class="col-md-5">                                                        
                                <div class="form-group">                                                          
                                    <label for="sel1">Materia</label>                                                           
                                    <select class="form-control" id="sMaterias">
                                        
                                    </select>
                                </div>                   
                            </div><br> <div class="col-md-3">                                              
                                <div class="form-group">                                                       
                                    <button type="button" class="btn btn-info btn-fill pull-left  " onclick="AgregarMateria()">Agregar</button>                                                       
                                </div></div>                                           
                        </div>                                           
                        <div class="row">                                              
                            <div class="col-md-4">                                                
                            </div>                                                  
                            <div class="col-md-12">
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover ">
                                        <thead>
                                        <th>ID</th>
                                        <th>Codigo</th>
                                        <th>Nombre</th>
                                        <th></th>
                                        </thead>
                                        <input type="hidden" id="tabSelectedMateria" value="1">
                                        
                                        <tbody id="dataMaterias">
                                        <script type="text/javascript">
                                            var  Inicio=0; 
                                            var Fin=0;
                                            function setValueTabMateria(tab){
                                                $("#tabSelectedMateria").val(tab); 
                                              }
                                              function cargarMaterias(Size){ 

                                                  
                                                    var thisTab;
                                                    var size = Size;
                                                   
                                                    SetPaginadoMaterias(size);
                                                    
                                                    
                                                    
                                                    var tabs= Math.ceil(size/3);

                                                    var lastTab;
                                                    var tabSelected =$("#tabSelectedMateria").val();

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

                                              function SetPaginadoMaterias(Size){   

                                                     var size = Size;               
                                                    var tabs= Math.ceil(size/3);    
                                                    var tabSelected =$("#tabSelectedMateria").val();
                                                    
                                                    if ( size<=((tabSelected*3)-3) ) {
                                                        tabSelected= tabSelected-1;
                                                        $("#tabSelectedMateria").val(tabSelected);
                                                        
                                                    }
    


                                                    var Paginado="";

                                                    if (tabSelected>=2) {
                                                        var prev = tabSelected-1;                    
                                                        Paginado +="<button type='button'  class='page-item' onclick=\"setValueTabMateria("+prev+"); getMateriasF5($('#idHidden').val())\"  > <a class='page-link'>Previous</a>  </button>";

                                                    }else{
                                                        Paginado +="<button type='button'  class='page-item disabled'> <a class='page-link'>Previous</a>  </button>";

                                                    }
                                                    for (var i = 1, max = tabs; i <= max; i++) {
                                                        Paginado +="<button type='button'  class='page-item' onclick=\"setValueTabMateria("+i+"); getMateriasF5($('#idHidden').val())\"  > <a class='page-link'>"+i+"</a>  </button>";

                                                    }
                                                    if (tabSelected >=tabs) {
                                                        Paginado +="<button type='button'  class='page-item disabled'> <a class='page-link'>Next</a>  </button>";

                                                    }else{
                                                        var next = parseInt(tabSelected)+ parseInt(1);
                                                        Paginado +="<button type='button'  class='page-item' onclick=\"setValueTabMateria("+next+"); getMateriasF5($('#idHidden').val())\"  > <a class='page-link'>Next</a>  </button>";

                                                    }

                                                    $("#ulPaginationMateria").html(Paginado);


                                              }
                                              function getMateriasF5(id){
                                                  getMaterias(id);
                                                    $("#idHidden").val(id);                                                
                                                     var direccion="../ListarMateriaGrado";
                                                     var elemento =id;
                                                     var parametro = {id_grado : id };
                                                     $.get(direccion,parametro,function (respuesta){
                                                         if (respuesta !==0) {
                                                             cargarMaterias(respuesta);  
                                                             parametro ={id_grado : elemento , inicio : Inicio , fin : Fin};
                                                            $.post(direccion,parametro,function(respuesta2){ 
                                                                $("#dataMaterias").html(respuesta2);                                                                
                                                            });
                                                         }  
                                                });                                                  
                                              }
                                            
                                                function getMaterias(id){
                                                    
                                                    var direccion="../ListarMateriasNotInGrados";
                                                    var id_grado =id;
                                                    var elemento ={id_grado : id_grado};
                                                    $.post(direccion,elemento, function (respuesta){
                                                        $("#sMaterias").html(respuesta);
                                                    });
                                                }
                                            
                                            
                                                function getMateriasList(id){
                                                        getMaterias(id);                                                                                              
                                                    $("#idHidden").val(id);                                                
                                                     var direccion="../ListarMateriaGrado";
                                                     var elemento =id;
                                                     var parametro = {id_grado : id };
                                                     $.get(direccion,parametro,function (respuesta){
                                                         if (respuesta !==0) {
                                                             cargarMaterias(respuesta);  
                                                             parametro ={id_grado : elemento , inicio : Inicio , fin : Fin};
                                                            $.post(direccion,parametro,function(respuesta2){ 
                                                                $("#dataMaterias").html(respuesta2);
                                                                window.location=href='#popupMaterias';
                                                            });
                                                         }   
                                                    
                                                });                                               

                                            }
                                            
                                            function AgregarMateria() {
                                                var direccion ="../CrearMateraGrado";
                                                var id = $("#idHidden").val();                                                
                                                var materia_id =$("#sMaterias").val();                                                 
                                               
                                                var parametro ={id_grado : id , materia : materia_id };
                                                
                                                if (materia_id !==0) {                                                    
                                                    $.post(direccion,parametro,function (respuesta){
                                                        getMateriasF5(id);                                                        
                                                    });
                                                }    
                                            }
                                            
                                            function DeleteMateria(IDMateria, IDGrado ){                                                
                                               
                                                var direccion ="../EliminarGradoMateria";
                                                parametro = {id_grado : IDGrado , materia : IDMateria };
                                               $.post(direccion,parametro,function (respuesta){                                                            
                                                   getMateriasF5($("#idHidden").val());
                                               });
                                                
                                            }              
                                        </script>
                                        </tbody>
                                    </table>
                                    <div class="col-md-12">
                                            
                                          <ul class="pagination" id="ulPaginationMateria">                                                                 
                                   
                                          </ul>
                                            
                                     </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </form>  
            </div>
            <div id="snackbar">Some text some message..</div>  
        </div>
                                    
                                    
                                    
                                             
                                             
                                             
        <div id="popupGrado" class="overlay">
            <div id="popupBody">                                        
                <form id="AgregarGrado" method="POST">
                    <h2>Agregar</h2>                                                
                    <a id="cerrar" href="#">&times;</a>                                               
                    <div class="popupContent">                                                                              
                        <div class="left">                                               
                            <div class="col-md-4">                                
                            </div>                                                       
                            <div class="col-md-5">                                                        
                                <div class="form-group">                                                          
                                    <label for="sel1">Grado</label>                                                           
                                    <input type="text" id="txtGrado" class="form-control" placeholder="" value="" required="Requerido">                    
                                </div>                   
                            </div><br>                                               
                            <div class="col-md-3">                                              
                                <div class="form-group">                                                       
                                    <button type="button" class="btn btn-info btn-fill pull-left " onclick="add()">Agregar</button>                                                       
                                    <script type="text/javascript">
                                        function add(){
                                          var direccion  ="../CrearGrado";
                                          var elemento = $("#txtGrado").val();
                                          var parametro = {grado : elemento};
                                         $.post(direccion,parametro,function(respuesta){
                                              if (respuesta === 'true') {
                                                  show("Agregado!","snackbar1");  
                                                  location.reload();
                                              }else{
                                                  show("Error!","snackbar1");
                                              }                                                                                             
                                          });
                                        
        
                                            
                                      }
                               
                                    </script>
                                </div></div>  
                            
                        </div>                                           
                        
                        </div>
                    </div>
                </form>  
                <div id="snackbar1">Some text some message..</div>  
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
