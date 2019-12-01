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

public class GetDocentes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
        }
    }
    
    public int getSize(){
        int Size = MDocentes.getListDocentes().getIDDOCENTE().size();
        return Size;
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
            
            ArrayList ID_Docente = (ArrayList)  MDocentes.getListDocentes().getIDDOCENTE();
            ArrayList Nombre =  (ArrayList)  MDocentes.getListDocentes().getNOMBRE();
            ArrayList Apellido = (ArrayList)  MDocentes.getListDocentes().getAPELLIDO();
            
            int inicio = Integer.parseInt(request.getParameter("inicio"));
            int fin = Integer.parseInt(request.getParameter("fin"));
            String Resp ="";
            int Size = getSize();
            
            
            if (fin <= inicio) {
                fin=inicio+fin;                
            }
            if (Size < fin) {
                inicio = 0;
                fin = Size;
            }
            
            for ( int i =inicio; i < fin; i++) {
                int num = i+1;
                Resp +=   "<tr> "
                        + "<td>"+num+"</td>"                        
                        + "<td>"+ID_Docente.get(i)
                        + "</td>"
                        + "<td>"+Apellido.get(i)
                        + "</td>"
                        + "<td>"+Nombre.get(i)
                        + "</td>"                        
                        + "<td>"
                        + "<button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"setID('"+ID_Docente.get(i)+"')\" role=\"link\" >Eliminar</button>"
                        + "</td>" 
                        + "<td>"
                        + "<button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"abrirPopUp('"+ID_Docente.get(i)+"')\" role=\"link\" >Secciones</button>"
                        + "</td>"                        
                        + "</tr>";
            }
            out.print(Resp);            
        }
    }

}
