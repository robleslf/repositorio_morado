// Interruptor para personaje escogido
let interruptor = 0;

// Enemigos
const enemigo_1 = document.getElementById('enemigo_1');
const enemigo_2 = document.getElementById('enemigo_2');
const enemigo_3 = document.getElementById('enemigo_3');

// Esto es lo que hace que la posición top del css de los enemigos vaya cambiando para que salgan en diferentes alturas
function cambiar_la_Y_de_enemigos(enemigo) {
    const randomTop = Math.floor(Math.random() * (700 - 100 + 1)) + 100;
    enemigo.style.top = randomTop + 'px';
}


// Movimiento del Pájaro
document.addEventListener("DOMContentLoaded", function () {
  let posX = 10.0; // Posición inicial X
  let posY = 200.0; // Posición inicial Y

  var space = document.getElementById("divPajaro");

  function handleKeyPress(event) {
    const step = 10; // Píxeles que se moverá el objeto
    let containerWidth = document.body.clientWidth; // Ancho del contenedor
    let containerHeight = document.body.clientHeight; // Altura del contenedor
    let spaceWidth = space.offsetWidth;
    let spaceHeight = space.offsetHeight;
    let maxPosX = containerWidth - spaceWidth;
    let maxPosY = containerHeight - spaceHeight;

    // switch (event.key) {
    //     case "ArrowUp":  
    //             if (posY > 0) {
    //                 posY -= step;
    //             }
    //             break;
    //     case "ArrowDown":
    //         // if (posY < maxPosY) {
    //             posY += step;
    //             posX += step;
    //         // }
    //         // break;
    //     case "ArrowLeft":
    //         if (posX > 0) {
    //             posX -= step;
    //         }
    //         break;
    //     case "ArrowRight":
    //         if (posX < maxPosX) {
    //             posX += step;
    //         }
    //         break;
    // }


    switch (event.key) {
        case "ArrowUp":  
                if(interruptor==1){
                    if (posY > 0) {
                        posY -= step;
                    }
                    break;
                }
                else if(interruptor==2){
                    if (posY > 0) {
                        posY -= step;
                        if (posX > 0) {
                            posX -= 3*step;
                        }
                        break;
                    }
                    break;
                }
        case "ArrowDown":
            if(interruptor==1){
                posY += step;
            }
            else if(interruptor ==2){
                posY += step;
                if (posX > 0) {
                    posX -= 3*step;
                }
                break;
            }
            break;
        case "ArrowLeft":
            if(interruptor==1){
                if (posX > 0) {
                    posX -= 3*step;
                }
                break;
            }
            else if(interruptor==2){
                if (posX > 0) {
                    posX -= 3*step;
                }
                break;
            }
            break;

            
        case "ArrowRight":
            if(interruptor==1){
                if (posX < maxPosX) {
                    posX += step;
                    }
                    break;
            }
            else if(interruptor==2){
                if (posX < maxPosX) {
                    posX += 3*step;
                    }
                    break;
            }
                
    }

    updatePosition();
}


  function updatePosition() {
      space.style.left = posX + "px";
      space.style.top = posY + "px";
  }

  document.addEventListener("keydown", function(event) {
      if (space) {
          handleKeyPress(event);
      }
  });




  document.getElementById("play_boton").addEventListener("click", function() {

      interruptor = 1;

      document.body.style.backgroundImage = "url('https://alk3r.wordpress.com/wp-content/uploads/2016/11/3ef5d-1478555468441.gif?w=700')";

      var divPajaro = document.getElementById("divPajaro");
      divPajaro.classList.add("pajaroVolante"); 
      // divPajaro.style.position = "absolute";
      updatePosition();

      var boton_de_play = document.getElementById("play_boton");
      boton_de_play.style.display = "none";

      var boton_de_play = document.getElementById("play_boton_2");
      boton_de_play.style.display = "none";


      var musiquita = document.getElementById("musiquitaNES");
      musiquita.play();

    //  Contador (fuente: https://codepen.io/evilnapsis/pen/wBZBgv)
        var n = 0;
        var l = document.getElementById("number");
        window.setInterval(function(){
          l.innerHTML = "Puntuación: " + n;
          n++;
        },0.50);

    // El intervalo este hace que la función que cambia la posición Y del enemigo se ejecute cada 4 segundos, que es lo que dura la animación de desplazamiento X de los enemigos -- DEBE IR JUSTO ANTES DE LA LÍNEA DE ABAJO QUE AÑADE LA CLASE AL ENEMIGO PARA EL CSS
    setInterval(() => {
        cambiar_la_Y_de_enemigos(enemigo_1);
    }, 4000);
   
    document.getElementById("enemigo_1").classList.add("gifs_de_pajaritos");

        
              
    });

document.getElementById("play_boton_2").addEventListener("click", function() {


    interruptor = 2;

    document.body.style.backgroundImage = "url('https://alk3r.wordpress.com/wp-content/uploads/2016/11/3ef5d-1478555468441.gif?w=700')";

    var divPajaro = document.getElementById("divPajaro");
    divPajaro.classList.add("pajaroVolante_2"); 
    // divPajaro.style.position = "absolute";
    updatePosition();


    var boton_de_play = document.getElementById("play_boton");
    boton_de_play.style.display = "none";

    var boton_de_play = document.getElementById("play_boton_2");
    boton_de_play.style.display = "none";


    var musiquita = document.getElementById("musiquitaNES_2");
    musiquita.play();

    //  Contador (fuente: https://codepen.io/evilnapsis/pen/wBZBgv)
    var n = 0;
    var l = document.getElementById("number");
    window.setInterval(function(){
    l.innerHTML = "Puntuación: " + n;
    n++;
    },0.50);

    // El intervalo este hace que la función que cambia la posición Y del enemigo se ejecute cada 4 segundos, que es lo que dura la animación de desplazamiento X de los enemigos -- DEBE IR JUSTO ANTES DE LA LÍNEA DE ABAJO QUE AÑADE LA CLASE AL ENEMIGO PARA EL CSS
    setInterval(() => {
        cambiar_la_Y_de_enemigos(enemigo_1);
    }, 4000);
   document.getElementById("enemigo_1").classList.add("gifs_de_pajaritos");
   
    
});


});






