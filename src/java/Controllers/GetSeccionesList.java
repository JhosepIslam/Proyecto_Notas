/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.MGetSecciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class GetSeccionesList extends HttpServlet {


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
            
            int idGrado =Integer.parseInt(request.getParameter("id_grado"));
            ArrayList Seccion = (ArrayList)MGetSecciones.getSecciones(idGrado).getSECCION();
            ArrayList id = (ArrayList)MGetSecciones.getSecciones(idGrado).getIDSECCION();
            String Result = "";
            
            for (int i = 0; i < id.size(); i++) {
                Result +=
                    "<tr>"
                    + "<td>"+id.get(i)+"</td>"
                    + "<td>"+Seccion.get(i)+"</td>"                  
                    + "<td><button type=\"button\" class=\"btn btn-info btn-fill pull-right \"  onclick=\"DeleteSeccion('"+id.get(i)+"')\">Borrar</button></td>"
                    + "</tr>";
            }
            out.print(Result);
 
           
        }
        
    }


}
