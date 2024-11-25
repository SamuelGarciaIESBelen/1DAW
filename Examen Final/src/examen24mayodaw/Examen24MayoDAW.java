package examen24mayodaw;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Examen24MayoDAW {
    
    public static int menu() {
        int opcion = 0;
        
        System.out.println("\n -- MENU --");
        System.out.println("1. Introducir alumnado");
        System.out.println("2. Eliminar alumnado");
        System.out.println("3. Introducir nota de alumno/a");
        System.out.println("4. Mostrar información (sin notas) de todos los alumnos del grupo");
        System.out.println("5. Mostrar todas las notas de un alumno");
        System.out.println("6. Mostrar el nombre de todos los alumnos NEAE con alguna nota");
        System.out.println("0. Salir");
        do {
            opcion = EntradaTeclado.pedirEntero("Introduzca una opcion: ");
        } while ((opcion < 0) || (opcion > 6));
        
        System.out.println();
        
        return opcion;
    }
    
    public static void introducirAlumnado(GrupoAlumnado g) {
        boolean inscrito;
        int tipo;
        do
            tipo = EntradaTeclado.pedirEntero("¿Pertenece a Alumnado(1) o a AlumnadoNEAE(2)? ");
        while (tipo < 1 || tipo > 2);
        
        String nombre = EntradaTeclado.pedirCadena("Introduce el nombre del alumno: ");
        if (tipo == 1) {
            inscrito = g.inscribirAlumnado(new Alumnado(nombre));
        } else {
            double coeficiente;
            do {
                coeficiente = EntradaTeclado.pedirDouble("Introduce el coeficiente de correccion (entre 1.5 y 3): ");
            } while (coeficiente < 1.5 || coeficiente > 3);
            
            inscrito = g.inscribirAlumnado(new AlumnadoNEAE(nombre, coeficiente));
        }
        
        if (inscrito) {
            System.out.println("El alumno ha sido inscrito correctamente");
        } else {
            System.out.println("El alumno ya existe en el sistema");
        }
    }
    
    public static void eliminarAlumnado(GrupoAlumnado g) {
        boolean eliminado;
        int nie = EntradaTeclado.pedirEntero("Introduce el NIE del alumno: ");
        Alumnado a = g.encontrarPorNie(nie);
        
        eliminado = g.eliminarAlumnado(a);
        
        if (eliminado) {
            NotaAlumnado.eliminarTodasNotasAlumnado(nie);
            System.out.println("El alumno ha sido eliminado correctamente");
        } else {
            System.out.println("El alumno no existe en el sistema");
        }
    }
    
    public static void introducirNota(GrupoAlumnado g) {
        boolean introducido;
        int nie = EntradaTeclado.pedirEntero("Introduce el NIE del alumno: ");
        Alumnado a = g.encontrarPorNie(nie);
        
        if (a != null) {
            System.out.println("Introduce la nota");
            String fecha = EntradaTeclado.pedirCadena("Fecha: ");
            double valor;
            do {
                valor = EntradaTeclado.pedirDouble("Valor (entre 0 y 10): ");
            } while (valor < 0 || valor > 10);
            
            if (a instanceof AlumnadoNEAE an) {
                double valorCorregido = an.calculoNota(valor);
                introducido = g.insertarNotaAlumnado(nie, new NotaAlumnado(fecha, valorCorregido));
            } else {
                introducido = g.insertarNotaAlumnado(nie, new NotaAlumnado(fecha, valor));
            }
            
            if (introducido) {
                System.out.println("La nota ha sido introducida correctamente");
            } else {
                System.out.println("Ya existe una nota con esa fecha");
            }
        } else {
            System.out.println("El alumno no existe en el sistema");
        }
    }
    
    public static void mostrarNotasAlumno(GrupoAlumnado g) {
        int nie = EntradaTeclado.pedirEntero("Introduce el NIE del alumno: ");
        Alumnado a = g.encontrarPorNie(nie);
        
        if (a != null) {
            Iterator<NotaAlumnado> it = NotaAlumnado.notasAlumnado(nie);
            if (it != null) {
                System.out.println("Notas de " + a.getNombre());
                while (it.hasNext()) {
                    System.out.println(it.next());
                }
            } else {
                System.out.println(a.getNombre() + " no tiene notas");
            }
        } else {
            System.out.println("El alumno no existe en el sistema");
        }
    }
    
    public static void main(String[] args) {
        GrupoAlumnado g = new GrupoAlumnado();
        int opcion = 0;
        
        do {
            opcion = menu();
            
            switch (opcion) {
                case 1 -> {
                    introducirAlumnado(g);
                }
                case 2 -> {
                    eliminarAlumnado(g);
                }
                case 3 -> {
                    introducirNota(g);
                }
                case 4 -> {
                    System.out.println(g);
                }
                case 5 -> {
                    mostrarNotasAlumno(g);
                }
                case 6 -> {
                    Set<String> nombres = new HashSet<>();
                    
                    for (int nie : NotaAlumnado.codigosAlumnado()) {
                        Alumnado a = g.encontrarPorNie(nie);
                        if (a instanceof AlumnadoNEAE && NotaAlumnado.notasAlumnado(nie).hasNext()) {
                            nombres.add(a.getNombre());
                        }
                    }
                    
                    if (!nombres.isEmpty()) {
                        System.out.println("Los alumnos NEAE con alguna nota son:");
                        System.out.println(nombres);
                    } else {
                        System.out.println("No hay notas registradas en el sistema");
                    }
                }
            }
        } while (opcion != 0);
        
        System.out.println("Has salido del programa");
    }
}