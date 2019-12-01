
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="icon" type="image/png" href="assets/img/favicon.ico">
  <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900&subset=latin,latin-ext'>
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="./css-login/style.css">
<link rel='stylesheet' href='https://cdn.materialdesignicons.com/1.1.34/'>
<link rel="stylesheet" href="./css-login/style.css">
</head>
<body>
    

<!-- partial:index.partial.html -->
<div class="materialContainer">

    <form action="Login" method="POST">
   <div class="box">

      <div class="title">LOGIN</div>

      <div class="input">
         <label for="name">Usuario</label>
         <input type="text" name="name" id="name" required="Campo Obligatorio">
         <span class="spin"></span>
      </div>

      <div class="input">
      
        
          <input type="password" name="pass" id="pass" required="Campo Obligatorio">
         <label for="pass">Contraseña</label>
         <span class="spin"></span>
      </div>
      <div class="button login" >
          <button type="submit">Entrar</span></button>
      </div>
     
   

   </div>
         <%
           HttpSession objSesion = request.getSession(true);
            try {
                    boolean login = Boolean.parseBoolean(objSesion.getAttribute("LoginFail").toString());
                    if (!login) {                            
                            out.print("<font color='red'> Usuario o Contraseña incorrecta</font>");
                        }
                } catch (Exception e) {
                }
    %>
    </form>
 
   


   </div>

</div>
<!-- partial -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script  src="./script-login/script.js"></script>

</body>
</html>