
package Controllers.Docentes;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EnviaArchivo extends HttpServlet {


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
     
           
            String nombre = request.getParameter("nombre");
            nombre +=".xlsx";
            //Byte file = request.getParameter("bytesArray");
           
                 byte[] CDRIVES = request.getParameter("bytesArray[]").getBytes();
                 
                    
                   try {
                   String finalPath = "C:\\Users\\LENOVO\\Downloads\\Proyecto\\Proyecto\\src\\"+nombre;
                       byte[] encoded = CDRIVES;
                       Files.write(Paths.get(finalPath), encoded);
                   } catch (IOException e) {
                        nombre = request.getParameter("nombre");
                   }

         
           
            
            

          
            
            
        
    }

}
