/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Negocio.Empleado;
import DAO.EmpleadoDAO;
import java.util.ArrayList;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "EmpleadoServlet", urlPatterns = {"/EmpleadoServlet"})
public class EmpleadoServlet extends HttpServlet {

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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        Empleado empleado;

        String op = request.getParameter("op");

        EmpleadoDAO empDAO = new EmpleadoDAO();

        switch (op) {
            case "Viewer":

                ArrayList<Empleado> lista = empDAO.getListEmpleado();
                request.setAttribute("lemp", lista);

                request.getRequestDispatcher("colaboradores.jsp").forward(request, response);

                break;

            case "Modify":

                int codEmpleado = Integer.parseInt(request.getParameter("txtCodEmpleado"));
                String mnombres = request.getParameter("txtmNombres");
                String mapellidos = request.getParameter("txtmApellidos");
                String mdni = request.getParameter("txtmDNI");
                String mcelular = request.getParameter("txtmCelular");
                String mdireccion = request.getParameter("txtmDireccion");
                int mcodArea = Integer.parseInt(request.getParameter("txtmArea"));

                empleado = new Empleado();
                empleado.setCodEmpleado(codEmpleado);
                empleado.setNombre(mnombres);
                empleado.setApellidos(mapellidos);
                empleado.setDNI(mdni);
                empleado.setCelular(mcelular);
                empleado.setDireccion(mdireccion);
                empleado.setCodArea(mcodArea);

                if (empDAO.verificarColaboradorModificado(empleado)) {

                    empDAO.editarEmpleado(empleado);
                    
                    response.sendRedirect("EmpleadoServlet?op=Viewer");
                    //request.getRequestDispatcher("EmpleadoServlet?op=Viewer").forward(request, response);

                } else {

                    Cookie cookieMensaje = new Cookie("cookieM", empDAO.Alert("error", "Colaborador Existente", "El DNI introducido ya se encuenta en uso"));
                    cookieMensaje.setMaxAge(1);
                    response.addCookie(cookieMensaje);
                    response.sendRedirect("EmpleadoServlet?op=Viewer");
                    //request.getRequestDispatcher("EmpleadoServlet?op=Viewer").forward(request, response);

                }

                break;

            case "Remove":

                int rcod = Integer.parseInt(request.getParameter("codEmpleado"));

                empleado = new Empleado();
                empleado.setCodEmpleado(rcod);

                empDAO.eliminarEmpleado(empleado);

                request.getRequestDispatcher("EmpleadoServlet?op=Viewer").forward(request, response);

                break;

            case "Add":

                String nombres = request.getParameter("txtNombres");
                String apellidos = request.getParameter("txtApellidos");
                String dni = request.getParameter("txtDNI");
                String celular = request.getParameter("txtCelular");
                String direccion = request.getParameter("txtDireccion");
                int codArea = Integer.parseInt(request.getParameter("txtArea"));

                empleado = new Empleado();
                empleado.setNombre(nombres);
                empleado.setApellidos(apellidos);
                empleado.setDNI(dni);
                empleado.setCelular(celular);
                empleado.setDireccion(direccion);
                empleado.setCodArea(codArea);

                try (PrintWriter out = response.getWriter()) {

                    if (empDAO.verificarColaborador(empleado)) {
                        empDAO.agregarEmpleado(empleado);

                        out.println("<script>"
                                + "location.href=\"EmpleadoServlet?op=Viewer\";"
                                + "</script>");
                    } else {
                        response.setContentType("text/html;charset=UTF-8");
                        out.println(empDAO.Alert("error", "Colaborador Existente", "El DNI introducido ya se encuenta en uso"));
                    }

                } catch (Exception e) {
                    System.out.println(e);
                }

                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            if (request.getParameter("btn").equals("INGRESAR")) {

                String usu = request.getParameter("usu");
                String pas = request.getParameter("pas");

                EmpleadoDAO empDAO = new EmpleadoDAO();

                try {
                    Empleado emp = empDAO.consultarEmpleado(usu, pas);

                    response.setContentType("text/html;charset=UTF-8");

                    try (PrintWriter out = response.getWriter()) {
                        if (!emp.getEmail().equals("false")) {
                            //out.println(empDAO.Alert("error", "Acceso denegado", "Usuario o password incorrecto"));
                            HttpSession session = request.getSession();
                            session.setAttribute("usuario", emp);
                            out.println("<script>"
                                    + "location.href=\"index.jsp\";"
                                    + "</script>");

                        } else {
                            out.println(empDAO.Alert("error", "Acceso denegado", "Usuario o password incorrecto"));
                        }
                    }

                } catch (Exception e) {

                }

            }
        } catch (Exception e) {
        };
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
