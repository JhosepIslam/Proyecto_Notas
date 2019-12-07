
package Controllers.Academica;

import Models.Academica.MAcademica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class getSeccionesConNotasAcademica extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try (PrintWriter out = response.getWriter()) {           
            
            
            ArrayList Id = (ArrayList) MAcademica.academicoGetMateriasConNotasEXCEL().getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MAcademica.academicoGetMateriasConNotasEXCEL().getGRADO();
            ArrayList Seccion = (ArrayList)MAcademica.academicoGetMateriasConNotasEXCEL().getSECCION();
            ArrayList codigo = (ArrayList)MAcademica.academicoGetMateriasConNotasEXCEL().getCODIGOMATERIA();
            ArrayList Materia = (ArrayList)MAcademica.academicoGetMateriasConNotasEXCEL().getNOMBREMATERIA();
            
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {           
            
            
            ArrayList Id = (ArrayList) MAcademica.academicoGetMateriasConNotas().getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MAcademica.academicoGetMateriasConNotas().getGRADO();
            ArrayList Seccion = (ArrayList)MAcademica.academicoGetMateriasConNotas().getSECCION();
            ArrayList codigo = (ArrayList)MAcademica.academicoGetMateriasConNotas().getCODIGOMATERIA();
            ArrayList Materia = (ArrayList)MAcademica.academicoGetMateriasConNotas().getNOMBREMATERIA();
            
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
