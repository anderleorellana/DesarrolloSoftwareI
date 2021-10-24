<%@page import="Negocio.Empleado, Negocio.Cliente, java.util.ArrayList, Negocio.Orden, Negocio.DetalleOrden, Negocio.Producto, java.text.DecimalFormat;" %>
<%

    Empleado emp = (Empleado) session.getAttribute("usuario");
    if (emp == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    Cliente cliente = (Cliente) request.getAttribute("cliente");
    Orden orden = (Orden) request.getAttribute("orden");
    DecimalFormat df2 = new DecimalFormat("#.##");
%>

<!DOCTYPE html>
<html lang="es">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="assets/img/log_ico.png">

        <title>Agroinversiones ALEXIS - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta1/css/all.css" rel="stylesheet"
              type="text/css">

        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>

        <!-- Custom styles for this page -->
        <link href="assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar"
                style="background: #212529;">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon">
                        <i class="fa-light fa-store"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">DASHBOARD</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading hd-sidebar">
                    PROFILE
                </div>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">
                        <i class="fa-light fa-house"></i>
                        <span>Home</span></a>
                </li>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProfile"
                       aria-expanded="false" aria-controls="collapseProfile">
                        <i class="fa-light fa-user-gear xd"></i>
                        <span>Profile</span>
                    </a>
                    <div id="collapseProfile" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-gradient-dark py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Seccion Profile:</h6>
                            <a class="collapse-item" href="perfil.html">Perfil</a>
                            <a class="collapse-item" href="#">Ajustes</a>
                            <a class="collapse-item" href="#">Cerrar Sesion</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    MENU
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseVentas"
                       aria-expanded="true" aria-controls="collapseVentas">
                        <i class="fa-light fa-coin"></i>
                        <span>Ventas</span>
                    </a>
                    <div id="collapseVentas" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-gradient-dark py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Seccion Ventas:</h6>
                            <%                                if (emp.getCodArea() == 101) {
                            %>
                            <a class="collapse-item" href="historialVentas.jsp">Registro Ventas</a>
                            <a class="collapse-item" href="#" data-toggle="modal" data-target="#ModalVenta">Realizar Venta</a>
                            <a class="collapse-item" href="pagarVenta.jsp">Ventas por Pagar</a>
                            <a class="collapse-item" href="finalizarVenta.jsp">Ventas por Finalizar</a>
                            <%
                            } else if (emp.getCodArea() == 102) {
                            %>
                            <a class="collapse-item" href="historialVentas.jsp">Registro Ventas</a>
                            <a class="collapse-item" href="#" data-toggle="modal" data-target="#ModalVenta">Realizar Venta</a>
                            <%
                            } else if (emp.getCodArea() == 103) {
                            %>
                            <a class="collapse-item" href="historialVentas.jsp">Registro Ventas</a>
                            <a class="collapse-item" href="pagarVenta.jsp">Ventas por Pagar</a>
                            <%
                            } else if (emp.getCodArea() == 104) {
                            %>
                            <a class="collapse-item" href="historialVentas.jsp">Registro Ventas</a>
                            <a class="collapse-item" href="finalizarVenta.jsp">Ventas por Finalizar</a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </li>

                <!-- Modal -->
                <div class="modal fade" id="ModalVenta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Ingrese Cliente</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="ClienteServlet" method="get">
                                <input type="hidden" name="op" value="Validar">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <input type="text" name="txtNumDoc" class="form-control" placeholder="N° Documento Cliente" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-success">Ingresar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                
                <%
                    if (emp.getCodArea() == 101 || emp.getCodArea() == 102) {
                %>
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="PendienteServlet?op=Viewer">
                        <i class="fa-thin fa-folders"></i>
                        <span>Pendientes</span></a>
                </li>
                <%
                    }
                %>
                
                <%
                    if (emp.getCodArea() == 101) {
                %>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProductos"
                       aria-expanded="false" aria-controls="collapseProductos">
                        <i class="fa-light fa-cubes"></i>
                        <span>Productos</span>
                    </a>
                    <div id="collapseProductos" class="collapse" aria-labelledby="headingTwo"
                         data-parent="#accordionSidebar">
                        <div class="bg-gradient-dark py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Seccion Productos:</h6>
                            <a class="collapse-item" href="ProductoServlet?op=Viewer">Productos</a>
                            <a class="collapse-item" href="CategoriaServlet?op=Viewer">Categorias</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="clientes.jsp">
                        <i class="fa-light fa-users"></i>
                        <span>Clientes</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="EmpleadoServlet?op=Viewer">
                        <i class="fa-light fa-user-helmet-safety"></i>
                        <span>Colaboradores</span></a>
                </li>


                <%
                    }
                %>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">
                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-light topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <div class="nav-header">
                            <a class="h4 text-decoration-none text-dark">
                                AGROINVERSIONES ALEXIS S.A.C.
                            </a>
                        </div>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=emp.getNombre()%></span>
                                    <img class="img-profile rounded-circle" src="assets/img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Perfil
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Ajustes
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Salir
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Registrar Venta</h1>
                            <a href="CanastaServlet?op=Clear&order=<%=orden.getCodPedido()%>" class="d-sm-inline-block btn btn-sm btn-danger shadow-sm"><i class="fa-light fa-cart-xmark text-white-50"></i> Vaciar Carrito</a>
                        </div>

                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb bg-light">
                                <li class="breadcrumb-item">
                                    <a href="index.jsp" class="text-decoration-none text-dark font-weight-bold">
                                        <i class="fa-thin fa-house"></i>Dashboard
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Realizar Venta</li>
                            </ol>
                        </nav>

                        <div class="card shadow mb-4 container-fluid">
                            <div class="row my-4">
                                <div class="col-8">
                                    <table class="table">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">Producto</th>
                                                <th scope="col">Precio</th>
                                                <th scope="col">Cantidad</th>
                                                <th scope="col">Total</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                ArrayList<DetalleOrden> listad = (ArrayList<DetalleOrden>) request.getAttribute("lido");
                                                
                                                for (DetalleOrden detalleOrden : listad) {
                                            %>
                                            <tr>
                                                <td class="align-middle">
                                                    <img src="<%=detalleOrden.getImagen()%>" style="width: 4rem;" alt="alt"/>
                                                    <span><%=detalleOrden.getProducto()%></span>
                                                </td>
                                                <td class="align-middle">S/<%=detalleOrden.getPrecio()%></td>
                                                <td class="align-middle">
                                                    <form action="CanastaServlet">
                                                        <input type="hidden" name="op" value="ModifyCant">
                                                        <input type="hidden" name="coddetalle" value="<%=detalleOrden.getCodDetallePedido()%>">
                                                        <input type="hidden" name="codcliente" value="<%=orden.getCodCliente()%>">
                                                        <input type="hidden" name="precio" value="<%=detalleOrden.getPrecio()%>">
                                                        <input type="number" name="txtCant" onchange="this.form.submit()" style="width: 5rem;" class="form-control" min="0" max="<%=detalleOrden.getStock()%>" value="<%=detalleOrden.getCant()%>" placeholder="Cant.">
                                                    </form>
                                                </td>
                                                <td class="align-middle">S/<%=detalleOrden.getMonto()%></td>
                                                <td class="align-middle">
                                                    <a href="CanastaServlet?op=RemoveProduct&ccli=<%=orden.getCodCliente()%>&cdet=<%=detalleOrden.getCodDetallePedido()%>&cant=<%=detalleOrden.getCant()%>">
                                                        <i class="fa-light fa-trash text-danger"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                            <tr>
                                                <th colspan="5" class="text-center">Agrega Productos al Carrito de Compras</th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="col-4">
                                    <table class="card">
                                        <thead class="card-header">
                                            <tr class="row">
                                                <th class="col" colspan="2">RESUMEN DE PEDIDO</th>
                                            </tr>
                                        </thead>
                                        <tbody class="card-body">
                                            <tr class="row border-bottom">
                                                <td class="pt-1 pb-3 col-8 text-left" scope="row">SubTotal:</td>
                                                <td class="pt-1 pb-3 col">S/.<%=df2.format(orden.getTotal() * 0.82)%></td>
                                            </tr>
                                            <tr class="row border-bottom">
                                                <td class="py-3 col-8 text-left" scope="row">IGV:</td>
                                                <td class="py-3 col">S/.<%=df2.format(orden.getTotal() * 0.18)%></td>
                                            </tr>
                                            <tr class="row border-bottom">
                                                <th class="py-3 col-8 text-left" scope="row">Total:</th>
                                                <td class="py-3 col">S/.<%=df2.format(orden.getTotal())%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="text-center mt-3">
                                        <a href="#" class="btn btn-warning container-fluid" data-toggle="modal" data-target="#ModalClientePedido">Procesar Pedido</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="ModalClientePedido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Datos del Cliente</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="CanastaServlet">
                                            <div class="modal-body">
                                                <input type="hidden" name="op" value="Procesar">
                                                <input type="hidden" name="codorden" value="<%=orden.getCodPedido()%>">
                                                <input type="hidden" name="codcliente" value="<%=cliente.getCodCliente()%>">
                                                <div class="form-group">
                                                    <input type="text" name="txtNombre" class="form-control" value="<%=cliente.getNombre()%>" placeholder="Nombre Cliente" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" name="txtApellidos" class="form-control" value="<%=cliente.getApellidos()%>" placeholder="Apellidos Cliente" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="email" name="txtEmail" class="form-control" value="<%=cliente.getEmail()%>" placeholder="Correo Electronico">
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" name="txtDireccion" class="form-control" value="<%=cliente.getDireccion()%>" placeholder="Direccion">
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col">
                                                        <input type="text" name="txtNumDoc" class="form-control" value="<%=cliente.getNum_Documento()%>" placeholder="N° Documento" readonly required>
                                                    </div>
                                                    <div class="form-group col">
                                                        <input type="text" name="txtTelefono" class="form-control" value="<%=cliente.getTelefono()%>" placeholder="N° Telefono">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-success">Procesar Pedido</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Registro de Productos</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%"
                                           cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Producto</th>
                                                <th>Stock</th>
                                                <th>Precio</th>
                                                <th>Categoria</th>
                                                <th>Status</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Producto</th>
                                                <th>Stock</th>
                                                <th>Precio</th>
                                                <th>Categoria</th>
                                                <th>Status</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <%
                                                ArrayList<Producto> listap = (ArrayList<Producto>) request.getAttribute("ldis");
                                                for (Producto producto : listap) {
                                            %>
                                            <tr>
                                                <td class="align-middle"><%=producto.getCodProducto()%></td>
                                                <td class="align-middle">
                                                    <img style="width: 4.5rem;" src="<%=producto.getImagen()%>" alt="">
                                                    <span><%=producto.getNombre()%></span>
                                                </td>
                                                <td class="align-middle"><%=producto.getStock()%></td>
                                                <td class="align-middle">S/.<%=producto.getPrecio()%></td>
                                                <td class="align-middle"><%=producto.getCategoria()%></td>
                                                <td class="align-middle">
                                                    <span class="badge bg-success text-white">Active</span>
                                                </td>
                                                <td class="align-middle">

                                                    <form action="CanastaServlet" method="get" class="form-inline">
                                                        <input type="hidden" name="op" value="AddProduct">
                                                        <input type="hidden" name="codpedido" value="<%=orden.getCodPedido()%>">
                                                        <input type="hidden" name="codcliente" value="<%=orden.getCodCliente()%>">
                                                        <input type="hidden" name="codproducto" value="<%=producto.getCodProducto()%>">
                                                        <input type="hidden" name="txtPrecio" value="<%=producto.getPrecio()%>">
                                                        <input class="form-control mr-2" name="txtCant" type="number" min="1" max="<%=producto.getStock()%>" placeholder="Cant.">

                                                        <button type="submit" class="btn btn-success">
                                                            <i class="fa-light fa-cart-plus"></i> Add
                                                        </button>

                                                    </form>
                                                </td>
                                            </tr>

                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2021</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content hre -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">¿Listo para salir?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Seleccione "Cerrar sesión" a continuación si está listo para finalizar su sesión actual.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-primary" href="CerrarSesionServlet">Cerrar Sesion</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="assets/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="assets/js/demo/datatables-demo.js"></script>
    </body>

</html>