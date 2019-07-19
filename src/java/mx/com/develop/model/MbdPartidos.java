package mx.com.develop.model;

import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import mx.com.develop.objects.Partido;

public class MbdPartidos extends Mbd {

    public MbdPartidos() throws NamingException {
        super();
    }
   java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm");
    public boolean insertaPartido(Partido partido) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            
            
            System.out.println("INSERT INTO partido (equipo_local,equipo_visitante,Estatus,marcador_global,marcador_visitante,fecha) VALUES("
                    + partido.getEquipoLocal() + ","
                    + partido.getEquipoVisitante() + ","
                    + partido.getEstatus() + ","
                    + partido.getMarcadorGlobal() + ","
                    + partido.getMarcadorVisitante() + ","
                    + "'" + partido.getFecha() + "')");
            
            ps = conn.prepareStatement("INSERT INTO partido (equipo_local,equipo_visitante,Estatus,marcador_global,marcador_visitante,fecha,cancha) VALUES(?,?,?,?,?,?,?);");
                ps.setInt(1, partido.getEquipoLocal());
                ps.setInt(2, partido.getEquipoVisitante());
                ps.setString(3, partido.getEstatus());
                ps.setInt(4, partido.getMarcadorGlobal());
                ps.setInt(5, partido.getMarcadorVisitante());
                ps.setObject(6, sdf.format(partido.getFecha()));
                ps.setString(7, partido.getCancha());
                ps.executeUpdate();
            /*stmt.executeUpdate("INSERT INTO partido (equipo_local,equipo_visitante,Estatus,marcador_global,marcador_visitante,fecha) VALUES("
                    + partido.getEquipoLocal() + ","
                    + "'" + partido.getEquipoVisitante()+ "',"
                    + "'" + partido.getEstatus() + "',"
                    + "'" + partido.getMarcadorGlobal() + "',"
                    + "'" + partido.getMarcadorVisitante()+ "',"
                    + "'" + partido.getFecha() + "')");*/

            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public Partido buscaPartido(int idPartido) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Partido partido = null;
        try {
            //rst = stmt.executeQuery("SELECT idPartido, equipo_local, equipo_visitante, Estatus, marcador_global, marcador_visitante, fecha FROM partido WHERE idPartido=" + idPartido);
            ps = conn.prepareStatement("SELECT idPartido, equipo_local, equipo_visitante, Estatus, marcador_global, marcador_visitante, fecha,cancha FROM partido WHERE idPartido=?");
            ps.setInt(1, idPartido);
            rst = ps.executeQuery();
            
            if (rst.next()) {
                partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getString(4));
                partido.setMarcadorGlobal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setFecha(new java.sql.Timestamp(rst.getTimestamp(7).getTime()));
                partido.setCancha(rst.getString(8));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partido;
    }
    public boolean partidoExiste(Partido partido) throws SQLException, NamingException {
        getConexion();
        boolean existe = false;
        try {
            
            ps = conn.prepareStatement("SELECT count(*) FROM partido WHERE equipo_local=? and equipo_visitante=? and Estatus =?");
            ps.setInt(1, partido.getEquipoLocal());
            ps.setInt(2, partido.getEquipoVisitante());
            ps.setString(3, partido.getEstatus());
            rst = ps.executeQuery();
            
            if (rst.next()) {
                int count = rst.getInt(1);
                existe = count > 0;
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return existe;
    }

    public ArrayList<Partido> traerTodosLosPartidos() throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Partido> partidos = new ArrayList<>();

        try {

            //rst = stmt.executeQuery("SELECT idPartido,equipo_local, equipo_visitante, Estatus, marcador_global, marcador_visitante, fecha FROM partido ORDER BY fecha");
            ps = conn.prepareStatement("SELECT idPartido,equipo_local, equipo_visitante, Estatus, marcador_global, marcador_visitante, fecha,cancha FROM partido ORDER BY fecha");
            rst = ps.executeQuery();
            
            while (rst.next()) {
                Partido partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getString(4));
                partido.setMarcadorGlobal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setFecha(new java.sql.Timestamp(rst.getTimestamp(7).getTime()));
                partido.setCancha(rst.getString(8));
                partidos.add(partido);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partidos;
    }

    public void eliminaPartido(int idPartido) throws SQLException, NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            //stmt.executeUpdate("DELETE FROM partido WHERE idPartido=" + idPartido);
            ps = conn.prepareStatement("DELETE FROM partido WHERE idPartido= ?");
            ps.setInt(1, idPartido);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaPartido(Partido partido) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            System.out.println("update partido set "
                    + "equipo_local='" + partido.getEquipoLocal() + "',"
                    + "equipo_visitante='" + partido.getEquipoVisitante()+ "',"
                    + "Estatus='" + partido.getEstatus() + "',"
                    + "marcador_global='" + partido.getMarcadorGlobal() + "',"
                    + "marcador_visitante='" + partido.getMarcadorVisitante()+ "',"
                    + "fecha='" + partido.getFecha() + "' where idPartido="+partido.getIdPartido());
            ps = conn.prepareStatement("UPDATE partido SET equipo_local= ?, equipo_visitante= ?,"
                    +  "fecha=?, cancha=? WHERE idPartido =?");
                    ps.setInt(1, partido.getEquipoLocal());
                    ps.setInt(2, partido.getEquipoVisitante());
                    ps.setObject(3, sdf.format(partido.getFecha()));
                    ps.setString(4, partido.getCancha());
                    ps.setInt(5, partido.getIdPartido());
                    ps.executeUpdate();
      
            /*stmt.executeUpdate("update partido set "
                    + "equipo_local='" + partido.getEquipoLocal() + "',"
                    + "equipo_visitante='" + partido.getEquipoVisitante()+ "',"
                    + "Estatus='" + partido.getEstatus() + "',"
                    + "marcador_global='" + partido.getMarcadorGlobal() + "',"
                    + "marcador_visitante='" + partido.getMarcadorVisitante()+ "',"
                    + "fecha='" + partido.getFecha() + "' where idPartido="+partido.getIdPartido());*/

            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }


    public boolean actualizaMarcador(Partido partido) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("UPDATE partido SET Estatus=? , marcador_global=?, marcador_visitante=? WHERE idPartido =?");
            ps.setString(1, partido.getEstatus());
            ps.setInt(2, partido.getMarcadorGlobal());
            ps.setInt(3, partido.getMarcadorVisitante());
            ps.setInt(4, partido.getIdPartido());
            ps.executeUpdate();
            /*stmt.executeUpdate("update partido set "
                    + "Estatus='" + partido.getEstatus() + "',"
                    + "marcador_global='" + partido.getMarcadorGlobal() + "',"
                    + "marcador_visitante='" + partido.getMarcadorVisitante()+ "'where idPartido="+ partido.getIdPartido());*/

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
