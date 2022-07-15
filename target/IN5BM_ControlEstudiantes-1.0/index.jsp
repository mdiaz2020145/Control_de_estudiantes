<%-- 
    Document   : index
    Created on : 25/08/2021, 09:27:46 AM
    Author     : doazm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FUNDACION KINAL</title>
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
    </head>
    <body>
        <!cabecera>
    <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>
        <main>
            <section id="contenido">
                <p class="descripcion">
                    Kinal es un Centro Educativo privado, no lucrativo, dirigido a la formación técnica profesional de jóvenes y adultos, de beneficio colectivo y asistencia social en favor de los sectores más necesitados de la comunidad.
                </p>    

                <img id="kinal-img-principal" src="./assets/images/principal.png">
                <p class="descripcion">
                    Nuestro valor fundamental es enseñar a realizar el trabajo bien hecho, que sea la base de la superación de alumnos y el medio para servir a los demás.
                </p>

                <br>

            </section>
        </main>
     <!footer>
    <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>
    
    <!javaScript>
    <script src="assets/js/jquery-3.6.0.js"></script>
    <script src="assets/js/bootstrap.bundle.js"></script>
    
    </body>
</html>
