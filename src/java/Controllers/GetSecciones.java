/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.MGetGrados;
import Models.MGetSecciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class GetSecciones extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ArrayList Seccion = new ArrayList();
    ArrayList id = new ArrayList();
            
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Seccion.clear();
        id.clear();
        try (PrintWriter out = response.getWriter()) {
            int idGrado =Integer.parseInt(request.getParameter("id_grado"));
            getSecciones(idGrado);
            String resultado = "<option value= 0>SELECCIONE</option>" ;
            for (int i = 0; i < id.size(); i++) {
                resultado += "<option value="+id.get(i)+">"+Seccion.get(i)+"</option>";
            }
            out.print(resultado);
            
        }
    }
    
    private void getSecciones(int id_grado){
        String Json = MGetSecciones.getSecciones(id_grado);
        
        try {
            JSONObject jsonObj = new JSONObject(Json);
            
            JSONArray obtener = jsonObj.getJSONArray("Table");
            int length = obtener.length();
            
            for (int i = 0; i < length; i++) {
                JSONObject v = obtener.getJSONObject(i);
                
                int ID = v.getInt("ID_SECCION");
                String seccion = v.getString("SECCION");
                
                if (!seccion.isEmpty()) {
                    id.add(ID);
                    Seccion.add(seccion);
                }               
                
            }
            
        } catch (JSONException ex) {
            Logger.getLogger(GetGrados.class.getName()).log(Level.SEVERE, null, ex);
        }    
        
    
    }

}
