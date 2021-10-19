/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.CategoriaDAO;
import Negocio.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "CategoriaServlet", urlPatterns = {"/CategoriaServlet"})
public class CategoriaServlet extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        Categoria categoria;
        
        String op = request.getParameter("op");
        
        CategoriaDAO catDAO = new CategoriaDAO();
        
        switch (op) {
            case "Viewer":
                
                    ArrayList<Categoria> lista = catDAO.getListCategoria();
                    
                    request.setAttribute("lcat", lista);
                    
                    request.getRequestDispatcher("categorias.jsp").forward(request, response);

                break;
            
            case "Modify":
                
                int mcodCategoria = Integer.parseInt(request.getParameter("txtmCod"));
                String mnombre = request.getParameter("txtmNomCat");
                String mdescripcion = request.getParameter("txtmDescripcion");
                
                categoria = new Categoria(mcodCategoria, mnombre, mdescripcion);
                
                catDAO.editarCategoria(categoria);
                
                request.getRequestDispatcher("CategoriaServlet?op=Viewer").forward(request, response);
                
                break;
                
            case "Remove":
                
                int rcod =Integer.parseInt(request.getParameter("cod"));
                
                categoria = new Categoria();
                categoria.setCodCategoria(rcod);
                
                catDAO.eliminarCategoria(categoria);
                
                request.getRequestDispatcher("CategoriaServlet?op=Viewer").forward(request, response);
                
                break;
                
            case "Add":
                
                int codCategoria = Integer.parseInt(request.getParameter("txtCod"));
                String nombre = request.getParameter("txtNomCat");
                String descripcion = request.getParameter("txtDescripcion");
                
                categoria = new Categoria(codCategoria, nombre, descripcion);
               
                catDAO.agregarCategoria(categoria);
                
                request.getRequestDispatcher("CategoriaServlet?op=Viewer").forward(request, response);
                
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
