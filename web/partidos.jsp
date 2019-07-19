<%-- 
    Document   : partidos
    Created on : 1/07/2019, 02:43:49 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Partido> listaPartido = new MbdPartidos().traerTodosLosPartidos();
%>
<!DOCTYPE html>
<%@ include file="menu.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de partidos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <h2>Administracion de partidos</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Equipo local</th>
                    <th scope="col">Equipo visitante</th>
                    <th scope="col">Fecha del juego</th>
                    <th scope="col">Estatus</th>
                    <th scope="col">Marcador Local</th>
                    <th scope="col">Marcador Visitante</th>
                    <th scope="col">Cancha</th>
                </tr>
            </thead>
            <tbody>
                 <%for(Partido partido : listaPartido){%>
                <tr>
                    <th scope="row"><%=partido.getIdPartido()%></th>
                    <td><%=partido.getEquipoLocal()%></td>
                    <td><%=partido.getEquipoVisitante()%></td>
                    <td><%=partido.getFecha()%></td>
                    <td><%=partido.getEstatus()%></td>
                    <td><%=partido.getMarcadorGlobal()%></td>
                    <td><%=partido.getMarcadorVisitante()%></td>
                    <td><%=partido.getCancha()%></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarPartidoForm.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarPartidoDo.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Eliminar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="agregarMarcadorForm.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Marcador</a></td>
                </tr>
                <%}%>  
            </tbody>
            <tfoot>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><p><a class="btn btn-primary btn-lg" href="agregarPartidoForm.jsp" role="button">Agregar partido</a></p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>  
            </tfoot>
        </table>
    </body>
</html>
<%@ include file="base.jsp" %>