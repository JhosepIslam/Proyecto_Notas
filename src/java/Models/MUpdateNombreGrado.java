/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import service.Grados;

/**
 *
 * @author LENOVO
 */
public class MUpdateNombreGrado {

    public static Grados updateNombreGrado(int ID, java.lang.String Grado) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.updateNombreGrado(ID, Grado);
    }
    
    
    
}
