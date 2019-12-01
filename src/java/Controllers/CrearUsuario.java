
package Controllers;

import Models.Usuario.MUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CrearUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String Nombre_Usuario = request.getParameter("txtUser");
            String Correo= request.getParameter("txtEmail");
            String Nombre= request.getParameter("txtNombre");
            String Apellido= request.getParameter("txtApellido");
            String Password= request.getParameter("txtPass");
            int Nivel= Integer.parseInt(request.getParameter("dnivel"));
            
            boolean resp=MUsuario.createUser(Nombre_Usuario, Password, Nombre, Apellido, Correo, Nivel).isRESULT();
            if (resp) {
               
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Insertador Existosamente!!');");
                out.println("location='/Notas/Gestiones/CrearUsuarios.jsp';");
                out.println("</script>");
                    
            }else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Error al Tratar de Crear El Usuario');");
                out.println("location='/Notas/Gestiones/CrearUsuarios.jsp';");
                out.println("</script>");
            }
            
      
                
            
           
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
