package mx.com.develop.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.naming.NamingException;
import mx.com.develop.objects.Equipo;

public class MbdEquipos extends Mbd {

    public MbdEquipos() throws NamingException {
        super();
    }

    public boolean insertaEquipo(Equipo equipo) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("INSERT INTO equipo (nombre,logotipo,color_primario,color_secundario,categoria) VALUES(?,?,?,?,?)");
                ps.setString(1, equipo.getNombre());
                ps.setString(2, equipo.getLogotipo());
                ps.setString(3, equipo.getColorPrimario());
                ps.setString(4, equipo.getColorSecundario());
                ps.setInt(5, equipo.getCategoria());
                ps.executeUpdate();
            /*stmt.executeUpdate("INSERT INTO equipo (nombre,logotipo,color_primario,color_secundario) VALUES("
                    + "'" + equipo.getNombre() + "',"
                    + "'" + equipo.getLogotipo()+ "',"
                    + "'" + equipo.getColorPrimario()+ "',"
                    + "'" + equipo.getColorSecundario() + "')");*/
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public Equipo buscaEquipo(int idEquipo) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Equipo equipo = null;
        try {
            //rst = stmt.executeQuery("SELECT * FROM equipo WHERE idEquipo=" + idEquipo);
            ps = conn.prepareStatement("SELECT * FROM equipo WHERE idEquipo=?");
            ps.setInt(1, idEquipo);
            rst = ps.executeQuery();
            
            if (rst.next()) {
                equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setNombre(rst.getString(2));
                equipo.setLogotipo(rst.getString(3));
                equipo.setColorPrimario(rst.getString(4));
                equipo.setColorSecundario(rst.getString(5));
                equipo.setCategoria(rst.getInt(6));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equipo;
    }

    public ArrayList<Equipo> traerTodosLosEquipos() throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Equipo> equipos = new ArrayList<>();

        try {

            //rst = stmt.executeQuery("SELECT * FROM equipo ORDER BY nombre");
            ps = conn.prepareStatement("SELECT * FROM equipo ORDER BY nombre");
            rst = ps.executeQuery();
            
            while (rst.next()) {
                Equipo equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setNombre(rst.getString(2));
                equipo.setLogotipo(rst.getString(3));
                equipo.setColorPrimario(rst.getString(4));
                equipo.setColorSecundario(rst.getString(5));
                equipo.setCategoria(rst.getInt(6));
                equipos.add(equipo);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equipos;
    }

    public void eliminaEquipo(int idEquipo) throws SQLException, NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            //stmt.executeUpdate("DELETE FROM equipo WHERE idEquipo=" + idEquipo);
            ps = conn.prepareStatement("DELETE FROM equipo WHERE idEquipo=?");
                ps.setInt(1, idEquipo);
                ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error en sql: "+e.toString());
            e.printStackTrace();

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaEquipo(Equipo equipo) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("UPDATE equipo SET nombre=? , logotipo=? , color_primario=? , "
                    + "color_secundario=? , categoria=? WHERE idEquipo=?");
            ps.setString(1, equipo.getNombre());
            ps.setString(2, equipo.getLogotipo());
            ps.setString(3, equipo.getColorPrimario()); 
            ps.setString(4, equipo.getColorSecundario());
            ps.setInt(5, equipo.getCategoria());
            ps.setInt(6, equipo.getIdEquipo());
            ps.executeUpdate();
           /* stmt.executeUpdate("update equipo set "
                    + "nombre='" + equipo.getNombre() + "',"
                    + "logotipo='" + equipo.getLogotipo() + "',"
                    + "color_primario='" + equipo.getColorPrimario() + "',"
                    + "color_secundario='" + equipo.getColorSecundario() + "' where idEquipo="+ equipo.getIdEquipo());*/
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }
    
    public List<Equipo> obtenerEquipos() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();
        List<Equipo> result = new ArrayList<>();
        try {

            //rst = stmt.executeQuery("SELECT * FROM equipo ORDER BY nombre");
            ps = conn.prepareStatement("SELECT * FROM equipo ORDER BY nombre");
            rst = ps.executeQuery();
            
            while (rst.next()) {
                Equipo equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setNombre(rst.getString(2));
                equipo.setLogotipo(rst.getString(3));
                equipo.setColorPrimario(rst.getString(4));
                equipo.setColorSecundario(rst.getString(5));
                equipo.setCategoria(rst.getInt(6));
                result.add(equipo);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return result;
    }
    public void obtenerPuntosEquipo(Equipo equipo)throws SQLException,
        NamingException {
        int puntos=0;
        int puntosAFavor = 0;
        int puntosEnContra = 0;
        int perdidosPorDefault = 0;
        int idEquipo = equipo.getIdEquipo();
        //stmt = conn.createStatement();
        try {
            getConexion();
            ps= conn.prepareStatement(
                " SELECT marcador_global, marcador_visitante, " +
                " case equipo_local when ? then true else false end es_local, " + 
                " case when Estatus = 'Default local' then true else false end default_loc,  " +
                " case when Estatus = 'Default visitante' then true else false end default_vis  " +
                " FROM partido " +
                " where ( equipo_local= ? or equipo_visitante = ? ) and Estatus != 'Pendiente' " );
            ps.setInt(1, idEquipo);
            ps.setInt(2, idEquipo);
            ps.setInt(3, idEquipo);
            
            rst = ps.executeQuery();
            while (rst.next()) {
                int marcadorLocal = rst.getInt(1);
                int marcadorVisitante = rst.getInt(2);
                boolean local = rst.getBoolean(3);
                boolean defaultLocal = rst.getBoolean(4);
                boolean defaultVisitante = rst.getBoolean(5);
                if(defaultLocal || defaultVisitante){
                    if(defaultLocal && local || defaultVisitante && !local){
                        puntos += 3;
                        puntosAFavor+=20;
                    }
                    else{
                        puntosEnContra+=20;
                        perdidosPorDefault++;
                    }
                }
                else{
                    boolean ganoLocal = local && marcadorLocal>marcadorVisitante;
                    boolean ganoVisitante = !local && marcadorLocal<marcadorVisitante;
                    boolean perdioLocal = local && marcadorLocal<marcadorVisitante;
                    
                    if(ganoLocal || ganoVisitante){
                        puntos += 3;
                        puntosAFavor+= ganoLocal? marcadorLocal: marcadorVisitante;
                        puntosEnContra+= ganoLocal? marcadorVisitante: marcadorLocal;
                    } else{
                        puntos += 1;
                        puntosAFavor+= perdioLocal? marcadorLocal: marcadorVisitante;
                        puntosEnContra+= perdioLocal? marcadorVisitante: marcadorLocal;
                    }
                }
            }
            
            equipo.setPuntos(puntos);
            equipo.setPuntosFavor(puntosAFavor);
            equipo.setPuntosContra(puntosEnContra);
            equipo.setPerdidosDefault(perdidosPorDefault);
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }
    
    public List<Equipo> obtenerPosiciones() throws SQLException, NamingException{
        List<Equipo> equipos = obtenerEquipos();
        
        for( Equipo equipo: equipos){
            System.out.println(equipo);
            obtenerPuntosEquipo(equipo);
            System.out.println(equipo);
        }
        // usando Lambda para el metodo compare de Comparator
        Collections.sort(equipos, (equipo1, equipo2) -> {
            int result = equipo2.getPuntos() - equipo1.getPuntos();
            if(result == 0 ){
                result = (equipo2.getPuntosFavor()-equipo2.getPuntosContra())-
                        (equipo2.getPuntosFavor()-equipo2.getPuntosContra());
            }
            if(result == 0 ){
                result = equipo2.getPuntosFavor() - equipo2.getPuntosFavor();
            }
            return result;
        });
        return equipos;
        //Asi sería si usaramos la interface Comparator
//        Collections.sort(equipos, new Comparator<Equipo>(){
//            @Override
//            public int compare(Equipo e1, Equipo e2) {
//                return e1.getPuntos() - e2.getPuntos();
//            }
//        });
        
    }
    
}


