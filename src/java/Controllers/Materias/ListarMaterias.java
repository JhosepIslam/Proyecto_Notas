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

/**
 *
 * @author LENOVO
 */
public class ListarMaterias extends HttpServlet {
    private ArrayList ID_Materia;

    public int getID_MateriaSize() {
        int size =  MMaterias.listMaterias().getIDMATERIA().size();
        return size;
    }
    
    
    
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
            
            ID_Materia = (ArrayList)  MMaterias.listMaterias().getIDMATERIA();
            ArrayList Materia = (ArrayList) MMaterias.listMaterias().getNOMBREMATERIA();
            ArrayList Codigo = (ArrayList)  MMaterias.listMaterias().getCODIGOMATERIA();
            
            int inicio = Integer.parseInt(request.getParameter("inicio"));
            int fin = Integer.parseInt(request.getParameter("fin"));
            String Resp ="";
            if (fin <= inicio) {
                fin=inicio+fin;                
            }
            
            for ( int i =inicio; i < fin; i++) {
                int num = i+1;
                Resp +=   "<tr> "
                        + "<td>"+num+"</td>"                        
                        + "<td>"+ID_Materia.get(i)
                        + "</td>"
                        + "<td>"+Materia.get(i)
                        + "</td>"
                        + "<td>"+Codigo.get(i)
                        + "</td>"                        
                        + "<td>"
                        + "<button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"eliminar('"+ID_Materia.get(i)+"')\" role=\"link\" >Eliminar</button>"
                        + "</td>"                        
                        + "</tr>";
            }
            out.print(Resp);
            
        }
    }

}
