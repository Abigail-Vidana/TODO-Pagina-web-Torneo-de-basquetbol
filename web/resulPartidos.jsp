<%-- 
    Document   : resulPartidos
    Created on : 4/07/2019, 02:53:44 PM
    Author     : abiga
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    ArrayList<Partido> listaPartidos = new MbdPartidos().traerTodosLosPartidos(); 
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    List<Equipo> listaEquipos = new MbdEquipos().obtenerEquipos();
    Map<Integer, Equipo> equipos = new HashMap<Integer, Equipo>();
    
    for(Equipo equipo : listaEquipos){
       equipos.put(equipo.getIdEquipo(), equipo);
    }
     
    Date fechaHoy = new Date(System.currentTimeMillis());
%>
<!DOCTYPE html> 
<%@ include file="menu.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de partidos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
            <h1>Partidos jugados</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Fecha del partido</th>
                    <th scope="col">Equipo Local</th>
                    <th scope="col">Marcador Local</th>
                    <th scope="col">Equipo visitante</th>
                    <th scope="col">Marcador Visitante</th>
                </tr>
            </thead>
            <tbody>
                 <%for(Partido partido : listaPartidos){
                 Date fechaPartido = partido.getFecha();
                 %>
                <tr>
                    <% if(fechaPartido.before(fechaHoy)){%>
                   <td><%=formatoFecha.format(partido.getFecha())%></td>
                    <td><%=equipos.get(partido.getEquipoLocal()).getNombre()%></td>
                    <td><%=partido.getMarcadorGlobal()%></td>
                    <td><%=equipos.get(partido.getEquipoVisitante()).getNombre()%></td>
                    <td><%=partido.getMarcadorVisitante()%></td>
                </tr>
                    <%}%> 
                <%}%>  
            </tbody>   
        </table>
        
            <h1>Partidos proximos</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Fecha del partido</th>
                    <th scope="col">Equipo Local</th>
                    <th scope="col">Equipo Visitante</th>
                </tr>
            </thead>
            <tbody>
                 <%for(Partido partido : listaPartidos){
                 Date fechaPartido = partido.getFecha();
                 %>
                <tr>
                    <% if(fechaPartido.after(fechaHoy)){%>
                   <td><%=formatoFecha.format(partido.getFecha())%></td>
                    <td><%=equipos.get(partido.getEquipoLocal()).getNombre()%></td>
                    <td><%=equipos.get(partido.getEquipoVisitante()).getNombre()%></td>
                </tr>
                    <%}%> 
                <%}%>  
            </tbody>   
        </table>
            
    </body>
</html>
<%@ include file="base.jsp" %>
