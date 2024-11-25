package examen24mayodaw;

public class Alumnado {
    private static int contador = 10;
    private int nie;
    private String nombre;

    public Alumnado(String nombre) {
        this.nie = contador++;
        this.nombre = nombre;
    }

    public int getNie() {
        return nie;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return this.getClass().getSimpleName() + " | NIE: " + nie + " | Nombre: " + nombre;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + this.nie;
        return hash;
    }
    
    @Override
    public boolean equals(Object obj) {
        boolean iguales = false;
        
        if (obj instanceof Alumnado a && nie == a.nie) {
            iguales = true;
        }
        return iguales;
    }
}
