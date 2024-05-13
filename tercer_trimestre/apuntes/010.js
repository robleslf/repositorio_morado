// Arrays → Estructuras de datos multidimensionales


let dorsalesFutbol = [4, 10, 33, 25]
//                    0   1   2   3    ← Esto sería la posición de cada elemento del array

// diasSemana[2] ← puedes acceder a cada elemento individualmente




// Ejemplos prácticos:

let diasSemana = ["lunes","martes","miércoles","jueves","viernes","sábado","domingo"]

console.log(diasSemana)

console.log(diasSemana[4])

diasSemana[6] = "sunday"

console.log(diasSemana[6])

for(let i = 0; i<diasSemana.length;i++) {
    console.log(diasSemana[i])
}


// El forEach

diasSemana.forEach(function(dia){
    console.log(dia);

});

