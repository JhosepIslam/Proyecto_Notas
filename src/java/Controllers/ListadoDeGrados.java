/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.MGetListGrados;
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
public class ListadoDeGrados extends HttpServlet {
    private ArrayList ID_Grado = new ArrayList();
    private ArrayList Grados = new ArrayList();
    private ArrayList Secciones = new ArrayList();
    
    
    
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
            
            ID_Grado = (ArrayList) MGetListGrados.getListGradosInfo().getID();
            Grados = (ArrayList) MGetListGrados.getListGradosInfo().getGRADO();
            Secciones = (ArrayList) MGetListGrados.getListGradosInfo().getSECCIONES();
            
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
                        + "<td>"+ID_Grado.get(i)
                        + "</td>"
                        + "<td>"+Grados.get(i)
                        + "</td>"
                        + "<td>"+Secciones.get(i)
                        + "</td>"
                        + "<td><button type=\"button\" class=\"btn btn-info btn-fill pull-right\" role=\"link\" onclick=\"getSecciones('"+ID_Grado.get(i)
                        + "','"+Grados.get(i)
                        + "')\">Ver Secciones</button></td>"
                        + "<td>"
                        + "<button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"getMateriasList('"+ID_Grado.get(i)+"')\" role=\"link\" >Ver Materias</button>"
                        + "</td>" 
                        + "<td>"
                        + "<button type=\"submit\" class=\"btn btn-info btn-fill pull-right\" onclick=\"eliminar('"+ID_Grado.get(i)+"')\" role=\"link\" >Eliminar</button>"
                        + "</td>"                         
                        + "</tr>";
            }
            out.print(Resp);
            
        }
    }

    public ArrayList getID_Grado() {
        ID_Grado = (ArrayList) MGetListGrados.getListGradosInfo().getID();       
             
        return ID_Grado;
    }
    
    

 
 
   

    
   
  

}
