/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Alumnos;

import service.Alumno;
import service.Alumnos;

public class MAlumnos {

    public static Alumno createAlumno(java.lang.String nie, java.lang.String nombre, java.lang.String apellido, java.lang.String fechaMatricula, int idSeccion, java.lang.String password) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.createAlumno(nie, nombre, apellido, fechaMatricula, idSeccion, password);
    }

    public static Alumnos listAlumnosfromSeccion(int idSeccion) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.listAlumnosfromSeccion(idSeccion);
    }

    public static Alumnos listAlumnosNotas(int idMateriaDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.listAlumnosNotas(idMateriaDocente);
    }

    
    
    //notas

   

    public static Alumnos alumnosgetMiID(java.lang.String usuario) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.alumnosgetMiID(usuario);
    }

    public static Alumnos alumnosgetMisEvaluaciones() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.alumnosgetMisEvaluaciones();
    }

    public static Alumnos alumnosgetMisNotas(int idAlumno, int idMateria, int idEvaluacion) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.alumnosgetMisNotas(idAlumno, idMateria, idEvaluacion);
    }

    public static Alumnos alumnosGetMisMaterias(int idSeccion) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.alumnosGetMisMaterias(idSeccion);
    }

    public static int alumnosgetMiSeccion(int idAlumno) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.alumnosgetMiSeccion(idAlumno);
    }
    
    
    
            
            
    
        
}
