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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "ListarMateriaGrado", urlPatterns = {"/ListarMateriaGrado"})
public class ListarMateriaGrado extends HttpServlet {


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
            int idGrado =Integer.parseInt(request.getParameter("id_grado")); 
            int size = MMaterias.listarMateriasGrados(idGrado).getIDMATERIA().size();
            out.print(size);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            
            int inicio = Integer.parseInt(request.getParameter("inicio"));
            int fin = Integer.parseInt(request.getParameter("fin"));
            if (fin <= inicio) {
                fin=inicio+fin;                
            }
            int idGrado =Integer.parseInt(request.getParameter("id_grado"));
            ArrayList Codigo = (ArrayList)MMaterias.listarMateriasGrados(idGrado).getCODIGOMATERIA();
            ArrayList Nombre = (ArrayList)MMaterias.listarMateriasGrados(idGrado).getNOMBREMATERIA();
            ArrayList id =(ArrayList)MMaterias.listarMateriasGrados(idGrado).getIDMATERIA();
            String Result = "";
            
            for (int i = inicio; i < fin; i++) {
                Result +=
                    "<tr>"
                    + "<td>"+id.get(i)+"</td>"
                    + "<td>"+Codigo.get(i)+"</td>"
                    + "<td>"+Nombre.get(i)+"</td>"
                    + "<td><button type=\"button\" class=\"btn btn-info btn-fill pull-right \"  onclick=\"DeleteMateria('"+id.get(i)+"','"+idGrado+"')\">Borrar</button></td>"
                    + "</tr>";
            }
            out.print(Result);
           
        }
       
    }



}
