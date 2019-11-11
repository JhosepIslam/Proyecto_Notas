/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.MGetListGrados;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author LENOVO
 */
public class ListadoDeGrados extends HttpServlet {
    private ArrayList ID_Grado = new ArrayList();
    private ArrayList Grados = new ArrayList();
    private ArrayList Secciones = new ArrayList();
    
    
    
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
        processRequest(request, response);
    }

    
    public ListadoDeGrados(){
        try {
            ID_Grado = (ArrayList) MGetListGrados.getListGradosInfo().getID();
            Grados = (ArrayList) MGetListGrados.getListGradosInfo().getGRADO();
            Secciones = (ArrayList) MGetListGrados.getListGradosInfo().getSECCIONES();
            
    }catch(Exception ex){}
    }

    public ArrayList getID_Grado() {
        return ID_Grado;
    } 

    public ArrayList getGrados() {
        return Grados;
    }   

    public ArrayList getSecciones() {
        return Secciones;
    }

  

}
