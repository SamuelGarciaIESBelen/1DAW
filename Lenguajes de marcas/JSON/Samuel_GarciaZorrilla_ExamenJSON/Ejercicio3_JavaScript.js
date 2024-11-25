function votante() {
    edad = Number(prompt("Introduzca su edad, si es tan amable"));
    res = "";

    if (isNaN(edad)) {
        alert("Su edad debería ser un número, ¿no cree?");
    } else {
        if (edad < 0)
            res = "La edad no puede ser negativa"; 
        else if (edad < 18)
            res = "Usted todavía no puede votar";
        else if (edad <= 66)
            res = "Usted puede votar";
        else
            res = "Usted puede votar y ha alcanzado la edad de jubilación";
    }
    document.getElementById("res").innerHTML = res;
}
votante();