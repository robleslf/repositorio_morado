let num2 = '';
let par;
num2 = parseInt(prompt("Introduzca un numero para saber si es par o impar: "));
for(let i=0;i<num2;i++){
    par = i % 2;
    if (par==0)
        //console.log("El numero " + i + " es par");
        document.write("El numero " + i +" es par <br>" );
    else{
        //console.log("El numero " + i + " es impar");
        document.write("El numero " + i + " es impar <br>");
    }
};
