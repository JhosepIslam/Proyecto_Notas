
package Controllers.Academica;

import Models.Academica.MAcademica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class getSeccionesSinNotasAcademica extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
            
            
            ArrayList Id = (ArrayList) MAcademica.academicoGetMateriasSinNotas().getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MAcademica.academicoGetMateriasSinNotas().getGRADO();
            ArrayList Seccion = (ArrayList)MAcademica.academicoGetMateriasSinNotas().getSECCION();
            ArrayList codigo = (ArrayList)MAcademica.academicoGetMateriasSinNotas().getCODIGOMATERIA();
            ArrayList Materia = (ArrayList)MAcademica.academicoGetMateriasSinNotas().getNOMBREMATERIA();
            
            String Resp = "";
            for (int i = 0; i < Grado.size(); i++) {
                
                Resp +=   "<tr> "
                            + "<td>"+Id.get(i)+"</td>"                        
                            + "<td>"+Grado.get(i)
                            + "</td>"
                            + "<td>"+Seccion.get(i)
                            + "</td>"
                            + "<td>"+codigo.get(i)+"-"+Materia.get(i)
                            + "</td>"                                                           
                            + "</tr>";
                        }
            
            out.print(Resp);
           
        }
    }


}
