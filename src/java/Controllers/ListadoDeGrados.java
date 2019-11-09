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
            String Json = MGetListGrados.getListGrados();
            
            JSONObject jsonObj = new JSONObject(Json);
            JSONArray obtener = jsonObj.getJSONArray("Table");
            int length =  obtener.length();
            
            for (int i = 0; i < length; i++)
            {
                JSONObject v = obtener.getJSONObject(i);                
          
                int ID =v.getInt("ID_GRADO");
                String grado =v.getString("GRADO");
                int secciones =v.getInt("SECCIONES");

                if (!grado.isEmpty()){
                    Grados.add(grado);
                    ID_Grado.add(ID);
                    Secciones.add(secciones);

                }
              

            }
            
    }catch(JSONException ex){}
    }

    public ArrayList getID_Grado() {
        return ID_Grado;
    }

    public void setID_Grado(ArrayList ID_Grado) {
        this.ID_Grado = ID_Grado;
    }

    public ArrayList getGrados() {
        return Grados;
    }

    public void setGrados(ArrayList Grados) {
        this.Grados = Grados;
    }

    public ArrayList getSecciones() {
        return Secciones;
    }

    public void setSecciones(ArrayList Secciones) {
        this.Secciones = Secciones;
    }

}
