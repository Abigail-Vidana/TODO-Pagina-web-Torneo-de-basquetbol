package mx.com.develop.bitacora;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import mx.com.develop.model.MbdUsuarios;
import mx.com.develop.objects.Usuario;
import mx.com.develop.objects.Bitacora;
import mx.com.develop.model.MbdBitacora;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
/**
 *
 * @author abiga
 */
public class BitacoraFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chainObj) throws IOException, ServletException {

        final HttpServletRequest req = (HttpServletRequest) request;
        //final HttpServletResponse res = (HttpServletResponse) response;

        final String requestUri = req.getRequestURI();
        
        if (requestUri != null) {
            HttpSession session = req.getSession();
           // System.out.println("REQUEST_URI: " + requestUri);
            Usuario usuario;
            try {
                usuario = (Usuario)session.getAttribute("usuarioEnSesion");
                if(usuario == null){
                    
                    String login = request.getParameter("login");
                    String password = request.getParameter("password");
                    usuario = new MbdUsuarios().buscaUsuario(login, password);
                }
                if (usuario != null) {
                int idUsuario = usuario.getIdUsuario();

                Timestamp fecha = new Timestamp(System.currentTimeMillis());

                Bitacora bitacora = new Bitacora();
                bitacora.setIdUsuario(idUsuario);
                bitacora.setURL(requestUri.substring(16));
                bitacora.setFecha(fecha);
                boolean exito = new MbdBitacora().insertaBitacora(bitacora);

            } else {
                System.out.println("Usuario no existe");
            }
            } catch (SQLException ex) {
                Logger.getLogger(BitacoraFilter.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NamingException ex) {
                Logger.getLogger(BitacoraFilter.class.getName()).log(Level.SEVERE, null, ex);
            }           
        }
        chainObj.doFilter(request, response);
    }

    public void destroy() {
    }

}