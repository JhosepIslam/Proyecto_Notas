
package Models.Grados;

import service.Grados;


public class MGrados {

    public static Grados getListGradosWithSecciones() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.getListGradosWithSecciones();
    }
  
    
    
    
}
