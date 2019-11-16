/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Materias;

import Models.Materias.MMaterias;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ListarMateriasNotInGrados extends HttpServlet {


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
        int ID_GRADO =Integer.parseInt(request.getParameter("id_grado"));
        ArrayList ID = (ArrayList)MMaterias.listMateriasNotInGrados(ID_GRADO).getIDMATERIA();
        ArrayList Codigo = (ArrayList)MMaterias.listMateriasNotInGrados(ID_GRADO).getCODIGOMATERIA();
        ArrayList Nombre = (ArrayList)MMaterias.listMateriasNotInGrados(ID_GRADO).getNOMBREMATERIA();
        
        try (PrintWriter out = response.getWriter()) {
            String resultado = "<option value= 0>SELECCIONE</option>" ;
            if (!ID.isEmpty()) {
                
                for (int i = 0; i < ID.size(); i++) {
                resultado += "<option value="+ID.get(i)+">"+Codigo.get(i)+"-"+Nombre.get(i)+"</option>";
            }
                
            }else{
                 resultado += "<option value=0>No hay mas Materias</option>" ;
            }
            
            
            
            out.print(resultado);
            
        }
        
    }

  
}
