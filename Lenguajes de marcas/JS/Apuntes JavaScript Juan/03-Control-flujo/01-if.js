//IF

let edad = 25;
if (edad > 17) {
    console.log("Usuario mayor de edad");
}

//ELSE

let edad2 = 25;
if (edad2 > 17) {
    console.log("Usuario mayor de edad");
} else {
    console.log("Usuario menor de edad");
}

//ELSE IF
let edad3 = 25;
if (edad3 > 17) {
    console.log("Usuario mayor de edad");
} else if (edad3 > 13) {
    console.log("Usuario necesita estar en compañia de un adulto");
} else {
    console.log("Usuario menor de edad");
}

/////////////////////////////////////////////BUCLES while do while for in for of
//WHILE
let i = 0;

while (i < 3) {
    if (i % 2 == 0) {
        console.log(i);
    }
    i++;
}
//DO WHILE

do {
    if (i % 2 == 0) {
        console.log(i);
    }
    i++;
} while (i < 10);

//FOR

for (let j = 0; j < 20; j++) {
    if (j % 2 == 0) {
        console.log(j);
    }
}

//FOR OF! (parecido al for each)

let animales = ['cerdito', 'anguila', 'perico'];

for (let animal of animales) {
    console.log(animal);
}

let a = 0;                      //esto simplemente es el for of, pero con un while
while (i < animales.length) {
    console.log(animales[a]);
    a++;
}


//FOR IN 

let user = {
    id: 1,
    name: 'Pepe Perez',
    age: 25,
};

for (let prop in user) {
    console.log(prop, user[prop]); //nos muestra la propiedad, y luego le decimos que nos de el valor dentro del array.
}

for (let indice in animales) {
    console.log(indice, animales[indice]); //nos va a enseñar los indices, pero lo mejor es usar el for of!
}

// Continue & Break
let b = 0;
while (b < 6) {
    b++;
    if (b == 2) {
        continue; //no imprime el valor de 2 porque se salta la instruccion en la que vale 2.
    }
    if (b == 4) {
        break; // en cuanto vale 4  nos saca del loop.
    }
    console.log(b);

}

//SWITCH
let accion = 'listar';

switch (accion) {
    case 'listar':
        console.log('Accion de listar');
        break; //como en java, si no pones break te salta al siguente.
    case 'guardar':
        console.log('Accion de guardar');
        break;
    default:
        console.log('Accion no reconocida');
}