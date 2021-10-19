
package DAO;

import Negocio.Empleado;
import ConexionDB.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EmpleadoDAO {

    public Empleado consultarEmpleado(String email, String password) {
        Empleado emp = new Empleado();
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from empleado where Email=? && Password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            emp.setEmail("false");
            while (rs.next()) {                
                emp.setCodEmpleado(rs.getInt(1));
                emp.setCodArea(rs.getInt(2));
                emp.setNombre(rs.getString(3));
                emp.setApellidos(rs.getString(4));
                emp.setDNI(rs.getString(5));
                emp.setEmail(rs.getString(6));
                emp.setCelular(rs.getString(8));
                emp.setDireccion(rs.getString(9));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return emp;
    }
    public String  Alert(String icon, String titulo, String texto){
        String alert="";
        alert = "<script> Swal.fire({  icon: '"+icon+"',  title: '"+titulo+"',  text: '"+texto+"!' })</script>";
        return alert;
    }

    public ArrayList<Empleado> getListEmpleado() {
        ArrayList<Empleado> lista = new ArrayList<Empleado>();
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from view_empleado");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {                
                Empleado empleado = new Empleado();
                empleado.setCodEmpleado(rs.getInt(1));
                empleado.setNombre(rs.getString(2));
                empleado.setApellidos(rs.getString(3));
                empleado.setDNI(rs.getString(4));
                empleado.setEmail(rs.getString(5));
                empleado.setCelular(rs.getString(6));
                empleado.setArea(rs.getString(7));
                empleado.setDireccion(rs.getString(8));
                
                lista.add(empleado);
            }
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return lista;
    }

    public void agregarEmpleado(Empleado empleado) {
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Insert into empleado (CodArea,Nombres,Apellidos,DNI,Email,Password,Celular,Direccion)"
                    + " values (?,?,?,?,?,?,?,?)");
            ps.setInt(1, empleado.getCodArea());
            ps.setString(2, empleado.getNombre());
            ps.setString(3, empleado.getApellidos());
            ps.setString(4, empleado.getDNI());
            ps.setString(5, empleado.getDNI()+"@agroalexis.com");
            ps.setString(6, empleado.getDNI());
            ps.setString(7, empleado.getCelular());
            ps.setString(8, empleado.getDireccion());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void editarEmpleado(Empleado empleado) {
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Update empleado set Nombres=?,Apellidos=?,DNI=?,Celular=?,Direccion=?,CodArea=?,Email=?,Password=? where CodEmpleado=?");
            ps.setString(1, empleado.getNombre());
            ps.setString(2, empleado.getApellidos());
            ps.setString(3, empleado.getDNI());
            ps.setString(4, empleado.getCelular());
            ps.setString(5, empleado.getDireccion());
            ps.setInt(6, empleado.getCodArea());
            ps.setString(7, empleado.getDNI()+"@agroalexis.com");
            ps.setString(8, empleado.getDNI());
            ps.setInt(9, empleado.getCodEmpleado());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void eliminarEmpleado(Empleado empleado) {
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Delete from empleado where CodEmpleado=?");
            ps.setInt(1, empleado.getCodEmpleado());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean verificarColaborador(Empleado empleado) {
        boolean verificar = true;
            
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Select * from empleado where DNI=?");
            ps.setString(1, empleado.getDNI());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                verificar = false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return verificar;
    }
    
}
