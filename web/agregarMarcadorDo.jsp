<%-- 
    Document   : agregarMarcadorDo
    Created on : 2/07/2019, 09:51:44 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String IdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(IdPartido);
    String marcadorGlobal = request.getParameter("marcador_global");
    String marcadorVisitante = request.getParameter("marcador_visitante");
    int marcador_local = marcadorGlobal != null? Integer.parseInt("0"+marcadorGlobal): 0;
    int marcador_visitante = marcadorVisitante != null? Integer.parseInt("0"+marcadorVisitante): 0;
    String estatus = request.getParameter("estatus");
    
    Partido partido = new Partido();
    partido.setIdPartido(idPartido);
    partido.setMarcadorGlobal(marcador_local);
    partido.setMarcadorVisitante(marcador_visitante);
    partido.setEstatus(estatus);
 
    boolean exito = new MbdPartidos().actualizaMarcador(partido);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha agregado nuevo marcador</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha agregado nuevo marcador</h1>
            <p>&nbsp;</p>
            <p><b>Marcador local: </b><%=marcador_local%></p>
            <p><b>Marcador visitante: </b><%=marcador_visitante%></p>
            <p><b>Estatus:</b> <%=estatus%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
       </div> 
            <%}else{%>
            <div class="jumbotron">
                <h1>Ocurrio un error al agregar el marcador</h1>
                <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
            </div>
            <%}%>
    </body>
</html>

