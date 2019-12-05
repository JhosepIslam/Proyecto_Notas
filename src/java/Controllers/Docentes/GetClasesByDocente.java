/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

public class GetClasesByDocente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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
            
            ArrayList IdGrados = (ArrayList) MDocentes.getGradosByDocente(IdDocente).getID();
            ArrayList Grado = (ArrayList) MDocentes.getGradosByDocente(IdDocente).getGRADO();
            String resultado = "<option value= 0>SELECCIONE</option>" ;
            for (int i = 0; i < IdGrados.size(); i++) {
                resultado += "<option value="+IdGrados.get(i)+">"+Grado.get(i)+"</option>";
            }
            out.print(resultado);
                  
        }
    }

}
