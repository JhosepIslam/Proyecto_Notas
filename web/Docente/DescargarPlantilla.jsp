<%-- 
    Document   : DescargarPlantilla
    Created on : 12-07-2019, 05:00:41 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
        <script type="text/javascript">
               function doSubmit(){
                   var params= new URLSearchParams(location.search);
                    var v1 = params.get('URL');
                    console.log(v1);
                   document.getElementById("URL").value = v1 ;                      
                    document.getElementById('formulario').submit();

               }
               
                
        </script>
        
  
    </head>
    <body onload="doSubmit()">
        <h1></h1>
        
        <form action="../DescargarArchivoExcekPlantilla" id="formulario" name="descargar" method="POST">
            <input type="hidden" id="URL" name="FilePath" value="0"> 
            <input type="submit" value="Si el Archivo no se descargó haga click Aqui!">
        </form>
    </body>
</html>
