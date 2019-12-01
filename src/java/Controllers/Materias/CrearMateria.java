/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Materias;

import Models.Materias.MMaterias;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CrearMateria extends HttpServlet {

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
            String Codigo = request.getParameter("codigo_materia");
            out.print(MMaterias.validarCodigoMateria(Codigo).isRESULT());
        }
         
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {        
        
        
            String Codigo = request.getParameter("codigo");
            String Materia = request.getParameter("materia");

            if (Codigo.isEmpty() || Materia.isEmpty()) {
                out.print(false);

            }else{                
               out.print(MMaterias.createMateria(Codigo, Materia).isRESULT());                
            }
        }
  
    }


}
