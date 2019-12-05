/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Docentes.MDocentes;
import Models.MLogin;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true); 
            /* TODO output your page here. You may use following sample code. */
           String Usuario = request.getParameter("name");
           String Pass = request.getParameter("pass");
           
           
            
            int nivel = MLogin.login(Usuario, Pass);
            Boolean Login;
           
            if (nivel !=0) {
                Login=true;
                session.setAttribute("LoginFail", Login);
                session.setAttribute("Nivel", nivel);
                switch(nivel){
                    case 1: 
                        response.sendRedirect("Admin/");
                        break;
                    case 2:
                        response.sendRedirect("Academico/");
                        break;
                    case 3:
                        response.sendRedirect("Docente/");
                        ArrayList ID =(ArrayList) MDocentes.getIdDocente(Usuario).getIDDOCENTE();
                        int IdDocente = Integer.parseInt(ID.get(0).toString());
                        session.setAttribute("IdDocente", IdDocente);
                        break;                        
                    case 5:
                        response.sendRedirect("Estudiante/");
                        break;
                    default:
                         Login=false;
                        session.setAttribute("LoginFail", Login);
                        response.sendRedirect("index.jsp");
                        break;
                }
                
            }else{
                 Login=false;
                session.setAttribute("LoginFail", Login);
                response.sendRedirect("index.jsp");
                

            }
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
