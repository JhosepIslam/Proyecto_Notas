
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


public class GetSeccionesConNotas extends HttpServlet {

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
            HttpSession session = (HttpSession)request.getSession();
            int IdDocente = Integer.parseInt(session.getAttribute("IdDocente").toString()); 
            ArrayList Id = (ArrayList) MDocentes.getSeccionesConNotas(IdDocente).getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MDocentes.getSeccionesConNotas(IdDocente).getGRADO();
            ArrayList Seccion = (ArrayList) MDocentes.getSeccionesConNotas(IdDocente).getSECCION();
            ArrayList codigo = (ArrayList) MDocentes.getSeccionesConNotas(IdDocente).getCODIGOMATERIA();
            ArrayList Materia = (ArrayList) MDocentes.getSeccionesConNotas(IdDocente).getNOMBREMATERIA();
            
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
