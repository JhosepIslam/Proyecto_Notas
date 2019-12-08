
package Controllers.Academica;

import Models.Academica.MAcademica;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AprobaraRechazarExcel extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
        }
    }

//reprobar nota excel
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idMateriaDocente = Integer.parseInt(request.getParameter("IdMateriaDocente"));
        MAcademica.academicoRechazarNotasExcel(idMateriaDocente);
        
    }

//aprobar notas excel
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idMateriaDocente = Integer.parseInt(request.getParameter("IdMateriaDocente"));
        
        LeerYSubirNotasExcel leerYSubirNotasExcel = new LeerYSubirNotasExcel();
        leerYSubirNotasExcel.SubirNotas(idMateriaDocente);
        
        
       MAcademica.academicoAprobarNotasExcel(idMateriaDocente);
       
    }



}
