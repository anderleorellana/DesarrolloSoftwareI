
package Negocio;

public class Empleado {
    //Atributos
    private int CodEmpleado;
    private int CodArea;
    private String Nombre;
    private String Apellidos;
    private String DNI;
    private String Email;
    private String Password;
    private String Celular;
    private String Direccion;
    //Vista
    private String Area;
    //Constructor
    public Empleado(int CodEmpleado, int CodArea, String Nombre, String Apellidos, String DNI, String Email, String Password, String Celular, String Direccion) {
        this.CodEmpleado = CodEmpleado;
        this.CodArea = CodArea;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.DNI = DNI;
        this.Email = Email;
        this.Password = Password;
        this.Celular = Celular;
        this.Direccion = Direccion;
    }

    public Empleado() {
    }
    //Getters & Setters

    public int getCodEmpleado() {
        return CodEmpleado;
    }

    public void setCodEmpleado(int CodEmpleado) {
        this.CodEmpleado = CodEmpleado;
    }

    public int getCodArea() {
        return CodArea;
    }

    public void setCodArea(int CodArea) {
        this.CodArea = CodArea;
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

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getCelular() {
        return Celular;
    }

    public void setCelular(String Celular) {
        this.Celular = Celular;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getArea() {
        return Area;
    }

    public void setArea(String Area) {
        this.Area = Area;
    }
    
}
