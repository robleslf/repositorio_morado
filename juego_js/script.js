// Interruptor para personaje escogido
let interruptor = 0;


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
                        posX -= step;
                    }
                    break;
                }
        case "ArrowDown":
            if(interruptor==1){
                posY += step;
            }
            else if(interruptor ==2){
                posY += step;
                posX -= step;
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
        
              
          });

document.getElementById("play_boton_2").addEventListener("click", function() {


    interruptor = 2;

    var divPajaro = document.getElementById("divPajaro");
    divPajaro.classList.add("pajaroVolante_2"); 
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

    
});

});





