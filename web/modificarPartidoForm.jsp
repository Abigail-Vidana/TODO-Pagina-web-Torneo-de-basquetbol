<%-- 
    Document   : modificarPartidoForm
    Created on : 2/07/2019, 03:45:29 PM
    Author     : abiga
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(pIdPartido);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    ArrayList<Equipo> listaEquipos = new MbdEquipos().traerTodosLosEquipos();
    Partido partido = new MbdPartidos().buscaPartido(idPartido);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificar Partido - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarPartidoDo.jsp" method="POST">
                <input type="hidden" class="form-control" id="idPartido" name="idPartido" value="<%=partido.getIdPartido()%>">
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="equipo_local">Equipo local: </label>
                        <select class="form-control" id="equipo_local" name="equipo_local">
                            <option value="">Seleccione un Equipo</option>
                            <%for(Equipo equipo : listaEquipos){%>
                                <option value="<%=equipo.getIdEquipo()%>"
                                        <% if(partido.getEquipoLocal()== equipo.getIdEquipo()){ %>
                                        <%="selected"%>
                                       <% } %> 
                                    > 
                                    <%=equipo.getNombre()%>
                                </option>
                            <%}%>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="equipo_visitante">Equipo visitante </label>
                        <select class="form-control" id="equipo_visitante" name="equipo_visitante">
                            <option value="">Seleccione un Equipo</option>
                            <%for(Equipo equipo : listaEquipos){%>
                                <option value="<%=equipo.getIdEquipo()%>"
                                        <% if(partido.getEquipoVisitante()== equipo.getIdEquipo()){ %>
                                        <%="selected"%>
                                       <% } %> 
                                    > 
                                    <%=equipo.getNombre()%>
                                </option>
                            <%}%>
                        </select>
                    </div>
                </div>
                 
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fecha">Horario:</label>
                        <input type="datetime-local" class="form-control" id="fecha" name="fecha" placeholder="Horario" 
                                value="<%=formatter.format(partido.getFecha())%>"
                        />
                    </div>
                </div>
                    
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="cancha">Cancha:</label>
                        <input type="text" class="form-control" id="cancha" name="cancha" placeholder="Cancha"/>
                    </div>
                </div> 
                        
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
</html>

