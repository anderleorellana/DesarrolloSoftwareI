package Negocio;

public class Cliente {
    //Atributos
    private int CodCliente;
    private String Nombre;
    private String Apellidos;
    private String Num_Documento;
    private String Email;
    private String Direccion;
    private String Telefono;
    //Constructor
    public Cliente(int CodCliente, String Nombre, String Apellidos, String Num_Documento, String Email, String Direccion, String Telefono) {
        this.CodCliente = CodCliente;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.Num_Documento = Num_Documento;
        this.Email = Email;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
    }

    public Cliente() {
    }
    //Getters & Setters

    public int getCodCliente() {
        return CodCliente;
    }

    public void setCodCliente(int CodCliente) {
        this.CodCliente = CodCliente;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getNum_Documento() {
        return Num_Documento;
    }

    public void setNum_Documento(String Num_Documento) {
        this.Num_Documento = Num_Documento;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }
    
}
