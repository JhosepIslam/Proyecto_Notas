/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Academica;

import service.Academicos;

/**
 *
 * @author LENOVO
 */
public class MAcademica {

    public static Academicos academicoGetMateriasConNotas() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.academicoGetMateriasConNotas();
    }

    public static Academicos academicoGetMateriasConNotasRechazada() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.academicoGetMateriasConNotasRechazada();
    }

    public static Academicos academicoGetMateriasConNotasRevision() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.academicoGetMateriasConNotasRevision();
    }

    public static Academicos academicoGetMateriasSinNotas() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.academicoGetMateriasSinNotas();
    }

    public static Academicos academicoGetMateriasConNotasEXCEL() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.academicoGetMateriasConNotasEXCEL();
    }

    public static Academicos academicoGetMateriasConNotasRechazadaEXCEL() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.academicoGetMateriasConNotasRechazadaEXCEL();
    }

    public static Academicos academicoGetMateriasConNotasRevisionEXCEL() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.academicoGetMateriasConNotasRevisionEXCEL();
    }

    public static Academicos academicoAprobarNotasExcel(int idMateriaDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.academicoAprobarNotasExcel(idMateriaDocente);
    }

    public static Academicos academicoRechazarNotasExcel(int idMateriaDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.academicoRechazarNotasExcel(idMateriaDocente);
    }

   
    
}
