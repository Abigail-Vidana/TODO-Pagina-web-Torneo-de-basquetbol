<%-- 
    Document   : agregarPartidoDo
    Created on : 29/06/2019, 03:01:17 PM
    Author     : abiga
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    Partido partidoCheck = new Partido();
    int equipoLocal = Integer.parseInt(request.getParameter("equipo_local"));
    int equipoVisitante = Integer.parseInt(request.getParameter("equipo_visitante"));
    partidoCheck.setEquipoLocal(equipoLocal);
    partidoCheck.setEquipoVisitante(equipoVisitante);
    partidoCheck.setEstatus("Pendiente");
    boolean existeElPartido = new MbdPartidos().partidoExiste(partidoCheck);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    java.util.Date fecha = formatter.parse(request.getParameter("fecha"));
    String cancha=request.getParameter("cancha");
    
    boolean ver = !(equipoLocal == equipoVisitante || existeElPartido);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha agregado un partido</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%  if(ver==true){
        Partido partido = new Partido();
        partido.setEquipoLocal(equipoLocal);
        partido.setEquipoVisitante(equipoVisitante);
        partido.setFecha(new Timestamp(fecha.getTime()));
        partido.setEstatus("Pendiente");
        partido.setCancha(cancha);
        boolean exito = new MbdPartidos().insertaPartido(partido);
        if(exito){%>
        <div class="jumbotron">
            <h1>Se ha agregado un partido</h1>
            <p>&nbsp;</p>
            <p><b>Equipo local: </b><%=equipoLocal%></p>
            <p><b>Equipo visitante: </b><%=equipoVisitante%></p>
            <p><b>Cancha: </b><%=cancha%></p>
            <p><b>Horario: </b><%=fecha%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
       </div> 
            <%}else{%>
            <div class="jumbotron">
                <h1>Ocurrio un error al agregar el partido</h1>
                <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
            </div>
            <% } %>
            <%}else { %>   
            <div class="jumbotron">
                <h1>No se puede agregar este partido, verifique los datos.</h1>
                <p><a class="btn btn-primary btn-lg" href="agregarPartidoForm.jsp" role="button">Regresar</a></p>
            </div>
            <%}%>
    </body>
</html>
