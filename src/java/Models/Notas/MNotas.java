
package Models.Notas;

import service.Notas;

public class MNotas {

    public static Notas subirNotasRevision(int idMateriaDocente, java.lang.String filePath) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.subirNotasRevision(idMateriaDocente, filePath);
    }

    public static Notas cancelarNotasRevision(int idMateriaDocente) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.cancelarNotasRevision(idMateriaDocente);
    }
    
    
    
}
