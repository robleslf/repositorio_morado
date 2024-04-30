let numero = 4;


let numeroOriginal = numero;


while(numero > 0) {
        acumulador += acumulador * (numero - 1);

        numero -= numero;
    
        }

        console.log("El factorial de "+numeroOriginal+" es "+acumulador);