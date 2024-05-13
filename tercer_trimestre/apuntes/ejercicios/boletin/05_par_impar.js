let numero = parseInt(prompt("Escribe un número a ver: "));



if (numero % 2 == 0) {
    console.log("El número es par");
    document.getElementById("salida_contenedor").innerHTML=numero+" es un número par.";
}

else  {
    console.log("El número es impar");
    document.getElementById("salida_contenedor").innerHTML=numero+" es un número impar.";
}

