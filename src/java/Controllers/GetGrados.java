/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.MGetGrados;
import java.util.ArrayList;

public class GetGrados {
    private ArrayList Grado = new ArrayList();
    private ArrayList Id_Grado = new ArrayList();

    public ArrayList getGrado() {
        return Grado;
    }
    
    public int size(){
        return Id_Grado.size();
    }

  

    public ArrayList getId_Grado() {
        return Id_Grado;
    }

   
    
    
    public GetGrados(){
        try {
             Id_Grado = (ArrayList)MGetGrados.getGrados().getID();
             Grado = (ArrayList)MGetGrados.getGrados().getGRADO();            
             
        } catch (Exception e) {
        }
        
       
    }
    
    
    
    
    
}
