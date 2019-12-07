
package Controllers.Academica;

import Models.Academica.MAcademica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class getSeccionesConNotasRevisionAcademica extends HttpServlet {


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
            
            
            
            ArrayList Id = (ArrayList) MAcademica.academicoGetMateriasConNotasRevisionEXCEL().getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MAcademica.academicoGetMateriasConNotasRevisionEXCEL().getGRADO();
            ArrayList Seccion = (ArrayList)MAcademica.academicoGetMateriasConNotasRevisionEXCEL().getSECCION();
            ArrayList codigo = (ArrayList)MAcademica.academicoGetMateriasConNotasRevisionEXCEL().getCODIGOMATERIA();
            ArrayList Materia = (ArrayList)MAcademica.academicoGetMateriasConNotasRevisionEXCEL().getNOMBREMATERIA();
            
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
                               + "<td><button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"cancelarRevision("+Id.get(i)+")\" role=\"link\" >Ver</button> </td>"
                         + "<td><button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"AprobarExcel("+Id.get(i)+")\" role=\"link\" >Aprobar</button> </td>"
                          + "<td><button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"RechazarExcel("+Id.get(i)+")\" role=\"link\" >Rechazar</button> </td>"
                             
                            + "</tr>";
                        }
            
            out.print(Resp);
           
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try (PrintWriter out = response.getWriter()) {
            
            
            
            ArrayList Id = (ArrayList) MAcademica.academicoGetMateriasConNotasRevision().getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MAcademica.academicoGetMateriasConNotasRevision().getGRADO();
            ArrayList Seccion = (ArrayList)MAcademica.academicoGetMateriasConNotasRevision().getSECCION();
            ArrayList codigo = (ArrayList)MAcademica.academicoGetMateriasConNotasRevision().getCODIGOMATERIA();
            ArrayList Materia = (ArrayList)MAcademica.academicoGetMateriasConNotasRevision().getNOMBREMATERIA();
            
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
                             + "<td><button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"cancelarRevision("+Id.get(i)+")\" role=\"link\" >Ver</button> </td>"
                         + "<td><button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"cancelarRevision("+Id.get(i)+")\" role=\"link\" >Aprobar</button> </td>"
                          + "<td><button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"cancelarRevision("+Id.get(i)+")\" role=\"link\" >Rechazar</button> </td>"
                             
                            + "</tr>";
                        }
            
            out.print(Resp);
           
        }
    }


}
