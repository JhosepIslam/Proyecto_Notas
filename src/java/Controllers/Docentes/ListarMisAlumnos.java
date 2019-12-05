/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Docentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarMisAlumnos extends HttpServlet {

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
             int IdSeccion = Integer.parseInt(request.getParameter("IdSeccion"));
        
            ArrayList Numero_id = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosfromSeccion(IdSeccion).getNUMEROID();
            ArrayList Nombre = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosfromSeccion(IdSeccion).getNOMBRE();
            ArrayList Apellido = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosfromSeccion(IdSeccion).getAPELLIDO();
            ArrayList Grado = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosfromSeccion(IdSeccion).getGRADO();

            String Resp = "";
            for (int i = 0; i < Numero_id.size(); i++) {
                int num = i+1;
                Resp +=   "<tr> "
                            + "<td>"+num+"</td>"                        
                            + "<td>"+Numero_id.get(i)
                            + "</td>"
                            + "<td>"+Apellido.get(i)
                            + "</td>"
                            + "<td>"+Nombre.get(i)
                            + "</td>"             
                            + "<td>"+Grado.get(i)
                            + "</td>"
                            + "</tr>";
                        }
            
            out.print(Resp);
     
        }
       
       
        
        
    }


}
