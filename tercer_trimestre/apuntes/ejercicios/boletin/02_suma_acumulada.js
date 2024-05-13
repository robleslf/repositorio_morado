let acumulador = 0;
let acumuladorMenosUno = 0;

for(let i = 1; i<101; i++){
    acumuladorMenosUno = acumulador;
    acumulador = acumulador + i;
    
    console.log(i+"+"+(acumuladorMenosUno)+"="+acumulador);
}