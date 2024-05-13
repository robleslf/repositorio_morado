// Bucle FOR


// i++ es lo mismo que i=i+1; o sea, desde el cero, y mientras i sea menor a 50, va a ir sumando uno.

let cuenta= "";

for(let i=0; i<50; i++) {
    console.log("El valor de la cuenta es...",i);

    let cuenta+="<h5>El valor de la cuenta es ..."+i+"</h5>";

    document.getElementsById("cuenta").innerHTML=cuenta;
}  


// Sin el "+" en lo de cuenta, en vez de ir mostrando cada número, mostraría solo el último, porque simplemente igualaría cada vez la variable a ese número.

