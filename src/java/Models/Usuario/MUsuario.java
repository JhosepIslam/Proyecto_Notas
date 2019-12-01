/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Usuario;

import service.Usuario;

public class MUsuario {

    public static Usuario createUser(java.lang.String usuario, java.lang.String pass, java.lang.String nombre, java.lang.String apellido, java.lang.String correo, int nivel) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.createUser(usuario, pass, nombre, apellido, correo, nivel);
    }
     
}
