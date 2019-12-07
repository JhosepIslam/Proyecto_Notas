
package Controllers.Academica;

import Models.Academica.MAcademica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class getSeccionesConNotasRechazadasAcademica extends HttpServlet {


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
            
            
            ArrayList Id = (ArrayList) MAcademica.academicoGetMateriasConNotasRechazadaEXCEL().getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MAcademica.academicoGetMateriasConNotasRechazadaEXCEL().getGRADO();
            ArrayList Seccion = (ArrayList)MAcademica.academicoGetMateriasConNotasRechazadaEXCEL().getSECCION();
            ArrayList codigo = (ArrayList)MAcademica.academicoGetMateriasConNotasRechazadaEXCEL().getCODIGOMATERIA();
            ArrayList Materia = (ArrayList)MAcademica.academicoGetMateriasConNotasRechazadaEXCEL().getNOMBREMATERIA();
            
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
            
            
            
            ArrayList Id = (ArrayList) MAcademica.academicoGetMateriasConNotasRechazada().getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MAcademica.academicoGetMateriasConNotasRechazada().getGRADO();
            ArrayList Seccion = (ArrayList)MAcademica.academicoGetMateriasConNotasRechazada().getSECCION();
            ArrayList codigo = (ArrayList)MAcademica.academicoGetMateriasConNotasRechazada().getCODIGOMATERIA();
            ArrayList Materia = (ArrayList)MAcademica.academicoGetMateriasConNotasRechazada().getNOMBREMATERIA();
            
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
