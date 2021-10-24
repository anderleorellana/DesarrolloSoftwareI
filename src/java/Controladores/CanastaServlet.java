package Controladores;

import DAO.ClienteDAO;
import DAO.DetalleOrdenDAO;
import DAO.OrdenDAO;
import DAO.ProductoDAO;
import Negocio.Cliente;
import Negocio.DetalleOrden;
import Negocio.Empleado;
import Negocio.Orden;
import Negocio.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CanastaServlet", urlPatterns = {"/CanastaServlet"})
public class CanastaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        Producto producto;
        Cliente cliente;
        DetalleOrden detalleOrden;
        Orden orden;

        String op = request.getParameter("op");

        ProductoDAO proDAO = new ProductoDAO();
        DetalleOrdenDAO doDAO = new DetalleOrdenDAO();
        OrdenDAO ordDAO = new OrdenDAO();
        ClienteDAO cliDAO = new ClienteDAO();

        switch (op) {
            case "Viewer":

                cliente = new Cliente();
                orden = new Orden();
                detalleOrden = new DetalleOrden();
                cliente.setCodCliente(Integer.parseInt(request.getParameter("cli")));
                cliente = cliDAO.getClienteCod(cliente);

                orden.setCodCliente(cliente.getCodCliente());

                orden.setCodEmpleado((Integer) ((Empleado) request.getSession().getAttribute("usuario")).getCodEmpleado());

                if (ordDAO.validarOrden(cliente)) {
                    
                    orden = ordDAO.getOrden(orden);

                } else {

                    orden = ordDAO.crearOrden(orden);
                    
                }
                ordDAO.actualizarMontoOrden(orden);
                
                ArrayList<DetalleOrden> listado = doDAO.getListDetalleOrden(orden);

                ArrayList<Producto> listap = proDAO.getListProductos();
                
                request.setAttribute("cliente", cliente);
                request.setAttribute("orden", ordDAO.getOrden(orden));
                request.setAttribute("lido", listado);
                request.setAttribute("ldis", listap);

                request.getRequestDispatcher("realizarVenta.jsp").forward(request, response);

                break;
                
            case "AddProduct":
                
                detalleOrden = new DetalleOrden();
                
                detalleOrden.setCodProducto(Integer.parseInt(request.getParameter("codproducto")));
                detalleOrden.setCodPedido(Integer.parseInt(request.getParameter("codpedido")));
                detalleOrden.setCant(Integer.parseInt(request.getParameter("txtCant")));
                detalleOrden.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
                detalleOrden.calcularMonto();
                
                doDAO.agregarDetalle(detalleOrden);
                
                response.sendRedirect("CanastaServlet?op=Viewer&cli=" + request.getParameter("codcliente"));
                
                break;
            case "ModifyCant":
                
                detalleOrden = new DetalleOrden();
                detalleOrden.setCodDetallePedido(Integer.parseInt(request.getParameter("coddetalle")));
                detalleOrden = doDAO.getDetalleOrden(detalleOrden);
                
                int cant = Integer.parseInt(request.getParameter("txtCant")) - detalleOrden.getCant();
                detalleOrden.setCant(Integer.parseInt(request.getParameter("txtCant")));
                detalleOrden.setPrecio(Double.parseDouble(request.getParameter("precio")));
                
                producto = new Producto();
                producto.setCodProducto(detalleOrden.getCodProducto());
                
                proDAO.actualizarStock(producto, cant);
                
                doDAO.actualizarDetalle(detalleOrden);
                
                response.sendRedirect("CanastaServlet?op=Viewer&cli=" + request.getParameter("codcliente"));
                
                break;
            case "RemoveProduct":
                
                detalleOrden = new DetalleOrden();
                detalleOrden.setCodDetallePedido(Integer.parseInt(request.getParameter("cdet")));
                detalleOrden = doDAO.getDetalleOrden(detalleOrden);
                detalleOrden.setCant(0);
                
                int ncant = detalleOrden.getCant() - Integer.parseInt(request.getParameter("cant"));
                
                producto = new Producto();
                producto.setCodProducto(detalleOrden.getCodProducto());
                
                proDAO.actualizarStock(producto, ncant);
                
                doDAO.actualizarDetalle(detalleOrden);
                
                response.sendRedirect("CanastaServlet?op=Viewer&cli=" + request.getParameter("ccli"));
                
                break;
            case "Procesar":
                
                orden = new Orden();
                orden.setCodPedido(Integer.parseInt(request.getParameter("codorden")));
                
                ordDAO.procesarPedido(orden);
                
                cliente = new Cliente(Integer.parseInt(request.getParameter("codcliente")), request.getParameter("txtNombre"), request.getParameter("txtApellidos"),
                request.getParameter("txtNumDoc"), request.getParameter("txtEmail"), request.getParameter("txtDireccion"), request.getParameter("txtTelefono"));
                
                cliDAO.actualizarCliente(cliente);
                
                response.sendRedirect("index.jsp");
                
                break;
            case "Clear":
                
                orden = new Orden();
                orden.setCodPedido(Integer.parseInt(request.getParameter("order")));
                
                doDAO.limpiarOrden(orden);
                
                response.sendRedirect("PendienteServlet?op=Viewer");
                
                break;
            case "Delete":
                
                orden = new Orden();
                orden.setCodPedido(Integer.parseInt(request.getParameter("order")));
                
                doDAO.eliminarOrden(orden);
                
                response.sendRedirect("PendienteServlet?op=Viewer");
                
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
