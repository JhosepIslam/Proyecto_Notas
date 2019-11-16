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

    public static Materias validarCodigoMateria(java.lang.String codigo) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.validarCodigoMateria(codigo);
    }

    public static Materias listarMateriasGrados(int idGRADO) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.listarMateriasGrados(idGRADO);
    }

   

    public static Materias createMateriaGrado(int idMATERIA, int idGRADO) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.createMateriaGrado(idMATERIA, idGRADO);
    }

    public static Materias listMateriasNotInGrados(int idGRADO) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.listMateriasNotInGrados(idGRADO);
    }

    public static Materias deleteMateriaGrado(int idMATERIA, int idGRADO) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.deleteMateriaGrado(idMATERIA, idGRADO);
    }
    
    
    
    
    
    
}
