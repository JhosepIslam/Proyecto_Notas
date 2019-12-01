/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ListNiveles {
    private final ArrayList Niveles = new ArrayList();
    private final ArrayList IdNiveles = new ArrayList();


    public ArrayList getNiveles() {
        return Niveles;
    }

    public ArrayList getIdNiveles() {
        return IdNiveles;
    }
    

    public ListNiveles(){
        
        try {
            String Json = Models.MGet_Niveles.getNiveles();
            
            JSONObject jsonObj = new JSONObject(Json);
            JSONArray obtener = jsonObj.getJSONArray("Table");
            int length =  obtener.length();
            
            for (int i = 0; i < length; i++)
            {
                JSONObject v = obtener.getJSONObject(i);                
          
                int ID =v.getInt("ID_NIVEL");
                String Nivel =v.getString("NIVEL");
               

                if (!Nivel.isEmpty()){
                    Niveles.add(Nivel);
                    IdNiveles.add(ID);

                }
              

            }
            
            
        } catch (JSONException ex) {           
            
        }
        
    }
    
    
}
    
   
    
    
    

