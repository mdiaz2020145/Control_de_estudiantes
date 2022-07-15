<%-- 
    Document   : estudiante
    Created on : 25/08/2021, 10:44:53 AM
    Author     : doazm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es_GT"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado estudiante</title>

        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <script src="https://kit.fontawesome.com/7c748b5f00.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <!cabecera>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>
    <div id="main-header" class="py-2 bg-light text-dark">
        <div class="container">
            <div class="row">
                <div class="col-12" >
                    <h1>
                        <i class="fas fa-users-cog"></i>Control Estudiantes
                    </h1>
                </div>
            </div>
        </div>
    </div>

    <main>
        <!--botones para agregar-->
        <section id="accions" class="py-4" mb-4>
            <div class="container">
                <div class ="col-12 col-md-3">
                    <a href="#" class="btn btn-primary btn-block"  data-bs-toggle="modal" data-bs-target="#addModal">
                        <i class="fas fa-plus"></i>  Agregar Estudiante
                    </a>
                </div>
            </div>
        </section>
        
        <!-- Modal -->
        <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar estudiante</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletEstudianteController?accion=insertar" class="was-validated">
                    <div class="mb-3">
                            <div class="form-group">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" name="nombre" id="nombre" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="apellido" class="form-label">Apellido</label>
                                <input type="text" class="form-control" name="apellido" id="apellido" required>
                            </div>
                            
                             <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" id="email" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Telefono</label>
                                <input type="tel" class="form-control" name="telefono" id="telefono" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="saldo" class="form-label">Saldo</label>
                                <input type="number" class="form-control" name="saldo" id="saldo" step="any" required>
                            </div> 
                        <input type="hidden" name="accion" value="insertar"> 
                    </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>



        <section id="estudiante">
            <div class="container" mt-5 mb-5 pb-5>
                <div class="row">
                    <div class="col-12 col-md-9 ">
                        <div class="hard">
                            <div class="card-header">
                                <h4>Listado estudiantes</h4>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered text-center">
                            <thead class ="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th>Saldo</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="texto">
                                <c:forEach var="estudiante" items="${listadoEstudiante}">
                                    <tr id="titulos">
                                        <td>${estudiante.idEstudiante}</td>
                                        <td>${estudiante.nombre} ${estudiante.apellido}</td>
                                        <td>${estudiante.saldo}</td>
                                        <td>
                                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletEstudianteController?accion=editar&idEstudiante=${estudiante.idEstudiante}">
                                                <i class="far fa-edit"></i>Editar
                                            </a>
                                        </td>
                                        <td> 
                                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletEstudianteController?accion=eliminar&idEstudiante=${estudiante.idEstudiante}">
                                               <i class="fas fa-trash-alt"></i> Eliminar
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-12 col-md-3 mt-5">
                        <div class ="card text-center bg-success text-white mb-3">
                            <div class="card-body">
                                <h3>Saldo total</h3>
                                <h4 class="display-4">
                                    <fmt:formatNumber value="${saldoTotal}" type="currency"/>
                                </h4>  
                            </div>
                        </div>
                        <div class="card  text-center bg-primary text-white mb-3">
                            <div class="card-body">
                                <h3>total de estudiantes</h3>
                                <h4 class="display-4">
                                    <i class="fa fa-user"></i>${totalEstudiantes}
                                </h4>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </section>

    </main>


    <!footer>
    <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

    <!javaScript>
    <script src="../assets/js/jquery-3.6.0.js"></script>
    <script src="../assets/js/bootstrap.bundle.js"></script>
</body>
</html>
