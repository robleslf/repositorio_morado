let temp='';

temp = parseInt(prompt("Introduzca una temperatura: "));

if (temp<10){
    console.log("Temperatura Baixa");
    document.write("Temperatura Baixa")
}
if (temp>=10 && temp<=25){
    console.log("Temperatura Media");
    document.write("Temperatura Media")
}
else{
    console.log("Temperatura Alta");
    document.write("Temperatura Alta")
};
