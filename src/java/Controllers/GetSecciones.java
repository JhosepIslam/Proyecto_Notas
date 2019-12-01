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



public class GetSecciones extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    ArrayList Seccion = new ArrayList();
    ArrayList id = new ArrayList();
            
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Seccion.clear();
        id.clear();
        try (PrintWriter out = response.getWriter()) {
            int idGrado =Integer.parseInt(request.getParameter("id_grado"));
            getSecciones(idGrado);
            String resultado = "<option value= 0>SELECCIONE</option>" ;
            for (int i = 0; i < id.size(); i++) {
                resultado += "<option value="+id.get(i)+">"+Seccion.get(i)+"</option>";
            }
            out.print(resultado);
            
        }
    }
    private void getSecciones(int id_grado){          
        Seccion = (ArrayList)MGetSecciones.getSecciones(id_grado).getSECCION();
        id= (ArrayList)MGetSecciones.getSecciones(id_grado).getIDSECCION();
        
    }

}
