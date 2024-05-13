let nota = "";

nota = parseInt (prompt("¿Qué nota has sacado?"));

switch (nota) {
    case 0: 
    case 1:
    case 2:
    case 3:
    case 4:
        console.log("Suspenso");
        document.getElementById("mes").innerHTML="Suspenso";
    break;

    case 5: 
        console.log("Aprobado");
        document.getElementById("mes").innerHTML="Aprobado";
    break;

    case 6: 
        console.log("Bien");
        document.getElementById("mes").innerHTML="Bien";
    break;

    case 7: 
        console.log("Notable");
        document.getElementById("mes").innerHTML="Notable";
    break;

    case 8: 
        console.log("Notable alto");
        document.getElementById("mes").innerHTML="Notable alto";
    break;

    case 9:
    case 10: 
        console.log("Sobresaliente");
        document.getElementById("mes").innerHTML="Sobresaliente";
    break;


    default:
        console.log("Introduzca un valor válido, por favor");
        document.getElementById("mes").innerHTML="Es imposible que hayas sacado un "+nota;

}