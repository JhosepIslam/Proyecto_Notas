/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Docentes;

import Models.MGetSecciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GetSeccionesByGradoDoc extends HttpServlet {


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
            int idGrado = Integer.parseInt(request.getParameter("id_Grado"));
            
          ArrayList ID_Seccion =(ArrayList) MGetSecciones.getSecciones(idGrado).getIDSECCION();
          ArrayList Seccion  =(ArrayList) MGetSecciones.getSecciones(idGrado).getSECCION();
           String result="<option value=\"0\" selected>SELECCIONAR</option>";
          for (int i = 0; i < ID_Seccion.size(); i++) {
              result +="<option value="+ID_Seccion.get(i)+">"+Seccion.get(i)+"</option>";
          }
          
          out.print(result);
        }
    }


}
