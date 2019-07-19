<%-- 
    Document   : posiciones
    Created on : 4/07/2019, 03:51:26 PM
    Author     : abiga
--%>

<%@page import="java.util.List"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    List<Equipo> equipos = new MbdEquipos().obtenerPosiciones();
    int lugar =0;
%>
<!DOCTYPE html>
<%@ include file="menu.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de posiciones</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <h1>Posiciones de los equipos</h1>
        <table class="table">
        <thead>
            <tr>
                <th scope="col">Lugar</th>
                <th scope="col">Equipo</th>
                <th scope="col">#</th>
                <th scope="col">Puntos</th>
                <th scope="col">Puntos a Favor</th>
                <th scope="col">Puntos en Contra</th>
                <th scope="col">Diferencia de puntos</th>
                <th scope="col">Perdidos por Default</th>
            </tr>
       </thead>
       <tbody>
            <%for(Equipo equipo : equipos){ %>
              <tr>
                 <td><%=++lugar%></td>
                  <td><%=equipo.getNombre()%></td>
                  <td><%=equipo.getIdEquipo()%></td>
                  <td><%=equipo.getPuntos()%></td>
                  <td><%=equipo.getPuntosFavor()%></td>
                  <td><%=equipo.getPuntosContra()%></td>
                  <td><%=(equipo.getPuntosFavor()-equipo.getPuntosContra())%></td>
                  <td><%=equipo.getPerdidosDefault()%></td>
              </tr>
              <%}%>  
       </tbody>
    </body>
</html>
<%@ include file="base.jsp" %>