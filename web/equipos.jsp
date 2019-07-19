<%-- 
    Document   : equipos
    Created on : 29/06/2019, 08:35:33 PM
    Author     : abiga
--%>

<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.File"%>
<%@page import="mx.com.develop.tools.ImageTools"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
     ArrayList<Equipo> listaEquipo = new MbdEquipos().traerTodosLosEquipos();
     String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");
%>
<!DOCTYPE html>
<%@ include file="menu.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de equipos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <h2>Administracion de equipos</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Logotipo</th>
                    <th scope="col">Colores</th>
                    <th scope="col">Categoria</th>
                </tr>
            </thead>
            <tbody>
                 <%for(Equipo equipo : listaEquipo){
                 File archivoImagen=new File(uploadFolder+equipo.getLogotipo());
                 %>
                 <tr>
                    <th scope="row"><%=equipo.getIdEquipo()%></th>
                    <td><%=equipo.getNombre()%></td>
                    <td> 
                      <img style="display:block; width:auto;height:80px;" src="<%=ImageTools.encodeFileToBase64Binary(archivoImagen) %>" /></td>
                    <td>
                        <div style="height:80px; width:80px; overflow:hidden; background-color:<%=equipo.getColorPrimario()%>;">
                        <div style="width:0; height:0; border-top:80px solid <%=equipo.getColorSecundario()%>; border-right:80px solid transparent;"></div>
                        </div>
                    </td>
                    <td><%=equipo.getCategoria()%></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarEquipoForm.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarEquipoDo.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>  
            </tbody>
            <tfoot>
                <tr> 
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><p><a class="btn btn-primary btn-lg" href="agregarEquipoForm.jsp" role="button">Agregar</a></p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </tfoot>
        </table>
    </body>
</html>
<%@ include file="base.jsp" %>
