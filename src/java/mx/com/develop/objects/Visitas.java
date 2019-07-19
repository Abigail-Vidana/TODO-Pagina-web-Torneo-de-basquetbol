
package mx.com.develop.objects;

/**
 *
 * @author abiga
 */
public class Visitas {
    String pagina;
    int visitas;

     public Visitas() {
    }
    public Visitas(String pagina, int visitas) {
        this.pagina = pagina;
        this.visitas = visitas;
    }
    
    
    public String getPagina() {
        return pagina;
    }

    public void setPagina(String pagina) {
        this.pagina = pagina;
    }

    public int getVisitas() {
        return visitas;
    }

    public void setVisitas(int visitas) {
        this.visitas = visitas;
    }
    
}
