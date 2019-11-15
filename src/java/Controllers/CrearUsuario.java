/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Usuario.MUsuario;
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
public class CrearUsuario extends HttpServlet {

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
            
            String Nombre_Usuario = request.getParameter("txtUser");
            String Correo= request.getParameter("txtEmail");
            String Nombre= request.getParameter("txtNombre");
            String Apellido= request.getParameter("txtApellido");
            String Password= request.getParameter("txtPass");
            int Nivel= Integer.parseInt(request.getParameter("dnivel"));
            
            boolean resp=MUsuario.createUser(Nombre_Usuario, Password, Nombre, Apellido, Correo, Nivel).isRESULT();
            if (resp) {
               
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Insertador Existosamente!!');");
                out.println("location='/Notas/Gestiones/CrearUsuarios.jsp';");
                out.println("</script>");
                    
            }else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Error al Tratar de Crear El Usuario');");
                out.println("location='/Notas/Gestiones/CrearUsuarios.jsp';");
                out.println("</script>");
            }
            
            //response.sendRedirect("/Notas/Gestiones/CrearUsuarios.jsp");
                
            
           
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
