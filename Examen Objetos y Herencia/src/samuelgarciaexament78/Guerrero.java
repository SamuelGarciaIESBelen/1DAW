package samuelgarciaexament78;

public class Guerrero extends Personaje {
    
    public Guerrero() {
        super();
        codigo = 2 * (int)Math.pow(10, digitos(codigo)) + codigo;
    }
}
