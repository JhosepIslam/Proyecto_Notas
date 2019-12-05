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


public class GetSeccionesByDocente extends HttpServlet {

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
            int IdGrado = Integer.parseInt(request.getParameter("IdGrado"));
            
            ArrayList IdSeccion = (ArrayList) MDocentes.getSeccionesByDocente(IdDocente,IdGrado).getIDSECCION();
            ArrayList Seccion = (ArrayList) MDocentes.getSeccionesByDocente(IdDocente,IdGrado).getSECCION();
            String resultado = "<option value= 0>SELECCIONE</option>" ;
            for (int i = 0; i < IdSeccion.size(); i++) {
                resultado += "<option value="+IdSeccion.get(i)+">"+Seccion.get(i)+"</option>";
            }
            out.print(resultado);
                  
        }       
        
    }

}
