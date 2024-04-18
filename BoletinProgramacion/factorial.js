let num3 = '';
let num4;
let factorial=1;
num3 = parseInt(prompt("Introduce un numero para hacer su factorial: "));
num4=num3;
while (num3>0){
    factorial= factorial * num3;
    num3--;
}
//console.log(factorial);
document.write("El factorial de " + num4 + " es " + factorial);