
package Controllers.Academica;

import Models.Academica.MAcademica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class VerNotasManual extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
           
        
            int IdGradoDocente = Integer.parseInt(request.getParameter("id"));
        
            ArrayList Numero_id = (ArrayList)MAcademica.listAlumnosNotasRevision(IdGradoDocente).getNUMEROID();
            ArrayList Nombre = (ArrayList)MAcademica.listAlumnosNotasRevision(IdGradoDocente).getNOMBRE();
            ArrayList Apellido = (ArrayList)MAcademica.listAlumnosNotasRevision(IdGradoDocente).getAPELLIDO();
            ArrayList Grado = (ArrayList)MAcademica.listAlumnosNotasRevision(IdGradoDocente).getGRADO();
            
            ArrayList Seccion = (ArrayList)MAcademica.listAlumnosNotasRevision(IdGradoDocente).getSECCION();
            
             ArrayList Materia = (ArrayList)MAcademica.listAlumnosNotasRevision(IdGradoDocente).getNOMBREMATERIA();
            ArrayList CodigoMateria = (ArrayList)MAcademica.listAlumnosNotasRevision(IdGradoDocente).getCODIGOMATERIA();
            ArrayList Nota = (ArrayList)MAcademica.listAlumnosNotasRevision(IdGradoDocente).getNOTA();

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
                             + "<td>"+Seccion.get(i)
                            + "</td>"    
                            + "<td>"+CodigoMateria.get(i)+"-"+Materia.get(i)
                            + "</td>"
                             + "<td>"+Nota.get(i)
                            + "</td>"                            
                            + "</tr>";
                        }
            
            out.print(Resp);
        }
        
        
        

    }



}
