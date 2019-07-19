<%-- 
    Document   : eliminarJugadorDo
    Created on : 30/06/2019, 02:40:34 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdJugador = request.getParameter("idJugador");
    int idJugador = Integer.parseInt(pIdJugador);
    Jugador jugador = new MbdJugadores().buscaJugador(idJugador);
    
    new MbdJugadores().eliminaJugador(idJugador);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha eliminado un jugador</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="jumbotron">
            <h1>Se ha eliminado un jugador</h1>
            <p>&nbsp;</p>
            <p><b>Equipo:</b> <%=jugador.getIdEquipo()%></p>
            <p><b>Nombre:</b> <%=jugador.getNombre()%></p>
            <p><b>Direccion:</b> <%=jugador.getDireccion()%></p>
            <p><b>Fecha de nacimiento:</b> <%=jugador.getFechaDeNacimiento()%></p>
            <p><b>Fotografia:</b> <%=jugador.getFotografia()%></p>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
    </body>
</html>