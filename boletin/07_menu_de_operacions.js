let operador = 2;
let num1 = 14;
let num2 = 3;
let resultado = '';

if(operador==1){
    resultado = num1 + num2;

    console.log("La suma de "+num1+" y "+num2+" es igual a "+resultado);
}

else if(operador==2){
    resultado = num1 - num2;

    console.log("La resta de "+num1+" y "+num2+" es igual a "+resultado);
}

else if(operador==3){
    resultado = num1 * num2;

    console.log("El producto de "+num1+" y "+num2+" es igual a "+resultado);
}

else if(operador==4){
    resultado = num1 / num2;

    console.log("La división de "+num1+" y "+num2+" es igual a "+resultado);
}

else {

    console.log("Tienes que escoger un número del 1 al 4");
}

