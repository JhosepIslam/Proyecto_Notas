
package Controllers.Alumnos;

import Models.Alumnos.MAlumnos;
import java.util.ArrayList;


public class GetMisNotas {
    
    public ArrayList getEvaluaciones(){
        ArrayList Eval = (ArrayList) MAlumnos.alumnosgetMisEvaluaciones().getNUMEVALUACION();
        return  Eval;
    }
   
    
    
}
