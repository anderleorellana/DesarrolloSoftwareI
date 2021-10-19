
package Negocio;

public class Producto {
    //Atributos
    private int CodProducto;
    private int CodCategoria;
    private String Nombre;
    private int Stock;
    private double Precio;
    private String Descripcion;
    private String Imagen;
    //Vista
    private String Categoria;
    //Constructor
    public Producto(int CodProducto, int CodCategoria, String Nombre, int Stock, double Precio, String Descripcion, String Imagen, String Categoria) {
        this.CodProducto = CodProducto;
        this.CodCategoria = CodCategoria;
        this.Nombre = Nombre;
        this.Stock = Stock;
        this.Precio = Precio;
        this.Descripcion = Descripcion;
        this.Imagen = Imagen;
        this.Categoria = Categoria;
    }

    public Producto() {
    }
    //Getters & Setters

    public int getCodProducto() {
        return CodProducto;
    }

    public void setCodProducto(int CodProducto) {
        this.CodProducto = CodProducto;
    }

    public int getCodCategoria() {
        return CodCategoria;
    }

    public void setCodCategoria(int CodCategoria) {
        this.CodCategoria = CodCategoria;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }
    
    
}
