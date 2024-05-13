// A partir de las 13:00 dirá buenas tardes, antes dirá buenos días, y a partir de las 20:00, buenas noches.

let hora=20;

if (hora >= 20 || hora < 6) {
    console.log ("Buenas noches");
}

else if (hora >= 13) {
    console.log ("Buenas tardes");
}

else {
    console.log ("buenos dìas");
}