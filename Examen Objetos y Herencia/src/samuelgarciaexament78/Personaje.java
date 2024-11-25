package samuelgarciaexament78;

public abstract class Personaje {
    protected static int contador;
    protected int codigo;
    protected int vida;
    protected boolean vivo;
    
    public Personaje() {
        contador++;
        codigo = contador;
        vida = 15;
        vivo = true;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCodigo() {
        return codigo;
    }

    public int getVida() {
        return vida;
    }

    public void setVivo(boolean vivo) {
        this.vivo = vivo;
    }

    public boolean isVivo() {
        return vivo;
    }
    
    public int digitos(int num) {
        int digitos = 1;
        
        while (num > 9) {
            num /= 10;
            digitos++;
        }
        return digitos;
    }
    
    protected void restarVida(int num) {
        vida -= num;
        
        if (vida <= 0) {
            vivo = false;
            vida = 0;
        }
    }
    
    @Override
    public String toString() {
        return "Código: " + codigo + " - Vida: " + vida;
    }
}
