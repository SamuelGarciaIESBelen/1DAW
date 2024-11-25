//////////////////////////////////////////////////////////////
//ARITMETICAS

let a = 5;
let b = 7;

console.log(a + b);
console.log(a - b);
console.log(a * b);
console.log(a / b);
console.log(a % b);
console.log(a ** b); //potencia de.

//incrementar
console.log(a++); //primero opera luego incrementa
console.log(++a); // primero incrementa y luego opera

//decrementar
console.log(a--); //primero opera luego dencrementa
console.log(--a); // primero dencrementa y luego opera

///////////////////////////////////////
//ASIGNACION
a = a + 5;
a += 5;
a -= 5;
a *= 5;
a /= 5;
a %= 5;

/////////////////////////////////////////////
//COMPARACION
let c = 10;
console.log(c > 5);
console.log(c >= 5);
console.log(c <= 5);

console.log(c == 5); //TRUE O FALSE
console.log(c != 5);
console.log(c == '10') //nos va a dar que TRUE!!! Y es que javascript con == nos mira si el valor es el mismo da igual el tipo.
//OOOOOOJOO!!!!!!! IMPORTANTE!!!
console.log(c === 5); //TRUE O FALSE
console.log(c !== 5);
console.log(c === '10'); //aqui si nos da FALSE por que tiene en cuenta los tipos de datos!!! OOOOOOJOOOOO!

////////////////////////////////////////////////////////

//AND, OR, NOT

let mayor = true;
let suscrito = true;

console.log('operador and', mayor && suscrito);
console.log('operador or', mayor || suscrito);
console.log('operador not', !mayor);

/////////////////////////////////////////////////////////////////////////////////////////
//TERNARIO

// expresion ?'si es true':'si es false'

let acceso = edad > 17 ? 'Puede acceder' : 'no puede acceder';// como en java.

//////////////////////////////////////////////////////////////////////////////////////////////

//Short-Circuit//

//FALSO (los falsy)
//false
//0
//''
//null
//undefined
//NaN
let nombre = '';
let username = nombre || 'Anonimo';
console.log(username); //nos devuelve "anonimo" porque el primero al estar vacio con '' lo toma con false

let nombre2 = 'chanchito';
let username2 = nombre2 || 'anonimo';
console.log(username2); //nos devuelve "chanchito" porque el primero si está relleno, y toma ese valor.

function fn1() {
        console.log('soy funcion1');
        return true;
}
function fn2() {
        console.log('soy funcion2');
        return true;
}

let x = fn1() && fn2(); //nos muestra las dos funciones porque las dos son verdadero Si solo hubiera una verdadera solo imprimiria esa.

