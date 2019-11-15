/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Materias;

import service.Materias;

/**
 *
 * @author LENOVO
 */
public class MMaterias {

    public static Materias listMaterias() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.listMaterias();
    }

    public static Materias deleteMateria(int idMateria) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.deleteMateria(idMateria);
    }

    public static Materias createMateria(java.lang.String codigo, java.lang.String nombre) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.createMateria(codigo, nombre);
    }
    
    
    
    
}
