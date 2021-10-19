package Negocio;

public class Categoria {
    //Atributos
    private int CodCategoria;
    private String Nombre;
    private String Descripcion;
    //Constructor
    public Categoria(int CodCategoria, String Nombre, String Descripcion) {
        this.CodCategoria = CodCategoria;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
    }

    public Categoria() {
    }
    //Getters & Setters
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

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
}
