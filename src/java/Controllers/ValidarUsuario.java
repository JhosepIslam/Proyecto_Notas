/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;


import javax.swing.JApplet;

/**
 *
 * @author LENOVO
 */
public class ValidarUsuario extends JApplet{
    
    public static boolean validacion(String Usuario){    
        
        return Models.MValidarUsuario.getUsuarioIfExits(Usuario);
    }
    
}
