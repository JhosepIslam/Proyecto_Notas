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
import javax.servlet.http.HttpSession;

public class GetSeccionesParaNotas extends HttpServlet {

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
            String evaluacion =  MDocentes.evaluaciondeHoy().getNUMEROEVALUACION().toString();
            String inicio = MDocentes.evaluaciondeHoy().getINICIO().toString();
            String fin = MDocentes.evaluaciondeHoy().getFIN().toString();
            
            out.print("Subir Notas para la Evaluacion: " +evaluacion +" Desde : "+inicio+" Hasta :"+fin );
        }
       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = (HttpSession)request.getSession();
            int IdDocente = Integer.parseInt(session.getAttribute("IdDocente").toString()); 
            ArrayList Id = (ArrayList) MDocentes.getSeccionesSinNotas(IdDocente).getIDMATERIADOCENTE();
            ArrayList Grado = (ArrayList) MDocentes.getSeccionesSinNotas(IdDocente).getGRADO();
            ArrayList Seccion = (ArrayList) MDocentes.getSeccionesSinNotas(IdDocente).getSECCION();
            ArrayList codigo = (ArrayList) MDocentes.getSeccionesSinNotas(IdDocente).getCODIGOMATERIA();
            ArrayList Materia = (ArrayList) MDocentes.getSeccionesSinNotas(IdDocente).getNOMBREMATERIA();
            
            String Resp = "";
            for (int i = 0; i < Grado.size(); i++) {
                
                Resp +=   "<tr> "
                            + "<td>"+Id.get(i)+"</td>"                        
                            + "<td>"+Grado.get(i)
                            + "</td>"
                            + "<td>"+Seccion.get(i)
                            + "</td>"
                            + "<td>"+codigo.get(i)+"-"+Materia.get(i)
                            + "</td>"
                            +"<td></td>"
                        
                            + "</tr>";
                        }
            
            out.print(Resp);
           
        }
       
    }


}
