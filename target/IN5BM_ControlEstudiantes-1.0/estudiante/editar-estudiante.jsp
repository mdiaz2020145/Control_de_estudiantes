<%-- 
    Document   : editar-estudiante
    Created on : 9/09/2021, 10:41:15 AM
    Author     : doazm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar estudiante</title>

        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <script src="https://kit.fontawesome.com/7c748b5f00.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <!cabecera>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

    <form method="POST" action="${pageContext.request.contextPath}/ServletEstudianteController?accion=insertar" class="was-validated">

        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" name="nombre" id="nombre" required value="${estudiante.nombre}">
        </div>

        <div class="mb-3">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" class="form-control" name="apellido" id="apellido" required value="${estudiante.apellido}">
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" name="email" id="email" required value="${estudiante.email}">
        </div>

        <div class="mb-3">
            <label for="telefono" class="form-label">Telefono</label>
            <input type="tel" class="form-control" name="telefono" id="telefono" required value="${estudiante.telefono}">
        </div>

        <div class="mb-3">
            <label for="saldo" class="form-label">Saldo</label>
            <input type="number" class="form-control" name="saldo" id="saldo" step="any" required value="${estudiante.saldo}">
        </div> 
        <input type="hidden" name="idEstudiante" value="${estudiante.idEstudiante}"> 
        <input type="hidden" name="accion" value="actualizar">

        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Guardar</button>

    </form>
    
      <!footer>
    <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

    <!javaScript>
    <script src="./assets/js/jquery-3.6.0.js"></script>
    <script src="./assets/js/bootstrap.bundle.js"></script>
</body>

</html>
