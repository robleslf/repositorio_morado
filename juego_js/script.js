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

    switch (event.key) {
        case "ArrowUp":
            if (posY > 0) {
                posY -= step;
                if (posX > 0) {
                  posX -= step;
              }
              break;
            }
            break;
        case "ArrowDown":
            // if (posY < maxPosY) {
                posY += step;
            // }
            // break;
        case "ArrowLeft":
            if (posX > 0) {
                posX -= step;
            }
            break;
        case "ArrowRight":
            if (posX < maxPosX) {
                posX += step;
            }
            break;
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




