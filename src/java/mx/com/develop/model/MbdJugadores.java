package mx.com.develop.model;

import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import mx.com.develop.objects.Jugador;

public class MbdJugadores extends Mbd {

    public MbdJugadores() throws NamingException {
        super();
    }
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm");
    public boolean insertaJugador(Jugador jugador) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("INSERT INTO jugador (idEquipo,nombre,direccion,fecha_nacimiento,foto) VALUES(?,?,?,?,?)");
                ps.setInt(1, jugador.getIdEquipo());
                ps.setString(2, jugador.getNombre());
                ps.setString(3, jugador.getDireccion());
                ps.setString(4, jugador.getFechaDeNacimiento().toString());
                ps.setString(5, jugador.getFotografia());
                ps.executeUpdate();
            /*stmt.executeUpdate("INSERT INTO jugador (idEquipo,nombre,direccion,fecha_nacimiento,foto) VALUES("
                    + jugador.getIdEquipo() + ","
                    + "'" + jugador.getNombre() + "',"
                    + "'" + jugador.getDireccion()+ "',"
                    + "'" + jugador.getFechaDeNacimiento().toString()+ "',"
                    + "'" + jugador.getFotografia() + "')");*/
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public Jugador buscaJugador(int idJugador) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Jugador jugador = null;
        try {
            //rst = stmt.executeQuery("SELECT idJugador,idEquipo, nombre, direccion, fecha_nacimiento, foto FROM jugador WHERE idJugador=" + idJugador);
            ps = conn.prepareStatement("SELECT idJugador,idEquipo, nombre, direccion, fecha_nacimiento, foto FROM jugador WHERE idJugador=?");
                ps.setInt(1, idJugador);
                 rst = ps.executeQuery();
            
            if (rst.next()) {
                jugador = new Jugador();
                jugador.setIdJugador(rst.getInt(1));
                jugador.setIdEquipo(rst.getInt(2));
                jugador.setNombre(rst.getString(3));
                jugador.setDireccion(rst.getString(4));
                jugador.setFechaDeNacimiento(rst.getDate(5));
                jugador.setFotografia(rst.getString(6));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return jugador;
    }

    public ArrayList<Jugador> traerTodosLosJugadores() throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Jugador> jugadores = new ArrayList<>();

        try {

            //rst = stmt.executeQuery("SELECT idJugador,idEquipo, nombre, direccion, fecha_nacimiento, foto FROM jugador ORDER BY nombre");
            ps = conn.prepareStatement("SELECT idJugador,idEquipo, nombre, direccion, fecha_nacimiento, foto FROM jugador ORDER BY nombre");
             rst = ps.executeQuery();
             
            while (rst.next()) {
                Jugador jugador = new Jugador();
                jugador.setIdJugador(rst.getInt(1));
                jugador.setIdEquipo(rst.getInt(2));
                jugador.setNombre(rst.getString(3));
                jugador.setDireccion(rst.getString(4));
                jugador.setFechaDeNacimiento(rst.getDate(5));
                jugador.setFotografia(rst.getString(6));
                jugadores.add(jugador);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return jugadores;
    }

    public void eliminaJugador(int idJugador) throws SQLException, NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
           // stmt.executeUpdate("DELETE FROM jugador WHERE idJugador=" + idJugador);
           ps = conn.prepareStatement("DELETE FROM jugador WHERE idJugador=?");
            ps.setInt(1, idJugador);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaJugador(Jugador jugador) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("UPDATE jugador SET nombre=? , direccion=? , fecha_nacimiento=? , "
                    + "idEquipo=? , foto=? WHERE idJugador=?");
                ps.setString(1, jugador.getNombre());
                ps.setString(2, jugador.getDireccion());
                ps.setObject(3, jugador.getFechaDeNacimiento());
                ps.setInt(4, jugador.getIdEquipo());
                ps.setString(5, jugador.getFotografia());
                ps.setInt(6, jugador.getIdJugador());
                ps.executeUpdate();
            /*stmt.executeUpdate("update jugador set " 
                    + "nombre='" + jugador.getNombre() + "',"
                    + "direccion='" + jugador.getDireccion() + "',"
                    + "fecha_nacimiento='" + jugador.getFechaDeNacimiento() + "',"
                    + "idEquipo='" + jugador.getIdEquipo() + "',"
                    + "foto='" + jugador.getFotografia() + "' where idJugador="+ jugador.getIdJugador());*/
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



