<%-- 
    Document   : modificarEquipoForm
    Created on : 29/06/2019, 10:12:15 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdEquipo = request.getParameter("idEquipo");
    int idEquipo = Integer.parseInt(pIdEquipo);
    
    Equipo equipo = new MbdEquipos().buscaEquipo(idEquipo);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificar Equipo - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarEquipoDo.jsp" method="POST" enctype="multipart/form-data">
                <input type="hidden" class="form-control" id="idEquipo" name="idEquipo" value="<%=equipo.getIdEquipo()%>">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%=equipo.getNombre()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="logotipo">Logotipo:</label>
                        <input type="file" class="form-control" id="logotipo" name="logotipo" name="foto" accept="image/png, .jpeg, .jpg, image/gif" 
                        placeholder="Logotipo" value="<%=equipo.getLogotipo()%>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="color_primario">Color primario:</label>
                        <input type="color" class="form-control" id="color_primario" name="color_primario" placeholder="Color primario" value="<%=equipo.getColorPrimario()%>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="color_secundario">Color secundario:</label>
                        <input type="color" class="form-control" id="color_secundario" name="color_secundario" placeholder="Color secundario" value="<%=equipo.getColorSecundario()%>">
                    </div>
                </div>
                    
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="categoria">Categoria:</label>
                            <select class="form-control" id="idEquipo" name="categoria">
                                <option value="">Seleccione una categoria</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
</html>


