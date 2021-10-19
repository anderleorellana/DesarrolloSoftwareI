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
$(btnAddColaborador).click(agregarEmpleado);
function agregarEmpleado(e) {
    //parar el submit del formulario
    e.preventDefault();
    $.ajax({
       url:  "EmpleadoServlet",
       data:{
           op: $(operacion).val(),
           txtNombres: $(Idnombres).val(),
           txtApellidos: $(Idapellidos).val(),
           txtDNI: $(Idnumdoc).val(),
           txtCelular: $(Idcelular).val(),
           txtDireccion: $(Iddireccion).val(),
           txtArea: $(Idarea).val()
       },
       type: 'GET',
       success: function(result){
           $("#mensaje").html(result);
       }
    });
}