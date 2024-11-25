package examen24mayodaw;

import java.util.ArrayList;
import java.util.List;

public class GrupoAlumnado {
    private List<Alumnado> alumnos = new ArrayList<>();
    
    public boolean inscribirAlumnado(Alumnado alumno) {
        boolean inscrito = false;
        
        if (!alumnos.contains(alumno)) {
            inscrito = alumnos.add(alumno);
        }
        return inscrito;
    }
    
    public boolean eliminarAlumnado(Alumnado alumno) {
        return alumnos.remove(alumno);
    }
    
    public boolean insertarNotaAlumnado(Integer nie, NotaAlumnado nota) {
        return NotaAlumnado.introducirNota(nie, nota);
    }
    
    public Alumnado encontrarPorNie(Integer nie) {
        Alumnado a = null;
        boolean encontrado = false;
        
        for (int i = 0; i < alumnos.size() && !encontrado; i++) {
            if (alumnos.get(i).getNie() == nie) {
                a = alumnos.get(i);
                encontrado = true;
            }
        }
        return a;
    }
    
    @Override
    public String toString() {
        String res = "";
        
        for (Alumnado alumno : alumnos) {
            res += alumno.toString() + "\n";
        }
        return res;
    }
}
