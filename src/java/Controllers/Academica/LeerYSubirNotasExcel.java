
package Controllers.Academica;

import Models.Academica.MAcademica;
import Models.Notas.MNotas;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class LeerYSubirNotasExcel {
    
    public void SubirNotas(int IdMateriaDocente) throws IOException{
        String File_Path = MAcademica.getFilePathExcel(IdMateriaDocente);
        
        try {
            FileInputStream fileInputStream = new FileInputStream(new File(File_Path));
            XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);
            XSSFSheet sheet = workbook.getSheetAt(0);
            
            int RowsNumber = sheet.getLastRowNum();
            ArrayList IdAlumnos = new ArrayList();
            ArrayList Notas = new ArrayList();
            for (int i = 0; i < RowsNumber; i++) {
                Row row= sheet.getRow(i+1);
                    int idAlumno = (int) row.getCell(0).getNumericCellValue();
                    double nota =(int) row.getCell(4).getNumericCellValue();
                    
                    IdAlumnos.add(idAlumno);
                    Notas.add(nota);
            }
            for (int i = 0; i < IdAlumnos.size(); i++) {
                int IdAlumno =Integer.parseInt(IdAlumnos.get(i).toString());
                float Nota =Float.parseFloat(Notas.get(i).toString());
                
                MNotas.subirNotasExcelAceptadas(IdMateriaDocente, IdAlumno, Nota);
            }
        } catch (FileNotFoundException e) {
        }
        
    }
    
}
