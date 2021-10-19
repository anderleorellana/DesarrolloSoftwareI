package DAO;

import Negocio.Categoria;
import ConexionDB.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoriaDAO {
    
    public ArrayList getListCategoria(){
        ArrayList<Categoria> lista = new ArrayList<Categoria>();
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("select * from categoria");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                Categoria cat = new Categoria(rs.getInt(1),rs.getString(2),rs.getString(3));
                lista.add(cat);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lista;
    }

    public void agregarCategoria(Categoria categoria) {
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Insert into categoria (CodCategoria,Nombre,Descripcion) values (?,?,?)");
            ps.setInt(1, categoria.getCodCategoria());
            ps.setString(2, categoria.getNombre());
            ps.setString(3, categoria.getDescripcion());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void editarCategoria(Categoria categoria) {
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Update categoria set Nombre=?,Descripcion=? where CodCategoria=?");
            ps.setString(1, categoria.getNombre());
            ps.setString(2, categoria.getDescripcion());
            ps.setInt(3, categoria.getCodCategoria());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void eliminarCategoria(Categoria categoria) {
        try {
            PreparedStatement ps = Conexion.getConnection().prepareStatement("Delete from categoria where CodCategoria=?");
            ps.setInt(1, categoria.getCodCategoria());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
}
