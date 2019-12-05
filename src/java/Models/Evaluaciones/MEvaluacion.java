
package Models.Evaluaciones;

import service.Evaluaciones;



public class MEvaluacion {

    public static Evaluaciones validarEvaluacion(int numEval, java.lang.String inicio, java.lang.String fin) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.validarEvaluacion(numEval, inicio, fin);
    }

    public static Evaluaciones setEvaluacion(int numEval, java.lang.String inicio, java.lang.String fin) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.setEvaluacion(numEval, inicio, fin);
    }

    public static Evaluaciones listEvaluaciones() {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.listEvaluaciones();
    }

    public static Evaluaciones deleteEvaluacion(int idEval) {
        service.ServicioWeb_Service service = new service.ServicioWeb_Service();
        service.ServicioWeb port = service.getServicioWebPort();
        return port.deleteEvaluacion(idEval);
    }


  
  
}
