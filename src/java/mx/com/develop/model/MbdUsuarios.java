package mx.com.develop.model;


import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import mx.com.develop.objects.Usuario;

public class MbdUsuarios extends Mbd {

    public MbdUsuarios() throws NamingException {
        super();
    }

    public boolean insertaUsuario(Usuario usuario) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("INSERT INTO usuario (nombre,login,password,email) VALUES(?,?,?,?)");
                ps.setString(1, usuario.getNombre());
                ps.setString(2, usuario.getLogin());
                ps.setString(3, usuario.getPassword());
                ps.setString(4, usuario.getEmail());
                ps.executeUpdate();
           /* stmt.executeUpdate("INSERT INTO usuario (nombre,login,password,email) VALUES("
                    + "'" + usuario.getNombre() + "',"
                    + "'" + usuario.getLogin() + "',"
                    + "'" + usuario.getPassword() + "',"
                    + "'" + usuario.getEmail() + "')");*/
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public Usuario buscaUsuario(int idUsuario) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Usuario usuario = null;
        try {
            //rst = stmt.executeQuery("SELECT * FROM usuario WHERE idUsuario=" + idUsuario);
            ps = conn.prepareStatement("SELECT * FROM usuario WHERE idUsuario=?");
                ps.setInt(1, idUsuario);
                rst = ps.executeQuery();
                
            if (rst.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rst.getInt(1));
                usuario.setNombre(rst.getString(2));
                usuario.setLogin(rst.getString(3));
                usuario.setPassword(rst.getString(4));
                usuario.setEmail(rst.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return usuario;
    }

    public Usuario buscaUsuario(String login, String password) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Usuario usuario = null;
        try {
            //rst = stmt.executeQuery("SELECT * FROM usuario WHERE login='" + login + "' AND password='" + password + "'");
            ps = conn.prepareStatement("SELECT * FROM usuario WHERE login=? AND password=?");
                ps.setString(1, login);
                ps.setString(2, password);
                rst = ps.executeQuery();
            
            if (rst.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rst.getInt(1));
                usuario.setNombre(rst.getString(2));
                usuario.setLogin(rst.getString(3));
                usuario.setPassword(rst.getString(4));
                usuario.setEmail(rst.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return usuario;
    }

    public ArrayList<Usuario> traerTodosLosUsuarios() throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Usuario> usuarios = new ArrayList<>();

        try {

            //rst = stmt.executeQuery("SELECT * FROM usuario ORDER BY nombre");
            ps = conn.prepareStatement("SELECT * FROM usuario ORDER BY nombre");
            rst = ps.executeQuery();
            
            while (rst.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rst.getInt(1));
                usuario.setNombre(rst.getString(2));
                usuario.setLogin(rst.getString(3));
                usuario.setPassword(rst.getString(4));
                usuario.setEmail(rst.getString(5));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return usuarios;
    }

    public void eliminaUsuario(int idUsuario) throws SQLException, NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            //stmt.executeUpdate("DELETE FROM usuario WHERE idUsuario=" + idUsuario);
            ps = conn.prepareStatement("DELETE FROM usuario WHERE idUsuario=?");
                ps.setInt(1, idUsuario);
                ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaUsuario(Usuario usuario) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps= conn.prepareStatement("UPDATE usuario SET nombre=? , login=? , password=?, email=? WHERE idUsuario=?");
                ps.setString(1, usuario.getNombre());
                ps.setString(2,  usuario.getLogin());
                ps.setString(3, usuario.getPassword());
                ps.setString(4,  usuario.getEmail());
                ps.setInt(5, usuario.getIdUsuario());
                ps.executeUpdate();
            /*stmt.executeUpdate("update usuario set "
                    + "nombre='" + usuario.getNombre() + "',"
                    + "login='" + usuario.getLogin() + "',"
                    + "password='" + usuario.getPassword() + "',"
                    + "email='" + usuario.getEmail() + "' where idUsuario="+usuario.getIdUsuario());*/
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

}

