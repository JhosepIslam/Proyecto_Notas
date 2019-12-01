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


public class GetMateriaDocenteByIDDocente extends HttpServlet {


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
             int IdDocente =Integer.parseInt(request.getParameter("IdDocente"));
             ArrayList id =(ArrayList)MDocentes.getMateriaDocente(IdDocente).getIDMATERIADOCENTE();        
             out.print(id.size());
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
            int IdDocente =Integer.parseInt(request.getParameter("IdDocente"));
            
            ArrayList Grado = (ArrayList)MDocentes.getMateriaDocente(IdDocente).getGRADO();
            ArrayList Seccion = (ArrayList)MDocentes.getMateriaDocente(IdDocente).getSECCION();
            ArrayList Materia = (ArrayList)MDocentes.getMateriaDocente(IdDocente).getNOMBREMATERIA();
            ArrayList id =(ArrayList)MDocentes.getMateriaDocente(IdDocente).getIDMATERIADOCENTE();
            String Result = "";
            
            for (int i = inicio; i < fin; i++) {
                Result +=
                    "<tr>"
                    + "<td>"+id.get(i)+"</td>"
                    + "<td>"+Grado.get(i)+"</td>"
                    + "<td>"+Seccion.get(i)+"</td>"
                    + "<td>"+Materia.get(i)+"</td>"
                    + "<td><button type=\"button\" class=\"btn btn-info btn-fill pull-right \"  onclick=\"deleteMateriaDocente('"+id.get(i)+"')\">Borrar</button></td>"
                    + "</tr>";
            }
            out.print(Result);
        
        }
        
    }


}
