package Negocio;

public class DetalleOrden {
    //Atributos
    private int CodDetallePedido;
    private int CodProducto;
    private int CodPedido;
    private int Cant;
    private double Monto;
    //Vista
    private String Imagen;
    private String Producto;
    private int Stock;
    private double Precio;
    
    //Constructor
    public DetalleOrden(int CodDetallePedido, int CodProducto, int CodPedido, int Cant, double Monto) {
        this.CodDetallePedido = CodDetallePedido;
        this.CodProducto = CodProducto;
        this.CodPedido = CodPedido;
        this.Cant = Cant;
        this.Monto = Monto;
    }

    public DetalleOrden() {
    }
    //Getters & Setters

    public int getCodDetallePedido() {
        return CodDetallePedido;
    }

    public void setCodDetallePedido(int CodDetallePedido) {
        this.CodDetallePedido = CodDetallePedido;
    }

    public int getCodProducto() {
        return CodProducto;
    }

    public void setCodProducto(int CodProducto) {
        this.CodProducto = CodProducto;
    }

    public int getCodPedido() {
        return CodPedido;
    }

    public void setCodPedido(int CodPedido) {
        this.CodPedido = CodPedido;
    }

    public int getCant() {
        return Cant;
    }

    public void setCant(int Cant) {
        this.Cant = Cant;
    }

    public double getMonto() {
        return Monto;
    }

    public void setMonto(double Monto) {
        this.Monto = Monto;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public String getProducto() {
        return Producto;
    }

    public void setProducto(String Producto) {
        this.Producto = Producto;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }
    
    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }
    
    public void calcularMonto(){
        this.Monto = this.Cant * this.Precio;
    }
    
}
