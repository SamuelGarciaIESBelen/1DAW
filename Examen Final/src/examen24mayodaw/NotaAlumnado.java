package examen24mayodaw;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

public class NotaAlumnado {
    private static Map<Integer, Set<NotaAlumnado>> notas = new HashMap<>();
    private String fecha;
    private double valor;

    public NotaAlumnado(String fecha, double valor) {
        this.fecha = fecha;
        this.valor = valor;
        if (valor < 0) {
            this.valor = 0;
        } else if (valor > 10) {
            this.valor = 10;
        }
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getFecha() {
        return fecha;
    }

    public void setValor(double valor) {
        this.valor = valor;
        if (valor < 0) {
            this.valor = 0;
        } else if (valor > 10) {
            this.valor = 10;
        }
    }

    public double getValor() {
        return valor;
    }

    @Override
    public String toString() {
        return "Fecha: " + fecha + " | Valor: " + valor;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + Objects.hashCode(this.fecha);
        return hash;
    }
    
    @Override
    public boolean equals(Object obj) {
        boolean iguales = false;
        
        if (obj instanceof NotaAlumnado n && fecha.equals(n.fecha)) {
            iguales = true;
        }
        return iguales;
    }
    
    public static boolean introducirNota(Integer nie, NotaAlumnado nota) {
        boolean introducido;
        Set<NotaAlumnado> notasNie = notas.get(nie);
        
        if (notasNie == null) {
            notasNie = new HashSet<>();
            notasNie.add(nota);
            
            notas.put(nie, notasNie);
            
            introducido = true;
        } else {
            introducido = notasNie.add(nota);
        }
        return introducido;
    }
    
    public static boolean eliminarTodasNotasAlumnado(Integer nie) {
        boolean eliminado = false;
        
        Set<NotaAlumnado> notasNie = notas.get(nie);
        if (notasNie != null) {
            notasNie.clear();
            eliminado = true;
        }
        return eliminado;
    }
    
    public static Set<Integer> codigosAlumnado() {
        return notas.keySet();
    }
    
    public static Iterator<NotaAlumnado> notasAlumnado(Integer nie) {
        Set<NotaAlumnado> notasNie = notas.get(nie);
        Iterator<NotaAlumnado> it;
        
        if (notasNie == null) {
            it = null;
        } else {
            it = notasNie.iterator();
        }
        return it;
    }
}
