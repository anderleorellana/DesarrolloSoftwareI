/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.ProductoDAO;
import Negocio.Producto;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author User
 */
@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

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

        Producto producto;

        String op = request.getParameter("op");

        ProductoDAO proDAO = new ProductoDAO();

        switch (op) {
            case "Viewer":

                ArrayList<Producto> listap = proDAO.getListProductos();

                request.setAttribute("lpro", listap);

                request.getRequestDispatcher("productos.jsp").forward(request, response);

                break;

            case "Modify":

                producto = new Producto();
                ArrayList<String> elista = new ArrayList<>();
                producto.setImagen("none");
                String img = request.getParameter("img").substring(22);
                
                try {
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            File r = new File("C:\\wamp64\\www\\imga\\"+img);
                            r.delete();
                            File f = new File("C:\\wamp64\\www\\imga\\" + fileItem.getName());
                            fileItem.write(f);
                            producto.setImagen("http://localhost/imga/" + fileItem.getName());
                        } else {
                            elista.add(fileItem.getString());
                        }
                    }

                } catch (Exception e) {
                    System.out.println(e);
                }

                for (int i = 0; i < elista.size(); i++) {
                    System.out.println(elista.get(i));
                }
                
                producto.setCodCategoria(Integer.parseInt(elista.get(4)));
                producto.setNombre(elista.get(0));
                producto.setStock(Integer.parseInt(elista.get(1)));
                producto.setPrecio(Double.parseDouble(elista.get(2)));
                producto.setDescripcion(elista.get(3));
                producto.setCodProducto(Integer.parseInt(elista.get(5)));

                proDAO.modificarProducto(producto);

                response.sendRedirect("ProductoServlet?op=Viewer");

                break;
                
            case "Remove":
                
                int rCod = Integer.parseInt(request.getParameter("codPro"));
                
                producto = new Producto();
                producto.setCodProducto(rCod);
                
                proDAO.eliminarProducto(producto);

                request.getRequestDispatcher("ProductoServlet?op=Viewer").forward(request, response);
                
                break;

            case "Add":
                producto = new Producto();
                ArrayList<String> lista = new ArrayList<>();
                try {

                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            File f = new File("C:\\wamp64\\www\\imga\\" + fileItem.getName());
                            fileItem.write(f);
                            producto.setImagen("http://localhost/imga/" + fileItem.getName());
                        } else {
                            lista.add(fileItem.getString());
                        }
                    }

                    producto.setCodCategoria(Integer.parseInt(lista.get(4)));
                    producto.setNombre(lista.get(0));
                    producto.setStock(Integer.parseInt(lista.get(1)));
                    producto.setPrecio(Double.parseDouble(lista.get(2)));
                    producto.setDescripcion(lista.get(3));

                    proDAO.agregarProducto(producto);

                } catch (Exception e) {
                    System.out.println(e);
                }
                request.getRequestDispatcher("ProductoServlet?op=Viewer").forward(request, response);
                break;
        }

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
