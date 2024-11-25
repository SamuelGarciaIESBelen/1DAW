function multiplos8() {
    min = Number(prompt("Introduce el número mínimo"));
    max = Number(prompt("Introduce el número máximo"));
    res = "El número menor es " + min + " y el mayor es " + max + "<br>Los múltiplos de 8 comprendidos entre ambos son:";

    if (isNaN(min) || isNaN(max))
        alert("Introduce números");
    else {
        for (let index = min; index <= max; index++) {
            if (index % 8 == 0)
                res += "<br><br>" + index;
        }
        document.getElementById('res').innerHTML = res;
    }
}
multiplos8();