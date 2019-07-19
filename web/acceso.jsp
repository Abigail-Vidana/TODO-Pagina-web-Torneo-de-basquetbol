<%-- 
    Document   : acceso
    Created on : 29/06/2019, 02:43:57 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    
    Usuario usuario = new MbdUsuarios().buscaUsuario(login, password);
    if(usuario!=null){
        session.setMaxInactiveInterval(3600);
        session.setAttribute("usuarioEnSesion", usuario);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <h1>Bienvenido <%=login%>!</h1>
        <%@ include file="base.jsp" %>
</html>

