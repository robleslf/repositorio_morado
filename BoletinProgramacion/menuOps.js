let pregunta='';
let num1='';
let num2='';
let suma;
let resta;
let multiplicacion;
let division;

num1=parseFloat(prompt("Primer numero: "));
num2=parseFloat(prompt("Segundo numero: "));
pregunta=parseInt(prompt("1:Sumar, 2:Restar, 3:Multiplicar, 4:Dividir"));

switch (pregunta){
    case 1:
        suma = num1 + num2;
        document.write("La suma de " + num1 + " + " + num2 + " es = " + suma);
    break;
        
    case 2:
        resta = num1 - num2;
        document.write("La resta de " + num1 + " - " + num2 + " es = " + resta);
    break;

    case 3:
        multiplicacion = num1 * num2;
        document.write("La multipliacion de " + num1 + " * " + num2 + " es = " + multiplicacion);
    break;

    case 4:
        division = num1 / num2;
        document.write("La division de " + num1 + " / " + num2 + " es = " + division);
    break;

    default:
        document.write("Introduce una opcion valida")
};