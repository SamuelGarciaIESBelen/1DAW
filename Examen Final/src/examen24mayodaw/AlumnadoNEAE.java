package examen24mayodaw;

public class AlumnadoNEAE extends Alumnado implements Calculable {
    private double coeficiente;

    public AlumnadoNEAE(String nombre, double coeficiente) {
        super(nombre);
        this.coeficiente = coeficiente;
        if (coeficiente < 1.5) {
            this.coeficiente = 1.5;
        } else if (coeficiente > 3) {
            this.coeficiente = 3;
        }
    }

    public void setCoeficiente(double coeficiente) {
        this.coeficiente = coeficiente;
        if (coeficiente < 1.5) {
            this.coeficiente = 1.5;
        } else if (coeficiente > 3) {
            this.coeficiente = 3;
        }
    }

    public double getCoeficiente() {
        return coeficiente;
    }

    @Override
    public double calculoNota(double notaInicial) {
        double notaFinal = notaInicial * coeficiente;
        if (notaFinal > 10) {
            notaFinal = 10;
        }
        return notaFinal;
    }

    @Override
    public String toString() {
        return super.toString() + " | Coeficiente: " + coeficiente;
    }
}
