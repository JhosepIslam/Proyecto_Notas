
package Controllers.Docentes;

import Models.Notas.MNotas;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
public class RecibirArchivo extends HttpServlet {

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
        try {
            String nombre = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("idDoceM"));
             Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                InputStream fileContent = filePart.getInputStream();
                
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();

                int nRead;
                byte[] data = new byte[16384];

                while ((nRead = fileContent.read(data, 0, data.length)) != -1) {
                  buffer.write(data, 0, nRead);
                }
                
                String finalPath = "C:\\Users\\LENOVO\\Documents\\Archivos\\"+nombre+"-"+id+".xlsx";
                       byte[] encoded = buffer.toByteArray();
                       Files.write(Paths.get(finalPath), encoded);
                       
                       MNotas.subirNotasRevision(id, finalPath);
                       
                      response.sendRedirect("/Notas/Docente/IngresarNotas.jsp");
        } catch (IOException | ServletException e) {
        }
       
    }


}
