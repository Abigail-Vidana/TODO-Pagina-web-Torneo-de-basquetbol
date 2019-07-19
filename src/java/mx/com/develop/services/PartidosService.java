
package mx.com.develop.services;

import java.util.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.File;
import mx.com.develop.tools.ImageTools;
import javax.naming.NamingException;
import mx.com.develop.model.MbdEquipos;
import mx.com.develop.model.MbdPartidos;
import mx.com.develop.objects.Equipo;
import mx.com.develop.objects.Partido;
import java.util.ResourceBundle;
/**
 *
 * @author abiga
 */
public class PartidosService {
    
    public Map<String,List<List<String>>> getHorariosPartidos() throws NamingException, SQLException{
        ArrayList<Partido> listaPartidos = new MbdPartidos().traerTodosLosPartidos(); 
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        List<Equipo> listaEquipos = new MbdEquipos().obtenerEquipos();
        Map<Integer, Equipo> equipos = new HashMap<Integer, Equipo>();

        for(Equipo equipo : listaEquipos){
           equipos.put(equipo.getIdEquipo(), equipo);
        }

        Date fechaHoy = new Date(System.currentTimeMillis());
        Map<String,List<List<String>>> result = new HashMap<>();
        result.put("jugados", new ArrayList<>());
        result.put("pendientes", new ArrayList<>());
        for(Partido partido : listaPartidos){
            List<String> resultados = new ArrayList<>();
            String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");
            String imagenLocal = ImageTools.encodeFileToBase64Binary(new File(uploadFolder+equipos.get(
                    partido.getEquipoLocal()).getLogotipo()));
            String imagenVisitante = ImageTools.encodeFileToBase64Binary(new File(uploadFolder+equipos.get(
                    partido.getEquipoVisitante()).getLogotipo()));
            resultados.add(imagenLocal);
            resultados.add(equipos.get(partido.getEquipoLocal()).getNombre());
            resultados.add(partido.getMarcadorGlobal()+"");
            resultados.add(partido.getMarcadorVisitante()+"");
            resultados.add(equipos.get(partido.getEquipoVisitante()).getNombre());
            resultados.add(imagenVisitante);
            resultados.add(formatoFecha.format(partido.getFecha()));
            
            
            Date fechaPartido = partido.getFecha();
            if(fechaPartido.before(fechaHoy)){
                result.get("jugados").add(resultados);
            }
            else{
                result.get("pendientes").add(resultados);
            }
        }
        return result;
    }
}
