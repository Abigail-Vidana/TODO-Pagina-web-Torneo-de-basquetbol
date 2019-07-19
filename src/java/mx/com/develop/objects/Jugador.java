
package mx.com.develop.objects;

import java.sql.Date;

/**
 *
 * @author abiga
 */
public class Jugador {
    public int idJugador;
    public int idEquipo;
    public String nombre;
    public String direccion;
    public Date fechaDeNacimiento;
    public String fotografia;

    public int getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(int idJugador) {
        this.idJugador = idJugador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFechaDeNacimiento() {
        return fechaDeNacimiento;
    }

    public void setFechaDeNacimiento(Date fechaDeNacimiento) {
        this.fechaDeNacimiento = fechaDeNacimiento;
    }

    public String getFotografia() {
        return fotografia;
    }

    public void setFotografia(String fotografia) {
        this.fotografia = fotografia;
    }

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    @Override
    public String toString() {
        return "Jugador{" + "idJugador=" + idJugador + ", idEquipo=" + idEquipo + ", nombre=" + nombre + ", direccion=" + direccion + ", fechaDeNacimiento=" + fechaDeNacimiento + ", fotografia=" + fotografia + '}';
    }
    
    
}
