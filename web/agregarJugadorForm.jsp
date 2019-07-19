<%-- 
    Document   : agregarJugadorForm
    Created on : 29/06/2019, 03:05:52 PM
    Author     : abiga
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%
    ArrayList<Equipo> equipos = new MbdEquipos().traerTodosLosEquipos();
%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Agregar Jugador - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="agregarJugadorDo.jsp" method="POST" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="idEquipo">Equipo:</label>
                        <select class="form-control" id="idEquipo" name="idEquipo">
                            <option value="">Seleccione un Equipo</option>
                            <%for(Equipo equipo : equipos){%>
                            <option value="<%=equipo.getIdEquipo()%>" >
                                    <%=equipo.getNombre()%>
                                </option>
                            <%}%>
                          
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="direccion">Direccion:</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Direccion">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="foto">Fotografia:</label>
                        <input type="file" class="form-control" id="foto" name="foto" 
                        accept="image/png, .jpeg, .jpg, image/gif"placeholder="Fotografia">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fecha_nacimiento">Fecha de nacimiento:</label>
                        <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" placeholder="Fecha de nacimiento">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
</html>