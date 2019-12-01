
package Controllers;

import Models.MCreateGrado;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CrearGrado extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            try (PrintWriter out = response.getWriter()) {            
            boolean result;
        
            String grado = request.getParameter("grado");          
                if (grado.isEmpty()) {
                    result=false;
                    out.print(result);
                } else {
                    result= MCreateGrado.createGrado(grado).isCONSULTARESULT();
                    out.print(result);
                }
        } 
    }



}
