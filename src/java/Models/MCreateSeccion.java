/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import service.Secciones;

public class MCreateSeccion {

    public static Secciones createSeccion(int id, java.lang.String seccion) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.createSeccion(id, seccion);
    }
    
    
}
