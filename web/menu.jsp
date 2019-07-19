<%-- 
    Document   : menu
    Created on : 4/07/2019, 11:17:43 AM
    Author     : abiga
--%>

<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuarioEnSesion = (Usuario)session.getAttribute("usuarioEnSesion");
    if(usuarioEnSesion!=null){
        %> 
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Torneo de Basquetbol</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="equipos.jsp">Equipos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="partidos.jsp">Partidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="usuarios.jsp">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jugadores.jsp">Jugadores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="resulPartidos.jsp">Horario de partidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="posiciones.jsp">Posiciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="bitacoraForm.jsp">Bitacora</a>
                    </li>
                </ul>
            </div>
        </nav>