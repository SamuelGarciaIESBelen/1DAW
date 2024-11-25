function diasHastaFinAnno() {
	dia = Number(prompt("Introduce un día válido (1 - 31, ten en cuenta el mes)"));
	mes = Number(prompt("Introduce un mes válido (1 - 12)"));
	
	if (isNaN(dia) || (dia < 1 || dia > 31))
		alert("El día no es válido");
	
	if (isNaN(mes) || (mes < 1 || mes > 12))
		alert("El mes no es válido");
	
	fecha = new Date("2024-" + mes + "-" + dia);
	finAnno = new Date("2024-12-31");
	
	contador = Math.floor((finAnno - fecha) / 1000 / 60 / 60 / 24);

	document.getElementById('contador').innerHTML = "Quedan " + contador + " días hasta fin de año";
}

function boton(input) {
	if (input.type == "click") {
		contador = 0;
		clearInterval(cuenta);
		document.getElementById("contador").innerHTML = "¡SE HA ACABADO EL AÑO!";
	}
	if (input.type == "wheel")
		contador++;
}

function cuentaAtras() {
	if (contador > 0) {
		contador--;
		document.getElementById('contador').innerHTML = "Quedan " + contador + " días hasta fin de año";
	} else {
		clearInterval(cuenta);
		document.getElementById("contador").innerHTML = "¡SE HA ACABADO EL AÑO!";
	}
}
diasHastaFinAnno();

cuenta = setInterval(cuentaAtras, 1000);

window.onload = function () {
	document.addEventListener('click', boton);
	document.addEventListener('contextmenu', boton);
	document.addEventListener('wheel', boton);
}
