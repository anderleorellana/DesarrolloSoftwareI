<%@page import="Negocio.Empleado, Negocio.Categoria, java.util.ArrayList;" %>
<%

    Empleado emp = (Empleado) session.getAttribute("usuario");
    if (emp == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

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
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

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
                            <h1 class="h3 mb-0 text-gray-800">Registro de Categorias</h1>
                            <a href="#" class="d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i> Generar Reporte</a>
                        </div>

                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb bg-light">
                                <li class="breadcrumb-item">
                                    <a href="index.jsp" class="text-decoration-none text-dark font-weight-bold">
                                        <i class="fa-thin fa-house"></i>Dashboard
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Categorias</li>
                            </ol>
                        </nav>

                        <div class="">
                            <div class="mb-3">
                                <button type="button" class="d-sm-inline-block btn btn-sm btn-success shadow-sm px-4"
                                        data-toggle="modal" data-target="#AddcategoriaModal">Agregar</button>
                            </div>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="AddcategoriaModal" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Agregar Categoria</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="CategoriaServlet" method="get">
                                        <input type="hidden" name="op" value="Add">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="number" name="txtCod" class="form-control" placeholder="Codigo"
                                                       required>
                                            </div>
                                            <div class=" form-group">
                                                <input type="text" name="txtNomCat" class="form-control"
                                                       placeholder="Nombre Categoria" required>
                                            </div>
                                            <div class="form-group">
                                                <textarea name="txtDescripcion" class="form-control"
                                                          placeholder="Descripcion Categoria" id="exampleFormControlTextarea1"
                                                          rows="3" required></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    data-dismiss="modal">Cerrar</button>
                                            <input type="submit" class="btn btn-success" value="Agregar Categoria">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Registro de Categorias</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%"
                                           cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Nombre</th>
                                                <th>Descripción</th>
                                                <th>Status</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Nombre</th>
                                                <th>Descripción</th>
                                                <th>Status</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <%
                                                ArrayList<Categoria> lista = (ArrayList<Categoria>) request.getAttribute("lcat");

                                                for (Categoria cat : lista) {
                                            %>
                                            <tr>
                                                <td class="align-middle"><%=cat.getCodCategoria()%></td>
                                                <td class="align-middle"><%=cat.getNombre()%></td>
                                                <td class="align-middle"><%=cat.getDescripcion()%></td>
                                                <td class="align-middle">
                                                    <span class="badge bg-success text-white">Active</span>
                                                </td>
                                                <td class="align-middle">
                                                    <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#EditcategoriaModal<%=cat.getCodCategoria()%>">
                                                        <i class="fa-duotone fa-pen-to-square" style="--fa-secondary-opacity: 1.0; --fa-primary-color: #ff9c2a; --fa-secondary-color: #2c2c2c;"></i>
                                                    </button>
                                                    <a href="CategoriaServlet?op=Remove&cod=<%=cat.getCodCategoria()%>" class="btn btn-outline-danger"><i
                                                            class="fa-duotone fa-trash"
                                                            style="--fa-secondary-opacity: 1.0; --fa-primary-color: #2c2c2c; --fa-secondary-color: #707070;"></i></a>
                                                </td>
                                            </tr>

                                            <!-- Modal -->
                                        <div class="modal fade" id="EditcategoriaModal<%=cat.getCodCategoria()%>" tabindex="-1" role="dialog"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Modificar Categoria <%=cat.getCodCategoria()%></h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <form action="CategoriaServlet" method="get">
                                                        <input type="hidden" name="op" value="Modify">
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <input type="number" name="txtmCod" value="<%=cat.getCodCategoria()%>" class="form-control" placeholder="Codigo"
                                                                       readonly required>
                                                            </div>
                                                            <div class=" form-group">
                                                                <input type="text" name="txtmNomCat" value="<%=cat.getNombre()%>" class="form-control"
                                                                       placeholder="Nombre Categoria" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <textarea name="txtmDescripcion" class="form-control"
                                                                          placeholder="Descripcion Categoria" id="exampleFormControlTextarea1"
                                                                          rows="3" required><%=cat.getDescripcion()%></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger"
                                                                    data-dismiss="modal">Cerrar</button>
                                                            <input type="submit" class="btn btn-success" value="Modificar Categoria">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

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