<%-- 
    Document   : usuarios
    Created on : 29/06/2019, 08:37:46 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Usuario> listaUsuarios = new MbdUsuarios().traerTodosLosUsuarios();
%>

<!DOCTYPE html>
<%@ include file="menu.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Administración de usuarios</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <h2>Administracion de usuarios</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Usuario</th>
                    <th scope="col">Contraseña</th>
                    <th scope="col">Correo</th>
                </tr>
            </thead>
            <tbody>
                <%for(Usuario usuario : listaUsuarios){%>
                <tr>
                    <th scope="row"><%=usuario.getIdUsuario()%></th>
                    <td><%=usuario.getNombre()%></td>
                    <td><%=usuario.getLogin()%></td>
                    <td><%=usuario.getPassword()%></td>
                    <td><%=usuario.getEmail()%></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarUsuarioForm.jsp?idUsuario=<%=usuario.getIdUsuario()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarUsuarioDo.jsp?idUsuario=<%=usuario.getIdUsuario()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><p><a class="btn btn-primary btn-lg" href="agregarUsuarioForm.jsp" role="button">Agregar</a></p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </tfoot>
        </table>
    </body>
</html>
<%@ include file="base.jsp" %>