package DAO;

import Negocio.Producto;
import ConexionDB.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductoDAO {

    public ArrayList<Producto> getListProductos() {
        ArrayList<Producto> lista = new ArrayList<Producto>();

        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from view_producto");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setCodProducto(rs.getInt(1));
                producto.setImagen(rs.getString(2));
                producto.setNombre(rs.getString(3));
                producto.setStock(rs.getInt(4));
                producto.setPrecio(rs.getDouble(5));
                producto.setCategoria(rs.getString(6));
                producto.setDescripcion(rs.getString(7));

                lista.add(producto);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return lista;
    }

    public void agregarProducto(Producto producto) {

        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("insert into producto (CodCategoria,Nombre,Stock,Precio,Descripcion,Imagen) values (?,?,?,?,?,?)");
            ps.setInt(1, producto.getCodCategoria());
            ps.setString(2, producto.getNombre());
            ps.setInt(3, producto.getStock());
            ps.setDouble(4, producto.getPrecio());
            ps.setString(5, producto.getDescripcion());
            ps.setString(6, producto.getImagen());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public void modificarProducto(Producto producto) {
        try {
            PreparedStatement ps = null;
            if (producto.getImagen().equals("none")) {
                ps = Conexion.getConnection().prepareStatement("update producto set CodCategoria=?,Nombre=?,Stock=?,Precio=?,Descripcion=? where CodProducto=?");
                ps.setInt(6, producto.getCodProducto());
            } else {
                ps = Conexion.getConnection().prepareStatement("update producto set CodCategoria=?,Nombre=?,Stock=?,Precio=?,Descripcion=?,Imagen=? where CodProducto=?");
                ps.setString(6, producto.getImagen());
                ps.setInt(7, producto.getCodProducto());
            }
            ps.setInt(1, producto.getCodCategoria());
            ps.setString(2, producto.getNombre());
            ps.setInt(3, producto.getStock());
            ps.setDouble(4, producto.getPrecio());
            ps.setString(5, producto.getDescripcion());
            

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void eliminarProducto(Producto producto) {
        
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Delete from producto where CodProducto=?");
            ps.setInt(1, producto.getCodProducto());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }

    public void actualizarStock(Producto producto, int cant) {
        
        try {
            
            producto = getProducto(producto);
            producto.setStock(producto.getStock() - cant);
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Update producto set Stock=? where CodProducto=?");
            ps.setInt(1, producto.getStock());
            ps.setInt(2, producto.getCodProducto());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }

    private Producto getProducto(Producto producto) {
        
        try {
            
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Select * from producto where CodProducto=?");
            ps.setInt(1, producto.getCodProducto());
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                producto.setCodProducto(rs.getInt(1));
                producto.setCodCategoria(rs.getInt(2));
                producto.setNombre(rs.getString(3));
                producto.setStock(rs.getInt(4));
                producto.setPrecio(rs.getDouble(5));
                producto.setDescripcion(rs.getString(6));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return producto;
    }

}
