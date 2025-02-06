/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
/**
 *
 * @author MeD.aLi
 */
public class DatabaseConnection {
//    private static final String URL = "jdbc:mysql://localhost:3306/candidats";
//    private static final String USER = "root";
//    private static final String PASSWORD = "";
//    public static Connection connect() {
//        try {
//            Class.forName("com.mysql.jdbc.Driver"); // Chargement du driver MySQL
//            return DriverManager.getConnection(URL, USER, PASSWORD);
//        } catch (ClassNotFoundException e) {
//            System.out.println("Driver MySQL non trouvé !");
//            e.printStackTrace();
//        } catch (SQLException e) {
//            System.out.println("Échec de la connexion !");
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//    public static void main(String[] args) {
//       
//
//        Connection con = connect();
//        if (con != null) {
//            System.out.println("Connexion réussie !");
//        } else {
//            System.out.println("Connexion échouée !");
//        }
//    }
    
       public static String path;
       Connection conn=null;
       
    public static Connection Conexion(){
       try {
    	 //Chargement du pilote JDBC pour MYSQL puis creation de la connection
    	   //DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    	// ou bien 
          Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/candidats","root","");
				if (conn!=null)
	System.out.println("Connexion à la base de données a été établie avec succès");
				 else 
				System.out.println("Problème de connexion à la base");
						
       return conn;
       
       }catch(Exception e) {
           System.out.println("--> SQLException : " + e) ;
           
       return null;
       }
    }
}

 
    
    
