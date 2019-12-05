
package Controllers.Evaluaciones;

import Models.Evaluaciones.MEvaluacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ListarEvaluaciones extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
       
        }
    }
public int getID_EvalSize() {
        int size =   MEvaluacion.listEvaluaciones().getIDEVALUACION().size();
        return size;
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
             ArrayList ID = (ArrayList) MEvaluacion.listEvaluaciones().getIDEVALUACION();
             ArrayList numero = (ArrayList)MEvaluacion.listEvaluaciones().getNUMEROEVALUACION();
             ArrayList Finicio= (ArrayList) MEvaluacion.listEvaluaciones().getINICIO();
             ArrayList Ffin = (ArrayList)MEvaluacion.listEvaluaciones().getFIN();
            
            int inicio = Integer.parseInt(request.getParameter("inicio"));
            int fin = Integer.parseInt(request.getParameter("fin"));
            String Resp ="";
            if (fin <= inicio) {
                fin=inicio+fin;                
            }
            
            for ( int i =inicio; i < fin; i++) {
                
                Resp +=   "<tr> "
                        + "<td>"+ID.get(i)+"</td>"                        
                        + "<td>"+numero.get(i)
                        + "</td>"
                        + "<td>"+Finicio.get(i)
                        + "</td>"
                        + "<td>"+Ffin.get(i)
                        + "</td>"                        
                        + "<td>"
                        + "<button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"eliminar('"+ID.get(i)+"')\" role=\"link\" >Eliminar</button>"
                        + "</td>"                        
                        + "</tr>";
            }
            out.print(Resp);
       
        }
    }


}
