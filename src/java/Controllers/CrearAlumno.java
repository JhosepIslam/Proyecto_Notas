
package Controllers;

import Models.Alumnos.MAlumnos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CrearAlumno extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String NIE = request.getParameter("txtNie");
            String Nombre = request.getParameter("txtNombre");
            String Apellido = request.getParameter("txtApellido");
            String FechaMatricula = request.getParameter("txtfechaMatricula");
            int id_seccion =Integer.parseInt(request.getParameter("sSeccion"));
            String Password = request.getParameter("txtPass");
            boolean resp = MAlumnos.createAlumno(NIE, Nombre, Apellido, FechaMatricula, id_seccion,Password.trim()).isRESULT();
            if (resp) {
               
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Insertador Existosamente!!');");
                out.println("location='/Notas/Gestiones/CrearAlumno.jsp';");
                out.println("</script>");
                    
            }else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Error al Tratar de Crear El Alumno');");
                out.println("location='/Notas/Gestiones/CrearAlumno.jsp';");
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
