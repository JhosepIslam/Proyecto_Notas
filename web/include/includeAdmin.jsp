<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<div class="wrapper">
    <div class="sidebar" data-color="blue" data-image="../assets/img/sidebar-4.jpg">

    <!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag

    -->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://portal.utec.edu.sv" class="simple-text">
                    Administracion
                </a>
            </div>

            <ul class="nav">
            
                <li>
                    <a href="../Gestiones/AprobarDesaprobarAlumno.jsp">
                        <i class="pe-7s-id"></i>
                        <p>Aprobar o Desaprobar</p>
                    </a>
                </li>
                <li>
                    <a href="../Gestiones/CrearAlumno.jsp">
                        <i class="pe-7s-add-user"></i>
                        <p>Crear Alumno</p>
                    </a>
                </li>
               
                  <li>
                    <a href="../Gestiones/CrearUsuarios.jsp">
                        <i class="pe-7s-add-user"></i>
                        <p>Crear usuario</p>
                    </a>
                </li>             
                                               
                    <li>
                    <a href="../Gestiones/GestionUsuarios.jsp">
                        <i class="pe-7s-ribbon"></i>
                        <p>Gestion de Usuarios</p>
                    </a>
                </li> 
                   
                 <li>
                    <a href="../Gestiones/ListadoMaterias.jsp">
                        <i class="pe-7s-ribbon"></i>
                        <p>Gestion de Materias</p>
                    </a>
                </li>
                 
                  <li>
                    <a href="../Gestiones/ListadoDeGrado.jsp">
                        <i class="pe-7s-ribbon"></i>
                        <p>Gestion de Grados</p>
                    </a>
                </li>
                <li>
                    <a href="../Gestiones/ListadoDeDocentes.jsp">
                        <i class="pe-7s-ribbon"></i>
                        <p>Gestion de Docentes</p>
                    </a>
                </li>
                <li>
                    <a href="../Gestiones/GestionDeNotas.jsp">
                        <i class="pe-7s-ribbon"></i>
                        <p>Gestion De Notas</p>
                    </a>
                </li>
                
                <!---<li>

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
                </li>
				<li class="active-pro">
                    <a href="upgrade.html">
                        <i class="pe-7s-rocket"></i>
                        <p>Upgrade to PRO</p>
                    </a>
                </li>---->
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
                    <a class="navbar-brand" href="../Admin">Inicio</a>
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
                            <a href="../Admin/Perfil.jsp">
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
</html>
