/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.MGetGrados;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;

import org.json.JSONObject;

/**
 *
 * @author LENOVO
 */
public class GetGrados {
    private ArrayList Grado = new ArrayList();
    private ArrayList Id_Grado = new ArrayList();

    public ArrayList getGrado() {
        return Grado;
    }
    
    public int size(){
        return Id_Grado.size();
    }

    public void setGrado(ArrayList Grado) {
        this.Grado = Grado;
    }

    public ArrayList getId_Grado() {
        return Id_Grado;
    }

    public void setId_Grado(ArrayList Id_Grado) {
        this.Id_Grado = Id_Grado;
    }
    
    
    
    public GetGrados(){
        
        String Json = MGetGrados.getGrados();
        
        try {
            JSONObject jsonObj = new JSONObject(Json);
            
            JSONArray obtener = jsonObj.getJSONArray("Table");
            int length = obtener.length();
            
            for (int i = 0; i < length; i++) {
                JSONObject v = obtener.getJSONObject(i);
                
                int ID = v.getInt("ID_GRADO");
                String grado = v.getString("GRADO");
                
                if (!grado.isEmpty()) {
                    Id_Grado.add(ID);
                    Grado.add(grado);
                }
                
                
            }
            
        } catch (JSONException ex) {
            Logger.getLogger(GetGrados.class.getName()).log(Level.SEVERE, null, ex);
        }
                
                
        
    }
    
    
    
    
    
}
