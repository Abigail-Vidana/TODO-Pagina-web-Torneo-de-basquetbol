<%-- 
    Document   : eliminarPartidoDo
    Created on : 2/07/2019, 04:30:41 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(pIdPartido);
    Partido partido = new MbdPartidos().buscaPartido(idPartido);
   
    new MbdPartidos().eliminaPartido(idPartido);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha eliminado un partido</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="jumbotron">
            <h1>Se ha eliminado un partido</h1>
            <p>&nbsp;</p>
            <p><b>Equipo local: </b> <%=partido.getEquipoLocal()%></p>
            <p><b>Equipo visitante: </b> <%=partido.getEquipoVisitante()%></p>
            <p><b>Cancha: </b> <%=partido.getCancha()%></p>
            <p><b>Horario: </b> <%=partido.getFecha()%></p>
            <p><b>Estatus: </b> <%=partido.getEstatus()%></p>
            <p><b>Marcador local: </b> <%=partido.getMarcadorGlobal()%></p>
            <p><b>Marcador visitante: </b> <%=partido.getMarcadorVisitante()%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
    </body>
</html>