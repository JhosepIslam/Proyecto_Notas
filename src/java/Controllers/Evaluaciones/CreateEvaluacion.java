
package Controllers.Evaluaciones;

import Models.Evaluaciones.MEvaluacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;


public class CreateEvaluacion extends HttpServlet {


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
                  
                  int num_eval = Integer.parseInt(request.getParameter("num_eval"));
                                   
                  
                  String inicio = request.getParameter("inicio");
                  String fin = request.getParameter("fin");
                  
                  boolean val = MEvaluacion.validarEvaluacion(num_eval, inicio, fin).isRESULT();
                  if (val) {
                      boolean resp =MEvaluacion.setEvaluacion(num_eval, inicio, fin).isRESULT();
                      out.print(resp);
                  }else{
                       out.print(val);
                  }                             
         
        } 
    }


}
