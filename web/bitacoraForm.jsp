<%-- 
    Document   : bitacoraForm
    Created on : 18/07/2019, 03:13:57 PM
    Author     : abiga
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdBitacora"%>
<%@page import="mx.com.develop.objects.Bitacora"%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //traer las listas desde el principio
    ArrayList<Usuario> listaUsuarios = new MbdUsuarios().traerTodosLosUsuarios();
    ArrayList<Bitacora> listaUrls = new MbdBitacora().traerUrls();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //Despues de presionar el boton
    String pIdUsuario = request.getParameter("idUsuario");
    String url = request.getParameter("url");   
    String[] vistas = {"0", "-", "-"};//Inicializo al así el string para que no vaya vacío pos 0 el idUsuario, 1 Url, 2 Vistas
    ArrayList<Bitacora> listaUrlsUsuario = new ArrayList();
    
    if (pIdUsuario != null && url != null) {
        int idUsuario = Integer.parseInt(pIdUsuario);
        listaUrlsUsuario = new MbdBitacora().traerUrlsPorUsuario(idUsuario, url);  // Objetivo del metodo traer las fechas       
        vistas = new MbdBitacora().contadorUrlsPorUsuario(idUsuario, url);   //Traer las vistas y el url consultado;
    } else {

    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Bitacora</title>
        <script type="text/javascript">
            function alertName() {
                if (document.form.idUsuario.value == "") {
                }
                alert("elije un usuario");
            }
        </script>
    </head>
    <body>
        <h1>Bitacora</h1>
        <div id="container" class="container">
            <form action="bitacoraForm.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="Usuario">Usuario:</label>
                        <select class="form-control" id="idUsuario" name="idUsuario">
                            <%  //Aquí la barremos para escribir los valores. En value el id y dentro de option el valor.
                                for (Usuario usuario : listaUsuarios) {%>
                            <option value="<%=usuario.getIdUsuario()%>"<%if (String.valueOf(usuario.getIdUsuario()).contains(vistas[0])) {%>selected<%}%>> <%=usuario.getNombre()%></option>
                            <%}%>                    
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="url">Url:</label>
                        <select class="form-control" id="url" name="url"> 
                            <%  //Aquí la barremos para escribir los valores. En value el id y dentro de option el valor.
                                for (Bitacora bitacora : listaUrls) {%>
                            <option value="<%=bitacora.getURL()%>"<%if (bitacora.getURL().equals(vistas[1])) {%>selected<%}%>><%=bitacora.getURL()%></option>
                            <%}%>                    
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Buscar</button>
            </form>
            <br>
            <!--Tabla de bitacora segun seleccion-->
            <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between align-items-center">Url visitado: <%=vistas[1]%><span class="badge badge-primary badge-pill">Vitas: <%=vistas[2]%></span>
                </li>
            </ul>
            <table class="table">
                <thead>
                    <tr>                                                
                        <th scope="col">Fecha(s)</th>                                                                     
                    </tr>
                </thead>
                <tbody>
                    <% for (Bitacora bitacoraUsuario : listaUrlsUsuario) {%>
                    <tr>                                                
                        <td><%=formatoFecha.format(bitacoraUsuario.getFecha())%></td>                        
                    </tr>
                    <%}%>                    
                </tbody>
            </table>
        </div>   
    </body>
</html>
