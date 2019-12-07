
package Controllers.Docentes;

import Models.Notas.MNotas;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SubirNotasManual extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
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
        
        ArrayList Notas = new ArrayList();
        ArrayList ID_Alumnos = new ArrayList();
        int ID_MateriaDocente =  Integer.parseInt(request.getParameter("ID_MateriDocente"));
        
        try (PrintWriter out = response.getWriter()) {            
         int Size = Models.Alumnos.MAlumnos.listAlumnosNotas(ID_MateriaDocente).getIDALUMNO().size();
            for (int i = 0; i < Size; i++) {
                int num = i+1;
                ID_Alumnos.add(request.getParameter("B"+num));
                Notas.add(request.getParameter("A"+num));
            }
            
            for (int i = 0; i < Size; i++) {
                MNotas.subirNotasRevisionManual(ID_MateriaDocente, Integer.parseInt(ID_Alumnos.get(i).toString()),Float.parseFloat(Notas.get(i).toString()));
            }
            response.sendRedirect("/Notas/Docente/IngresarNotas.jsp");
        }
    }

}
