
package Controllers.Docentes;

import Models.Docentes.MDocentes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class GetSeccionesRevisionYRechazados extends HttpServlet {


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
            HttpSession session = (HttpSession)request.getSession();
            int IdDocente = Integer.parseInt(session.getAttribute("IdDocente").toString()); 
            ArrayList Id = (ArrayList) MDocentes.getSeccionesConNotasRechazado(IdDocente).getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MDocentes.getSeccionesConNotasRechazado(IdDocente).getGRADO();
            ArrayList Seccion = (ArrayList) MDocentes.getSeccionesConNotasRechazado(IdDocente).getSECCION();
            ArrayList codigo = (ArrayList) MDocentes.getSeccionesConNotasRechazado(IdDocente).getCODIGOMATERIA();
            ArrayList Materia = (ArrayList) MDocentes.getSeccionesConNotasRechazado(IdDocente).getNOMBREMATERIA();
            
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
                            +"<td></td>"                        
                            + "</tr>";
                        }
            
            out.print(Resp);
        }
    }

    //revision
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try (PrintWriter out = response.getWriter()) {
            HttpSession session = (HttpSession)request.getSession();
            int IdDocente = Integer.parseInt(session.getAttribute("IdDocente").toString()); 
            ArrayList Id = (ArrayList) MDocentes.getSeccionesConNotasRevision(IdDocente).getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MDocentes.getSeccionesConNotasRevision(IdDocente).getGRADO();
            ArrayList Seccion = (ArrayList) MDocentes.getSeccionesConNotasRevision(IdDocente).getSECCION();
            ArrayList codigo = (ArrayList) MDocentes.getSeccionesConNotasRevision(IdDocente).getCODIGOMATERIA();
            ArrayList Materia = (ArrayList) MDocentes.getSeccionesConNotasRevision(IdDocente).getNOMBREMATERIA();
            
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
                            +"<td></td>"                        
                            + "</tr>";
                        }
            
            out.print(Resp);
        }
    }



}
