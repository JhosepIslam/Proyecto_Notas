/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import java.util.ArrayList;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author LENOVO
 */
public class ListNiveles {
    private final ArrayList Niveles = new ArrayList();
    private final ArrayList IdNiveles = new ArrayList();


    public ArrayList getNiveles() {
        return Niveles;
    }

    public ArrayList getIdNiveles() {
        return IdNiveles;
    }
    
    
    
    

   /* public ListNiveles() {
        {
        String Json = Models.MGet_Niveles.getNiveles();
        JsonParser parser = new JsonParser();  
        JsonArray gsonArray = parser.parse(Json).getAsJsonArray();
        
            
            
            
            try {
                
                for(JsonElement obj : gsonArray){
                    JsonObject gsonObj = obj.getAsJsonObject();
                    JsonArray IdNivelesJSON = gsonObj.get("id_nivel").getAsJsonArray();            
                    for(JsonElement ID : IdNivelesJSON){
                        IdNiveles.add(ID.getAsString());
                    }            
                    JsonArray NivelesJSON = gsonObj.get("nivel").getAsJsonArray();
                    for(JsonElement Nivel : NivelesJSON){
                        Niveles.add(Nivel.getAsString());                
                    }
                }
            } catch (Exception e) {
              for(JsonElement obj : gsonArray){
                JsonObject gsonObj = obj.getAsJsonObject();
                int ID = gsonObj.get("id_nivel").getAsInt();
                String Nivel = gsonObj.get("nivel").getAsString();
                IdNiveles.add(ID);
                Niveles.add(Nivel);
              }
            }
            
        }
    }
    */
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
            String ada= ex.getMessage();
            System.out.println("");
            
        }
        
    }
    
    
}
    
   
    
    
    

