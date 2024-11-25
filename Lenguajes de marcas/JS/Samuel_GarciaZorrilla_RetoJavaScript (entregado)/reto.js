function diasHastaFinAnno() {
    dia = Number(prompt("Introduce un día válido (1 - 31, ten en cuenta el mes)"));
    mes = Number(prompt("Introduce un mes válido (1 - 12)"));
    
    if (isNaN(dia) || (dia < 1 || dia > 31))
        alert("El día no es válido");
    
    if (isNaN(mes) || (mes < 1 || mes > 12))
        alert("El mes no es válido");
    
    fecha = new Date("2024-" + mes + "-" + dia);
    finAnno = new Date("2025-01-01");
    
    contador = (finAnno - fecha) / 1000 / 60 / 60 / 24;

    document.getElementById('contador').innerHTML = contador;

    intervalo = window.setInterval(mostrar_hora, 1);
    contador.innerHTML -= intervalo.getSeconds();

    window.addEventListener('click', reiniciar());
    
}

function reiniciar() {
    contador = 0;
    document.getElementById('contador').innerHTML = contador;
}
diasHastaFinAnno();