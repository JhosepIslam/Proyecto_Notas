
package Controllers.Docentes;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class GenerarPlantillas {

   
    
    
    public String GenerarExcel(int IdMateriaDocente){
        String Ruta=null;
        String NombreArch=null;
        
         Workbook book = new XSSFWorkbook();
        Sheet sheet = book.createSheet("Notas");
/*
        Row row = sheet.createRow(0);
        row.createCell(0).setCellValue("Hola Mundo");
        row.createCell(1).setCellValue(7.5);
        row.createCell(2).setCellValue(true);

        Cell celda = row.createCell(3);
        celda.setCellFormula(String.format("1+1", ""));

        Row rowUno = sheet.createRow(1);
        rowUno.createCell(0).setCellValue(7);
        rowUno.createCell(1).setCellValue(8);

        Cell celdados = rowUno.createCell(2);
        celdados.setCellFormula(String.format("A%d+B%d", 2, 2));
        
        */
             ArrayList Numero_id = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdMateriaDocente).getNUMEROID();
              ArrayList Nombre = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdMateriaDocente).getNOMBRE();
             ArrayList Apellido = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdMateriaDocente).getAPELLIDO();
             ArrayList Grado = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdMateriaDocente).getGRADO();
             ArrayList Id_Alumno = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdMateriaDocente).getIDALUMNO();
             ArrayList Seccion = (ArrayList)Models.Alumnos.MAlumnos.listAlumnosNotas(IdMateriaDocente).getSECCION();
             
             Row row0= sheet.createRow(0);            
                    row0.createCell(0).setCellValue("ID");
                    row0.createCell(1).setCellValue("NIE");
                    row0.createCell(2).setCellValue("Apellido");
                    row0.createCell(3).setCellValue("Nombre");
                    row0.createCell(4).setCellValue("Notas");
        for (int i = 0; i < Numero_id.size(); i++) {
            Row row = sheet.createRow(i+1);
            
                    row.createCell(0).setCellValue(Integer.parseInt(Id_Alumno.get(i).toString()));
                    row.createCell(1).setCellValue(Numero_id.get(i).toString());
                    row.createCell(2).setCellValue(Apellido.get(i).toString());
                    row.createCell(3).setCellValue(Nombre.get(i).toString());
                    row.createCell(4).setCellValue(0);
                   
            
        }        

        try {
          
            Ruta = "C:\\Users\\LENOVO\\Documents\\Archivos\\Plantillas\\Notas_Grado_"+Grado.get(0)+"_Seccion_"+Seccion.get(0)+".xlsx";
            FileOutputStream fileout = new FileOutputStream(Ruta);
            book.write(fileout);
            fileout.close();

        } catch (FileNotFoundException ex) {
           
        } catch (IOException ex) {
           
        }
        
        return Ruta;
    }
    
}
