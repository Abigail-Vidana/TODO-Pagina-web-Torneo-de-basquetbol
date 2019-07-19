<%-- 
    Document   : modificarPartidoDo
    Created on : 2/07/2019, 03:45:13 PM
    Author     : abiga
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    int idPartido = Integer.parseInt(request.getParameter("idPartido"));
    String equipo_local = request.getParameter("equipo_local");
    String equipo_visitante = request.getParameter("equipo_visitante");
    int idLocal = Integer.parseInt(equipo_local);
    int idVisitante = Integer.parseInt(equipo_visitante);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    java.util.Date fecha = formatter.parse(request.getParameter("fecha"));
    String cancha=request.getParameter("cancha");
    
    Partido partido = new MbdPartidos().buscaPartido(idPartido);
    partido.setEquipoLocal(idLocal);
    partido.setEquipoVisitante(idVisitante);
    partido.setFecha(new Timestamp(fecha.getTime()));
    partido.setCancha(cancha);
   
    boolean exito = new MbdPartidos().actualizaPartido(partido);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha modificado un jugador</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha modificado un jugador</h1>
            <p>&nbsp;</p>
            <p><b>Equipo local:</b> <%=equipo_local%></p>
            <p><b>Equipo visitante:</b> <%=equipo_visitante%></p>
            <p><b>Cancha: </b><%=cancha%></p>
            <p><b>Horario:</b> <%=fecha%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrio un error al modificar el jugador</h1>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
</html>

