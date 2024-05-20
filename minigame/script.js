document.addEventListener("DOMContentLoaded", function () {
  let posX = 10.0; // Posición inicial X
  let posY = 50.0; // Posición inicial Y

  var space = document.getElementById("space");

  if (space) {
    space.style.position = "absolute";
    updatePosition();

    function handleKeyPress(event) {
      const step = 10; // Píxeles que se moverá el objeto
      let containerWidth = document.body.clientWidth; // Ancho del contenedor
      let containerHeight = document.body.clientHeight; // Altura del contenedor

      switch (event.key) {
        case "ArrowUp":
          if (posY > 0) {
            posY -= step;
          }
          break;
        case "ArrowDown":
          if (posY < containerHeight - space.offsetHeight) {
            posY += step;
          }
          break;
        case "ArrowLeft":
          if (posX > 0) {
            posX -= step;
          }
          break;
        case "ArrowRight":
          if (posX < containerWidth - space.offsetWidth) {
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

    document.addEventListener("keydown", handleKeyPress);
  } else {
    console.error("No encuentro el elemento #space");
  }
});
