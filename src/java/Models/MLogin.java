/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;




/**
 *
 * @author LENOVO
 */
public class MLogin {
  



    public static int login(java.lang.String arg0, java.lang.String arg1) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.login(arg0, arg1);
    }



 

  


    
}
