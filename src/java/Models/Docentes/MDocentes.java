/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Docentes;

import service.Docente;
import service.Materias;

/**
 *
 * @author LENOVO
 */
public class MDocentes {

    public static Docente getListDocentes() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getListDocentes();
    }

    public static Docente deleteDocente(int idDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.deleteDocente(idDocente);
    }

    public static Docente getMateriaDocente(int idDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getMateriaDocente(idDocente);
    }

 
    
    
    
    
    
    
    
    
}
