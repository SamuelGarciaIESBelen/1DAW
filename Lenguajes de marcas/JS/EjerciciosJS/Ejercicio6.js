function tabla() {
	num = Number(prompt("Introduce un número para ver su tabla de multiplicar"));

	if(isNaN(num))
		alert("He dicho un número, melón");
	else {
		res = "<tr><th>OPERACIÓN</th><th>RESULTADO</th></tr>";
		for (index = 1; index <= 10; index++) {
			res += "<tr><td>" + num + " x " + index + "</td><td>" + num * index + "</td></tr>";
		}
	}
	document.getElementById('tabla').innerHTML = res;
}
tabla();