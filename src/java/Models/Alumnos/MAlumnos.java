/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Alumnos;

import service.Alumno;

/**
 *
 * @author LENOVO
 */
public class MAlumnos {

    public static Alumno createAlumno(java.lang.String nie, java.lang.String nombre, java.lang.String apellido, java.lang.String fechaMatricula, int idSeccion, java.lang.String password) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.createAlumno(nie, nombre, apellido, fechaMatricula, idSeccion, password);
    }

    
        
}
