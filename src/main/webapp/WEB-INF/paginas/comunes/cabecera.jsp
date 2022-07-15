<%-- 
    Document   : cabecera
    Created on : 1/09/2021, 11:07:53 AM
    Author     : doazm
--%>
<header id="kinal-header">
    <h1>Centro Educativo y Técnico laboral Fundación KINAL</h1>
</header>    
<nav class="navbar navbar-expand-lg navbar-dark bg-black">
<div class="container-fluid">
    <a class="navbar-brand" href="#">Menu</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/ServletEstudianteController?accion=listar">Estudiante</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Materias</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Inscripciones</a>
            </li>
        </ul>
    </div>
</div>
</nav>
                       
                    
