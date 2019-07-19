<%-- 
    Document   : eliminarEquipoDo
    Created on : 29/06/2019, 10:57:20 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdEquipo = request.getParameter("idEquipo");
    int idEquipo = Integer.parseInt(pIdEquipo);
 
    int jugadores = 0;
    int partidosL = 0;
    int partidosV = 0;
    boolean exito = true;
    
    ArrayList<Partido> listaPartidos = new MbdPartidos().traerTodosLosPartidos();
    for(Partido partido : listaPartidos){
        if(idEquipo==partido.getEquipoLocal()){
            partidosL++;
    }
        if(idEquipo==partido.getEquipoVisitante()){
            partidosV++;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha eliminado un equipo</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%
            ArrayList<Jugador> listaJugadores = new MbdJugadores().traerTodosLosJugadores();
            for (Jugador jugador : listaJugadores) {
                if (idEquipo == jugador.getIdEquipo()) {
                    jugadores++;
                }
            }
            
            if (jugadores == 0 && partidosV == 0 && partidosL == 0) {
                Equipo equipo = new MbdEquipos().buscaEquipo(idEquipo);
                new MbdEquipos().eliminaEquipo(idEquipo);

        %>
        <div class="jumbotron">
            <h1>Se ha eliminado un usuario</h1>
            <p>&nbsp;</p>
            <p><b>Nombre: </b> <%=equipo.getNombre()%></p>
            <p><b>Logotipo: </b> <%=equipo.getLogotipo()%></p>
            <p><b>Color primario: </b> <%=equipo.getColorPrimario()%></p>
            <p><b>Color secundario: </b> <%=equipo.getColorSecundario()%></p>
            <p><b>Categoria: </b> <%=equipo.getCategoria()%></p>
            <p><a class="btn btn-primary btn-lg" href="equipos.jsp" role="button">Regresar</a></p>
        </div>
            <%
        } else {
        %>
        <div class="jumbotron">
            <h1>No se puede eliminar este equipo</h1>
            <p><b>Tiene :</b> <%=jugadores%><b> jugadores</b> </p>
            <p><b>Tiene :</b> <%=partidosL%><b> partidos de local</b></p>
            <p><b>Tiene :</b> <%=partidosV%><b> partidos de visitante</b></p>
            <p><a class="btn btn-primary btn-lg" href="equipos.jsp" role="button">Regresar</a></p>
        </div>
        <%
            }
        %>
    </body>
</html>

