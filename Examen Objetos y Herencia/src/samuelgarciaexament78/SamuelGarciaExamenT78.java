package samuelgarciaexament78;

import java.util.Scanner;

public class SamuelGarciaExamenT78 {

    public static void menu() {
        System.out.println("\n1. Mostrar ejércitos");
        System.out.println("2. Atacar al ejército 1");
        System.out.println("3. Atacar al ejército 2");
        System.out.println("0. Salir");
    }
    
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        Ejercito e1 = new Ejercito();
        Ejercito e2 = new Ejercito();
        int opcion;
        
        do {
            menu();
            
            do {
                System.out.print("\nElige una opción: ");
                opcion = scan.nextInt();
            } while(opcion < 0 || opcion > 3);
            
            System.out.println();
            
            switch (opcion) {
                case 1 -> {
                    System.out.println("Ejército 1");
                    e1.info();
                    System.out.println("----------------------------------------");
                    System.out.println("Ejército 2");
                    e2.info();
                }
                case 2 -> {
                    e1.recibirAtaque();
                    e1.info();
                    if (e1.isDerrotado())
                        System.out.println("\n¡El ejército 1 ha sido derrotado!");
                }
                case 3 -> {
                    e2.recibirAtaque();
                    e2.info();
                    if (e2.isDerrotado())
                        System.out.println("\n¡El ejército 2 ha sido derrotado!");
                }
            }
        } while (opcion != 0);
    }
}
