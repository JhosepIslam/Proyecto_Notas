
package Controllers.Academica;

import Models.Academica.MAcademica;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AprobarRechazarNotas extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }

  //rechazar notas
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            int IdDocenteMateria = Integer.parseInt(request.getParameter("IdMateriaDocente"));
            
            MAcademica.academicoRechazarNotas(IdDocenteMateria);
        }
    }

 //aprobar Notas
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            int IdDocenteMateria = Integer.parseInt(request.getParameter("IdMateriaDocente"));
            MAcademica.academicoAprobarNotas(IdDocenteMateria);
        }
    }


}
