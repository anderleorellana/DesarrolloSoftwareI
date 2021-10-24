package DAO;

import ConexionDB.Conexion;
import Negocio.Cliente;
import Negocio.Orden;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

public class OrdenDAO {
    
    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public boolean validarOrden(Cliente cliente) {
        boolean verificar = true;
        
        try {
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from orden_pedido where CodCliente=?");
            ps.setInt(1, cliente.getCodCliente());
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                verificar = false;
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return verificar;
    }

    public Orden crearOrden(Orden orden) {
        
        try {
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("insert into orden_pedido (CodEmpleado, CodCliente, Fecha, Estado, Total) values (?,?,?,?,?)");
            ps.setInt(1, orden.getCodEmpleado());
            ps.setInt(2, orden.getCodCliente());
            String timeStamp = date.format(new Date());
            ps.setTimestamp(3, Timestamp.valueOf(timeStamp));
            ps.setString(4, "Carrito");
            ps.setDouble(5, 0);
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return getOrden(orden);
    }

    public Orden getOrden(Orden orden) {
        
        try {
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from orden_pedido where CodCliente=? and Estado='Carrito'");
            ps.setInt(1, orden.getCodCliente());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                orden.setCodPedido(rs.getInt(1));
                orden.setCodEmpleado(rs.getInt(2));
                orden.setCodCliente(rs.getInt(3));
                orden.setFecha(rs.getTimestamp(4));
                orden.setEstado(rs.getString(5));
                orden.setTotal(rs.getDouble(6));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return orden;
    }
    
    public void actualizarMontoOrden(Orden orden) {
        
        try {
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Update orden_pedido set Total=? where CodPedido=?");
            ps.setDouble(1, getMonto(orden.getCodPedido()));
            ps.setInt(2, orden.getCodPedido());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public double getMonto(int CodPedido){
        double monto = 0;
        
        try {
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select CodPedido, sum(Monto) from detalle_orden_pedido where CodPedido=?");
            ps.setInt(1, CodPedido);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                monto = rs.getDouble(2);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return  monto;
    }

    public void procesarPedido(Orden orden) {
        
        try {
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Update orden_pedido set Estado='Procesado', Fecha=? where CodPedido=?");
            String timeStamp = date.format(new Date());
            ps.setTimestamp(1, Timestamp.valueOf(timeStamp));
            ps.setInt(2, orden.getCodPedido());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }

    public ArrayList<Orden> getOrdenPendientes() {
        ArrayList<Orden> lista = new ArrayList<>();
        
        try {
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Select * from view_pendiente where Estado = 'Carrito'");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {                
                Orden orden = new Orden();
                
                orden.setCodPedido(rs.getInt(1));
                orden.setNum_Documento(rs.getString(2));
                orden.setFecha(rs.getTimestamp(3));
                orden.setEstado(rs.getString(4));
                orden.setTotal(rs.getDouble(5));
                orden.setCodCliente(rs.getInt(6));
                
                lista.add(orden);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return lista;
    }

    
}
