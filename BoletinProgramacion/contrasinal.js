let contrasinal='';
let num3;
let contrasinal1='';
contrasinal =prompt("Introduzca un contrasinal de minimo 8 caracteres: ");
num3 = contrasinal.length;

while (num3<=8){
    contrasinal1=prompt("Introduzca una nueva cumpliendo los requisitos: ")
    num3=contrasinal1.length;
}
document.write("Esta es tu nueva contraseña " + contrasinal1);


