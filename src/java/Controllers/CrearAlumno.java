/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Alumnos.MAlumnos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class CrearAlumno extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String NIE = request.getParameter("txtNie");
            String Nombre = request.getParameter("txtNombre");
            String Apellido = request.getParameter("txtApellido");
            String FechaMatricula = request.getParameter("txtfechaMatricula");
            int id_seccion =Integer.parseInt(request.getParameter("sSeccion"));
            String Password = request.getParameter("txtPass");
            boolean resp = MAlumnos.createAlumno(NIE, Nombre, Apellido, FechaMatricula, id_seccion,Password.trim()).isRESULT();
            if (resp) {
               
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Insertador Existosamente!!');");
                out.println("location='/Notas/Gestiones/CrearAlumno.jsp';");
                out.println("</script>");
                    
            }else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Error al Tratar de Crear El Alumno');");
                out.println("location='/Notas/Gestiones/CrearAlumno.jsp';");
                out.println("</script>");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
