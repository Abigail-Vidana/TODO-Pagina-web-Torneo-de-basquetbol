<%-- 
    Document   : agregarPartidoForm
    Created on : 29/06/2019, 03:08:50 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    ArrayList<Equipo> listaEquipos = new MbdEquipos().traerTodosLosEquipos();  
%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Agregar Partido - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="agregarPartidoDo.jsp" method="POST">
            
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="equipo_local">Equipo local: </label>
                        <select class="form-control" id="equipo_local" name="equipo_local">
                            <option value="">Seleccione un Equipo</option>
                            <%for(Equipo equipo : listaEquipos){%>
                                <option value="<%=equipo.getIdEquipo()%>" 
                                    > 
                                    <%=equipo.getNombre()%>
                                </option>
                            <%}%> 
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="equipo_visitante">Equipo visitante: </label>
                        <select class="form-control" id="equipo_visitante" name="equipo_visitante">
                            <option value="" >Seleccione un Equipo</option>
                            <%for(Equipo equipo : listaEquipos){%>
                                <option value="<%=equipo.getIdEquipo()%>" 
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
                        <input type="datetime-local" class="form-control" id="fecha" name="fecha" placeholder="Horario"/>
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
