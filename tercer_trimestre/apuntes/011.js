// D.O.M → Document Object Model
// Cómo ve JS la estructura de nuestras páginas web.

// Diferencias entre let, var y const
var a = 5;
let b = 10;
const c = 15;

if(true){
    var a = 75;
    let b = 105;
    const c = 500;

    console.log(a,b,c)
}

console.log(a,b,c)

// alcance de una variable (buscar); let hace que la variable solo viva entre los códigos de llaves; var tiene más alcance. Si queremos que una variable se restrinja a una zona determinada de código, usamos let.
//


        // Acceso al contenido dentro de una etiqueta HTML
        console.log(document.getElementById("header1").innerHTML);

        // Acceso a TODO el nodo de una etiqueta html; puedes cambiar el h1 pr h2 por ejemplo
        console.log(document.getElementById("header1").outerHTML);

        // Acceso a un nodo por nombre; como devuelve un array, hay que especificarle un índice; si quiero el primer elemento, que es el input, pongo el 0, si quiero el párrafo, que es el 1, pongo el uno.
        console.log(document.getElementsByName("usuario")[0]);
        console.log(document.getElementsByName("usuario")[1]);

        // Acceso a un nodo por clase (devuelve un array de objetos)
        console.log(getElementsByClassName("inputClass")[0]);

        // Declaremos una variable
        let elemento = document.getElementsByClassName("loop");

        // y vamos a usar un bucle para recorrer el elemento
        for(let i = 0; i<elemento.length;i++){
            console.log("Elemento →",i);
            console.log(elemento[i].innerHTML);
        }


// 
// 
// 
// 
// 
// 

// 
// 
// 