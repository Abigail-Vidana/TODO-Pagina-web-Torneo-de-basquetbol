<%-- 
    Document   : eliminarUsuarioForm
    Created on : 29/06/2019, 09:02:24 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.objects.Usuario"%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdUsuario = request.getParameter("idUsuario");
    int idUsuario = Integer.parseInt(pIdUsuario);
    Usuario usuario = new MbdUsuarios().buscaUsuario(idUsuario);
    
    new MbdUsuarios().eliminaUsuario(idUsuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha eliminado un usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="jumbotron">
            <h1>Se ha eliminado un usuario</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=usuario.getNombre()%></p>
            <p><b>Login:</b> <%=usuario.getLogin()%></p>
            <p><b>Correo:</b> <%=usuario.getEmail()%></p>
            <p><a class="btn btn-primary btn-lg" href="usuarios.jsp" role="button">Regresar</a></p>
        </div>
    </body>
</html>
