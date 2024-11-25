package samuelgarciaexament78;

public class Ejercito {
    private Personaje[] ejercito;
    private boolean derrotado;

    public Ejercito() {
        ejercito = new Personaje[generarRandom(3, 6)];
        
        for (int i = 0; i < ejercito.length - 1; i++) {
            ejercito[i] = new Guerrero();
        }
        ejercito[ejercito.length - 1] = new Jefe();
        
        derrotado = false;
    }

    public void setDerrotado(boolean derrotado) {
        this.derrotado = derrotado;
    }

    public boolean isDerrotado() {
        return derrotado;
    }
    
    public int generarRandom(int min, int max) {
        return (int)(Math.random() * (max - min + 1) + min);
    }
    
    public boolean guerrerosVivos() {
        boolean guerrerosVivos = false;
        
        for (int i = 0; i < ejercito.length - 1 && !guerrerosVivos; i++) {
            if (ejercito[i].isVivo())
                guerrerosVivos = true;
        }
        return guerrerosVivos;
    }
    
    public void recibirAtaque() {
        int valorAtaque = generarRandom(0, 10);
        
        if (guerrerosVivos())
            ejercito[generarRandom(0, ejercito.length - 2)].restarVida(valorAtaque);
        else
            ejercito[ejercito.length - 1].restarVida(valorAtaque);
        
        if (!ejercito[ejercito.length - 1].isVivo())
            derrotado = true;
    }
    
    public void info() {
        for (int i = 0; i < ejercito.length; i++) {
            System.out.println(ejercito[i].getClass().getSimpleName() + " - " + ejercito[i]);
        }
    }
}
