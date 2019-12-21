<%-- 
    Document   : descargar
    Created on : 12-07-2019, 02:33:17 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
        
           HttpSession objSesion = request.getSession(true);
            try {
                    int Nivel = Integer.parseInt(objSesion.getAttribute("Nivel").toString());
                    if (Nivel==1) {                            
    
    %>
      
    <%
       }else if(Nivel == 2){
    %>
      
    <%
        }else{
        response.sendRedirect("/Notas/");
}
         
}catch(Exception ex){
response.sendRedirect("/Notas/");}
               
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
        <script type="text/javascript">
               function doSubmit(){
                   var params= new URLSearchParams(location.search);
                    var v1 = params.get('id');
                   document.getElementById("ID_MateriaDocente").value = v1 ;                   
                    document.getElementById('formulario').submit();

               }
               
                
        </script>
        
        
    </head>
    <body onload="doSubmit()">
        <h1></h1>
        
        <form action="../DescargaArchivoExcel" id="formulario" name="descargar" method="POST">
            <input type="hidden" id="ID_MateriaDocente" name="ID" value="0">        
        </form>
    </body>
</html>
