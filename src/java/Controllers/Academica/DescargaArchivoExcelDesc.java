/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Academica;

import Models.Academica.MAcademica;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DescargaArchivoExcelDesc extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            try {        
            int IdMateriaDocente = Integer.parseInt(request.getParameter("ID"));
            String File_Path=MAcademica.getFilePathExcel(25);
            
            File fileToDownload = new File(File_Path);
                try {
                    FileInputStream fileInputStream = new FileInputStream(fileToDownload);
                    ServletOutputStream out = response.getOutputStream();   
                    String mimeType =  new MimetypesFileTypeMap().getContentType(File_Path); 

                    response.setContentType(mimeType); 
                    response.setContentLength(fileInputStream.available());
                    response.setHeader( "Content-Disposition", "attachment; filename=\""
                      + fileToDownload.getName() + "\"" );

                    int c;
                    while((c=fileInputStream.read()) != -1){
                     out.write(c);
                    }
                    out.flush();
                    out.close();
                    fileInputStream.close();
                } catch (FileNotFoundException e) {
                }
            

            
          } catch (IOException e) {
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
