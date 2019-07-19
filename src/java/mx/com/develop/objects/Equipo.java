
package mx.com.develop.objects;

/**
 *
 * @author abiga
 */
public class Equipo {
    private int idEquipo;
    private String nombre;
    private String logotipo;
    private String colorPrimario;
    private String colorSecundario;  
    private int puntos;
    private int puntosFavor;
    private int puntosContra;
    private int perdidosDefault;
    private int categoria;

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLogotipo() {
        return logotipo;
    }

    public void setLogotipo(String logotipo) {
        this.logotipo = logotipo;
    }

    public String getColorPrimario() {
        return colorPrimario;
    }

    public void setColorPrimario(String colorPrimario) {
        this.colorPrimario = colorPrimario;
    }

    public String getColorSecundario() {
        return colorSecundario;
    }

    public void setColorSecundario(String colorSecundario) {
        this.colorSecundario = colorSecundario;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public int getPuntosFavor() {
        return puntosFavor;
    }

    public void setPuntosFavor(int puntosFavor) {
        this.puntosFavor = puntosFavor;
    }

    public int getPuntosContra() {
        return puntosContra;
    }

    public void setPuntosContra(int puntosContra) {
        this.puntosContra = puntosContra;
    }

    public int getPerdidosDefault() {
        return perdidosDefault;
    }

    public void setPerdidosDefault(int perdidosDefault) {
        this.perdidosDefault = perdidosDefault;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    
    @Override
    public String toString() {
        return "Equipo{" + "idEquipo=" + idEquipo + ", nombre=" + nombre + 
                ", logotipo=" + logotipo + ", colorPrimario=" + colorPrimario + 
                ", colorSecundario=" + colorSecundario + ", puntos=" + puntos + 
                ", puntosFavor=" + puntosFavor + ", puntosContra=" + puntosContra + 
                ", perdidosDefault=" + perdidosDefault + ", categoria=" + categoria + '}';
    }
 
    
}
