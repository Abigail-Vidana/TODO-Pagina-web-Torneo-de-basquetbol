<%-- 
    Document   : agregarMarcadorForm
    Created on : 2/07/2019, 09:59:02 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pIdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(pIdPartido);
    Partido partido = new MbdPartidos().buscaPartido(idPartido);
%>
<!DOCTYPE html>
<html>
     <head>
        <title>Marcadores - TODO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!--<link rel="stylesheet" href="./css/bootstrap.min.css">-->
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="agregarMarcadorDo.jsp" method="POST">
                <input type="hidden" class="form-control" id="idPartido" name="idPartido" value="<%=partido.getIdPartido()%>">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="marcador_global">Marcador Local:</label>
                        <input type="number" class="form-control" id="marcador_global" name="marcador_global" placeholder="Marcador local"/>
                    </div>
                </div>  
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="marcador_visitante">Marcador Visitante:</label>
                        <input type="number" class="form-control" id="marcador_visitante" name="marcador_visitante" placeholder="Marcador visitante"/>
                    </div>
                </div>
                 <div class="form-row">
                    <div class="form-group col-md-6">
                    <label for="estatus">Estatus: </label>
                        <select class="form-control" id="estatus" name="estatus">
                            <option value="Pendiente" <% if(partido.getEstatus() == "Pendiente"){%> selected<%}%>>Pendiente</option> 
                            <option value="Jugado" <% if(partido.getEstatus() == "Jugado"){%> selected<%}%>>Jugado</option>
                            <option value="Default local" <% if(partido.getEstatus() == "Default local"){%> selected<%}%>>Default local</option>
                            <option value="Default visitante" <% if(partido.getEstatus() == "Default visitante"){%> selected<%}%>>Default visitante</option>
                        </select>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
    </body>
</html>
