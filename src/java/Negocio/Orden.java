package Negocio;

import java.sql.Timestamp;

public class Orden {
    //Atributos
    private int CodPedido;
    private int CodEmpleado;
    private int CodCliente;
    private Timestamp Fecha;
    private String Estado;
    private double Total;
    //Vistas
    private String Num_Documento;
    //Constructor
    public Orden(int CodPedido, int CodEmpleado, int CodCliente, Timestamp Fecha, String Estado, double Total) {
        this.CodPedido = CodPedido;
        this.CodEmpleado = CodEmpleado;
        this.CodCliente = CodCliente;
        this.Fecha = Fecha;
        this.Estado = Estado;
        this.Total = Total;
    }

    public Orden() {
    }
    //Getters & Setters
    public int getCodPedido() {
        return CodPedido;
    }

    public void setCodPedido(int CodPedido) {
        this.CodPedido = CodPedido;
    }

    public int getCodEmpleado() {
        return CodEmpleado;
    }

    public void setCodEmpleado(int CodEmpleado) {
        this.CodEmpleado = CodEmpleado;
    }

    public int getCodCliente() {
        return CodCliente;
    }

    public void setCodCliente(int CodCliente) {
        this.CodCliente = CodCliente;
    }

    public Timestamp getFecha() {
        return Fecha;
    }

    public void setFecha(Timestamp Fecha) {
        this.Fecha = Fecha;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }

    public String getNum_Documento() {
        return Num_Documento;
    }

    public void setNum_Documento(String Num_Documento) {
        this.Num_Documento = Num_Documento;
    }
    
}
