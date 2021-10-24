package DAO;

import ConexionDB.Conexion;
import Negocio.Cliente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ClienteDAO {

    public boolean validarCliente(Cliente cliente) {
        boolean verificar = true;

        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from cliente where Num_Documento=?");
            ps.setString(1, cliente.getNum_Documento());
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                verificar = false;
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return verificar;
    }

    public Cliente getCliente(Cliente cliente) {

        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from cliente where Num_Documento=?");
            ps.setString(1, cliente.getNum_Documento());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cliente.setCodCliente(rs.getInt(1));
                cliente.setNombre(rs.getString(2));
                cliente.setApellidos(rs.getString(3));
                cliente.setNum_Documento(rs.getString(4));
                cliente.setEmail(rs.getString(5));
                cliente.setDireccion(rs.getString(6));
                cliente.setTelefono(rs.getString(7));
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return cliente;
    }
    
    public Cliente getClienteCod(Cliente cliente) {

        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from cliente where CodCliente=?");
            ps.setInt(1, cliente.getCodCliente());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cliente.setCodCliente(rs.getInt(1));
                cliente.setNombre(rs.getString(2));
                cliente.setApellidos(rs.getString(3));
                cliente.setNum_Documento(rs.getString(4));
                cliente.setEmail(rs.getString(5));
                cliente.setDireccion(rs.getString(6));
                cliente.setTelefono(rs.getString(7));
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return cliente;
    }

    public Cliente crearCliente(Cliente cliente) {
        String nombre = "", apellidos = "";
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("insert into cliente (Nombre, Apellidos, Num_Documento) values (?,?,?)");
            ps.setString(1, nombre);
            ps.setString(2, apellidos);
            ps.setString(3, cliente.getNum_Documento());
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }

        return getCliente(cliente);
    }

    public void actualizarCliente(Cliente cliente) {
        
        try {
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("update cliente set Nombre = ?, Apellidos = ?, Email = ?, Direccion = ?, Telefono = ? where CodCliente = ?");
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getApellidos());
            ps.setString(3, cliente.getEmail());
            ps.setString(4, cliente.getDireccion());
            ps.setString(5, cliente.getTelefono());
            ps.setInt(6, cliente.getCodCliente());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }


}
