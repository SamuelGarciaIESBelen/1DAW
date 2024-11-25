function suma(a) { //parametro
    console.log(arguments); //movida rara para ver todos los parametros que se estan pasando, luego explicara algo mejor para esto
    return a + 2;
}

numero = 5;
suma(numero); //argumento
console.log(suma(numero));
console.log(typeof suma);
let resultado = suma(5, 6, 1, 2, 3);