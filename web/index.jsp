<%@page import="Negocio.Empleado;" %>
<%

    Empleado emp = (Empleado) session.getAttribute("usuario");
    if (emp == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
//Hola
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
        <!--Jquery-->
        <script src="assets/js/jquery-3.6.0.min.js" ></script>

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
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i> Generar Reporte</a>
                        </div>

                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb bg-light">
                                <li class="breadcrumb-item">
                                    <a href="index.jsp" class="text-decoration-none text-dark font-weight-bold">
                                        <i class="fa-thin fa-house"></i>Dashboard
                                    </a>
                                </li>
                            </ol>
                        </nav>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    GANANCIAS (MENSUAL)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">S/.40,000</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    GANANCIAS (ANUAL)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">S/.215,000</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">MARGEN
                                                    DE GANANCIAS
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="progress progress-sm mr-2">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    VENTAS (MENSUAL)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-solid fa-hashtag fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->

                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Resumen de ganancias</h6>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="myAreaChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pie Chart -->
                            <div class="col-xl-4 col-lg-5">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Categorias más Vendidas</h6>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-pie pt-4 pb-2">
                                            <canvas id="myPieChart"></canvas>
                                        </div>
                                        <div class="mt-4 text-center small">
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-primary"></i> Cat1
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-success"></i> Cat2
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-info"></i> Cat3
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-dark"></i> Cat4
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->
                        <div class="row">
                            <div class="col-xl-6">
                                <!-- DataTales Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Productos más vendidos (Cantidad)</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover" id="dataTable1" width="100%"
                                                   cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Producto</th>
                                                        <th>Categoria</th>
                                                        <th>Precio</th>
                                                        <th>Cantidad</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">Categoria 1</td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">Categoria 1</td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">Categoria 1</td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">Categoria 1</td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">Categoria 1</td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6">
                                <!-- DataTales Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Productos más vendidos (Importe)</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover" id="dataTable2" width="100%"
                                                   cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Producto</th>
                                                        <th>Precio</th>
                                                        <th>Cantidad</th>
                                                        <th>Importe</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                        <td class="align-middle">S/. Precio Largo</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                        <td class="align-middle">S/. Precio Largo</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                        <td class="align-middle">S/. Precio Largo</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                        <td class="align-middle">S/. Precio Largo</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img style="width: 2.5rem;" src="assets/img/product.png" alt="">
                                                            <span>Producto Nombre Muy Largo 1</span>
                                                        </td>
                                                        <td class="align-middle">S/. Precio</td>
                                                        <td class="align-middle">1061</td>
                                                        <td class="align-middle">S/. Precio Largo</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Content Column -->
                            <div class="col-lg-6 mb-4">

                                <!-- Project Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Porcentajes</h6>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="small font-weight-bold">A1<span class="float-right">8%</span></h4>
                                        <div class="progress mb-4">
                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 8%"
                                                 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <h4 class="small font-weight-bold">A2<span class="float-right">40%</span></h4>
                                        <div class="progress mb-4">
                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                                 aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <h4 class="small font-weight-bold">A3<span class="float-right">60%</span></h4>
                                        <div class="progress mb-4">
                                            <div class="progress-bar" role="progressbar" style="width: 60%"
                                                 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <h4 class="small font-weight-bold">A4<span class="float-right">80%</span></h4>
                                        <div class="progress mb-4">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                                 aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <h4 class="small font-weight-bold">A4<span class="float-right">Complete!</span></h4>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                                 aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-6 mb-4">

                                <!-- Illustrations -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="text-center">
                                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 10rem;"
                                                 src="assets/img/undraw_posting_photo.svg" alt="...">
                                        </div>
                                        <p>Add some quality, svg illustrations to your project courtesy of <a
                                                target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
                                            constantly updated collection of beautiful svg images that you can use
                                            completely free and without attribution!</p>
                                        <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on
                                            unDraw &rarr;</a>
                                    </div>
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
        <script src="assets/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="assets/js/demo/chart-area-demo.js"></script>
        <script src="assets/js/demo/chart-pie-demo.js"></script>

        <!-- Page level plugins -->
        <script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="assets/js/demo/datatables-demo.js"></script>
    </body>

</html>