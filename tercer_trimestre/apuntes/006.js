let mes = 14561;

mes = parseInt (prompt("Por favor, introduce un número de mes..."));

switch (mes) {
    case 1, 17: 
        console.log("Enero");
        document.getElementById("mes").innerHTML="ENERO";
    break;

    case 2: 
        console.log("Febrero");
        document.getElementById("mes").innerHTML="FEBRERO";
    break;

    case 3: 
        console.log("Marzo");
        document.getElementById("mes").innerHTML="MARZO";
    break;

    case 4: 
        console.log("Abril");
        document.getElementById("mes").innerHTML="ABRIL";
    break;

    case 5: 
        console.log("Mayo");
        document.getElementById("mes").innerHTML="MAYO";
    break;

    case 6: 
        console.log("Junio");
        document.getElementById("mes").innerHTML="JUNIO";
    break;

    case 7: 
        console.log("Julio");
        document.getElementById("mes").innerHTML="JULIO";
    break;

    case 8: 
        console.log("Agosto");
        document.getElementById("mes").innerHTML="AGOSTO";
    break;

    case 9: 
        console.log("Septiembre");
        document.getElementById("mes").innerHTML="SEPTIEMBRE";
    break;

    case 10: 
        console.log("Octubre");
        document.getElementById("mes").innerHTML="OCTUBRE";
    break;

    case 11: 
        console.log("Noviembre");
        document.getElementById("mes").innerHTML="NOVIEMBRE";
    break;

    case 12: 
        console.log("Diciembre");
        document.getElementById("mes").innerHTML="DICIEMBRE";
    break;

    default:
        console.log("Te equivocaste wey");
        document.getElementById("mes").innerHTML="Solo hay doce meses xd";
}



