// Funciones
// Son fragmentos de código para realizar una funcionalidad determinada

// Dividir problemas
// Revisar código
// Encapsular código

// 1º Declaramos la función
// 2º Se invoca


// Función que sume dos números:

function suma (a,b){

    let resultado = a + b;

    return resultado;

}


console.log(suma(5,4));

// Así incluso es más rápido:

function suma (a,b){


    return a + b;

}


// Función que sume un Array de números

function sumaArray(numeros){

    let suma= 0;

    for(let i=0; i<  numeros.length; i++){
        suma+=numeros[i];
    }

    return suma;

}

let misNumeros = [14,4,8,3];

console.log(sumaArray(misNumeros));


