
package ConexionDB;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    public static Connection getConnection() {

        Connection con = null;
        String cadena = "jdbc:mysql://localhost/agroinversiones?user=root&password=userrod";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(cadena);
            System.out.println("Conexión Establecida");
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }

        return con;

    }
    

    public static void main(String[] args) {
        Conexion.getConnection();
    }
}
