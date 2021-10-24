package DAO;

import ConexionDB.Conexion;
import Negocio.DetalleOrden;
import Negocio.Orden;
import Negocio.Producto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DetalleOrdenDAO {

    public ArrayList<DetalleOrden> getListDetalleOrden(Orden orden) {
        ArrayList<DetalleOrden> lista = new ArrayList<>();

        try {

            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from view_detalle_orden where CodPedido=?");
            ps.setInt(1, orden.getCodPedido());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DetalleOrden detord = new DetalleOrden();
                detord.setImagen(rs.getString(1));
                detord.setProducto(rs.getString(2));
                detord.setPrecio(rs.getDouble(3));
                detord.setCant(rs.getInt(4));
                detord.setMonto(rs.getDouble(5));
                detord.setStock(rs.getInt(6));
                detord.setCodDetallePedido(rs.getInt(7));
                detord.setCodPedido(rs.getInt(8));

                lista.add(detord);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return lista;
    }

    public void agregarDetalle(DetalleOrden detalleOrden) {

        try {

            Producto producto = new Producto();
            producto.setCodProducto(detalleOrden.getCodProducto());
            ProductoDAO proDAO = new ProductoDAO();
            proDAO.actualizarStock(producto, detalleOrden.getCant());

            if (existProduct(detalleOrden)) {

                detalleOrden.setCant(getCantidadDetalle(detalleOrden) + detalleOrden.getCant());
                detalleOrden.calcularMonto();

                PreparedStatement ps = Conexion.getConnection().prepareStatement("update detalle_orden_pedido set Cant = ?, Monto = ? where CodPedido=? and CodProducto=?");
                ps.setInt(1, detalleOrden.getCant());
                ps.setDouble(2, detalleOrden.getMonto());
                ps.setInt(3, detalleOrden.getCodPedido());
                ps.setInt(4, detalleOrden.getCodProducto());

                ps.executeUpdate();
            } else {

                PreparedStatement ps = Conexion.getConnection().prepareStatement("insert into detalle_orden_pedido (CodProducto, CodPedido, Cant, Monto) values (?,?,?,?)");
                ps.setInt(1, detalleOrden.getCodProducto());
                ps.setInt(2, detalleOrden.getCodPedido());
                ps.setInt(3, detalleOrden.getCant());
                ps.setDouble(4, detalleOrden.getMonto());

                ps.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    private boolean existProduct(DetalleOrden detalleOrden) {
        boolean exist = true;

        try {

            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from detalle_orden_pedido where CodPedido=? and CodProducto=?");
            ps.setInt(1, detalleOrden.getCodPedido());
            ps.setInt(2, detalleOrden.getCodProducto());
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                exist = false;
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return exist;
    }

    private int getCantidadDetalle(DetalleOrden detalleOrden) {
        int cant = 0;
        try {

            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from detalle_orden_pedido where CodPedido=? and CodProducto=?");
            ps.setInt(1, detalleOrden.getCodPedido());
            ps.setInt(2, detalleOrden.getCodProducto());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cant = rs.getInt("Cant");
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return cant;
    }

    public DetalleOrden getDetalleOrden(DetalleOrden detalleOrden) {

        try {

            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from detalle_orden_pedido where CodDetallePedido=?");
            ps.setInt(1, detalleOrden.getCodDetallePedido());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                detalleOrden.setCodDetallePedido(rs.getInt(1));
                detalleOrden.setCodProducto(rs.getInt(2));
                detalleOrden.setCodPedido(rs.getInt(3));
                detalleOrden.setCant(rs.getInt(4));
                detalleOrden.setMonto(rs.getDouble(5));
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return detalleOrden;
    }

    public void actualizarDetalle(DetalleOrden detalleOrden) {
        try {

            if (detalleOrden.getCant() != 0) {
                detalleOrden.calcularMonto();

                PreparedStatement ps = Conexion.getConnection().prepareStatement("update detalle_orden_pedido set Cant = ?, Monto = ? where CodDetallePedido=?");
                ps.setInt(1, detalleOrden.getCant());
                ps.setDouble(2, detalleOrden.getMonto());
                ps.setInt(3, detalleOrden.getCodDetallePedido());

                ps.executeUpdate();

            } else {

                PreparedStatement ps = Conexion.getConnection().prepareStatement("delete from detalle_orden_pedido where CodDetallePedido=?");
                ps.setInt(1, detalleOrden.getCodDetallePedido());

                ps.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void limpiarOrden(Orden orden) {

        try {

            PreparedStatement ps = Conexion.getConnection().prepareStatement("Select * from detalle_orden_pedido where CodPedido=?");
            ps.setInt(1, orden.getCodPedido());
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                
                Producto producto = new Producto();
                producto.setCodProducto(rs.getInt("CodProducto"));
                ProductoDAO proDAO = new ProductoDAO();
                
                proDAO.actualizarStock(producto, -rs.getInt("Cant"));
                
                DetalleOrden detalleOrden = new DetalleOrden();
                detalleOrden.setCant(0);
                detalleOrden.setCodDetallePedido(rs.getInt("CodDetallePedido"));
                
                actualizarDetalle(detalleOrden);
                
            }

        } catch (Exception e) {
            System.out.println(e);
        }

    }
    
    public void eliminarOrden(Orden orden) {

        try {

            PreparedStatement ps = Conexion.getConnection().prepareStatement("Select * from detalle_orden_pedido where CodPedido=?");
            ps.setInt(1, orden.getCodPedido());
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                
                Producto producto = new Producto();
                producto.setCodProducto(rs.getInt("CodProducto"));
                ProductoDAO proDAO = new ProductoDAO();
                
                proDAO.actualizarStock(producto, -rs.getInt("Cant"));
                
            }
            
            ps = Conexion.getConnection().prepareStatement("Delete from orden_pedido where CodPedido=?");
            ps.setInt(1, orden.getCodPedido());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
