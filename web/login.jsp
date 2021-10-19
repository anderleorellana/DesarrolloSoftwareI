<%@page import="Negocio.Empleado;" %>
<%
    Empleado emp = (Empleado) session.getAttribute("usuario");
    if (emp != null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="assets/img/log_ico.png">

        <title>Agroinversiones ALEXIS - Login</title>

        <!-- Custom fonts for this template-->
        <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/sb-login.css">
        <!--Alert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!--Jquery-->
        <script src="assets/js/jquery-3.6.0.min.js" ></script>
    </head>

    <body class="">

        <div class="container">

            <div class="row justify-content-center pt-5 mt-5 m-1">

                <div class="col-md-6 col-sm-8 col-xl-5 col-lg-6 formulario">

                    <form action="EmpleadoServlet" method="post">

                        <div class="form-group text-center pt-3">
                            <h1 class="text-light">INICIAR SESIÓN</h1>
                        </div>

                        <div class="form-group mx-sm-4 pt-3">
                            <input type="email" class="form-control py-4" placeholder="Ingrese su Correo Electronico"
                                   name="txtEmail" id="txtEmail" required>
                        </div>

                        <div class="form-group mx-sm-4 pb-3">
                            <input type="password" class="form-control py-4" placeholder="Ingrese su Contraseña"
                                   name="txtPassword" id="txtPassword" required>
                        </div>

                        <div class="form-group mx-sm-4 pb-2">
                            <input type="submit" name="acc" id="btnSubmit" class="btn btn-block ingresar" value="INGRESAR">
                        </div>

                    </form>

                </div>

            </div>

        </div>
        <div id="resultado" >

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="assets/js/sb-admin-2.min.js"></script>

        <!--<script src="assets/js/ajax.js"></script>-->
        <script>
            $(btnSubmit).click(consultar);
            function consultar(e) {
                //parar el submit del formulario
                e.preventDefault();
                //console.log($(btnSubmit).val());
                //ajax
                $.ajax({
                    url: "EmpleadoServlet", //servlet
                    data: {
                        btn: $(btnSubmit).val(),
                        usu: $(txtEmail).val(),
                        pas: $(txtPassword).val()
                    },
                    type: 'POST', //Oculto
                    success: function (result) {//si la peticion es correcta
                        //#id
                        $("#resultado").html(result);
                    }
                });
            }
        </script>
    </body>

</html>