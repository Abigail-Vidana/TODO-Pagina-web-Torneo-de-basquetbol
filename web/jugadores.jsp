<%-- 
    Document   : jugadores
    Created on : 29/06/2019, 11:40:24 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.File"%>
<%@page import="mx.com.develop.tools.ImageTools"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<% 
    ArrayList<Jugador> listaJugador = new MbdJugadores().traerTodosLosJugadores();
     String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");
%>
<!DOCTYPE html>
<%@ include file="menu.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de jugadores</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <h2>Administracion de jugadores</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Equipo</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Fecha de nacimiento</th>
                    <th scope="col">Fotografia</th>
                </tr>
            </thead>
            <tbody>
                 <%for(Jugador jugador : listaJugador){
                 File archivoImagen=new File(uploadFolder+jugador.getFotografia());
                 %>
                <tr>
                   <th scope="row"><%=jugador.getIdJugador()%></th>
                    <td><%=jugador.getIdEquipo()%></td>
                    <td><%=jugador.getNombre()%></td>
                    <td><%=jugador.getDireccion()%></td>
                    <td><%=jugador.getFechaDeNacimiento().toString()%></td>
                    <td> 
                      <img style="display:block; width:auto;height:80px;" src="<%=ImageTools.encodeFileToBase64Binary(archivoImagen) %>" />
                    </td>
                    <td><a class="btn btn-primary btn-lg" href="modificarJugadorForm.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarJugadorDo.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>  
            </tbody>
            <tfoot>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><p><a class="btn btn-primary btn-lg" href="agregarJugadorForm.jsp" role="button">Agregar</a></p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </tfoot>
        </table>
    </body>
</html>
<%@ include file="base.jsp" %>
