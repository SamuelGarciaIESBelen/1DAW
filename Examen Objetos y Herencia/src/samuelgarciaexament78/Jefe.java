package samuelgarciaexament78;

public class Jefe extends Personaje {
    private int vidaExtra;

    public Jefe() {
        super();
        codigo = 1 * (int)Math.pow(10, digitos(codigo)) + codigo;
        vidaExtra = codigo / 2;
        vida += 5 + vidaExtra;
    }
    
    @Override
    public void restarVida(int num) {
        if (vidaExtra > 0) {
            vidaExtra -= num;
            vida -= num;
        }
        else {
            vida -= num;
            vidaExtra -= 0;
        }
        if (vida <= 0) {
            vida = 0;
            vivo = false;
        }
    }
    
    @Override
    public String toString() {
        return super.toString() + " (Base: " + (vida - vidaExtra) + " + Extra: " + vidaExtra + ")";
    }
}
