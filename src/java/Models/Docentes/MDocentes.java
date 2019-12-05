/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Docentes;

import service.Docente;
import service.Evaluaciones;
import service.Grados;

import service.Secciones;

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

  public static Secciones getSeccionesByDocente(int idDocente, int idGrado) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getSeccionesByDocente(idDocente, idGrado);
    }

    public static Grados getGradosByDocente(int idDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getGradosByDocente(idDocente);
    }

    public static Docente getIdDocente(java.lang.String usuario) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getIdDocente(usuario);
    }

    public static Docente getMisSecciones(int idDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getMisSecciones(idDocente);
    }

    public static Docente getSeccionesSinNotas(int idDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getSeccionesSinNotas(idDocente);
    }

    public static Evaluaciones evaluaciondeHoy() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.evaluaciondeHoy();
    }

    public static Docente getSeccionesConNotas(int idDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getSeccionesConNotas(idDocente);
    }

    public static Docente getSeccionesConNotasRevision(int idDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getSeccionesConNotasRevision(idDocente);
    }

    public static Docente getSeccionesConNotasRechazado(int idDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getSeccionesConNotasRechazado(idDocente);
    }
    
       
    
}
