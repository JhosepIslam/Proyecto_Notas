
package Controllers.Docentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GetListAlumnosNotas extends HttpServlet {


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
           
        
            int IdGradoDocente = Integer.parseInt(request.getParameter("id"));
        
            ArrayList Numero_id = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdGradoDocente).getNUMEROID();
            ArrayList Nombre = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdGradoDocente).getNOMBRE();
            ArrayList Apellido = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdGradoDocente).getAPELLIDO();
            ArrayList Grado = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdGradoDocente).getGRADO();
            ArrayList Id_Alumno = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdGradoDocente).getIDALUMNO();
            ArrayList Seccion = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdGradoDocente).getSECCION();

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
                            
                            + "<td>  <input type=\"number\" step=\"any\" id=\"txtNotas\" name=\"A"+num+"\"  max=\"10\" min=\"0\" required=\"Obligatorio\">"
                            + "<input type=\"hidden\" id=\"IdAlumno\" name=\"B"+num+"\" value= '"+Id_Alumno.get(i)+"' >"
                            + "</td>" 
                            + "</tr>";
                        }
            
            out.print(Resp);
        }
       
    }


}
