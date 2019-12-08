/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Alumnos;

import Models.Alumnos.MAlumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetMisNotasAlumnos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
                   HttpSession session = request.getSession();
                   int IdAlumno =Integer.parseInt(session.getAttribute("IdAlumno").toString());
                   ArrayList Evaluaciones = (ArrayList) MAlumnos.alumnosgetMisEvaluaciones().getIDFECHAEVALUACION();
                   int IdSeccion = MAlumnos.alumnosgetMiSeccion(IdAlumno);
                   ArrayList IdMaterias =(ArrayList)MAlumnos.alumnosGetMisMaterias(IdSeccion).getIDMATERIA();
                   ArrayList Materias =(ArrayList)MAlumnos.alumnosGetMisMaterias(IdSeccion).getNOMBREMATERIA();
                   String Result ="";
                   for (int i = 0; i < IdMaterias.size(); i++) {
                       Result +="<tr>";
                       Result +="<td>"+Materias.get(i)+"</td>";                                       
                       for (int j = 0; j < Evaluaciones.size(); j++) {
                           int IdMateria = Integer.parseInt(IdMaterias.get(i).toString());
                           double nota = 0;
                           ArrayList NotaA = (ArrayList)MAlumnos.alumnosgetMisNotas(IdAlumno, IdMateria, Integer.parseInt(Evaluaciones.get(j).toString())).getNOTA();
                           if (NotaA.isEmpty()) {                               
                               Result +="<td>"+0+"</td>";
                           }else{
                               Result +="<td>"+NotaA.get(0)+"</td>";                                       
                           }
                                   
                       }
                       Result +="</tr>";                                                              
            }
                   out.print(Result);
                   

            
            
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
        processRequest(request, response);
    }


}
