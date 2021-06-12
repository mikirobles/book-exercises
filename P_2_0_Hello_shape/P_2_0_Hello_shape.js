// This was ported to p5.js from the Processing .pde file.
// Therefore, the code might not be the cleanest
// javascript there is or it might not work as well
// as in the native Process program.

let GRADIENT = "gradient";
let RANDOM = "random";
let LOW_OPACITY = 0.2;
let HIGH_OPACITY = 1;

let hasFill = true;
let hasStroke = true;
let colorGenerateMode = GRADIENT;
let opacity = LOW_OPACITY;

function setup() {
  colorMode(HSB, width, 100, 100, 1);
  background(0, 0, 100)
  createCanvas(800, 800);
  frameRate(60);
}

function draw() {
  if (mouseIsPressed) {
    translate(width / 2, height / 2);

    const segmentCount = map(mouseY, 0, height, 2, 20);
    const radius = mouseX - width / 2 + 0.5;
    const segmentAngle = TWO_PI / segmentCount;

    strokeWeight(2);
    stroke(getStrokeColor());
    fill(getFillColor());
    beginShape();
    for (let i = 0; i <= segmentCount; i++) {
      const py = cos(i * segmentAngle) * radius;
      const px = sin(i * segmentAngle) * radius;
      vertex(px, py);
    }
    endShape();
  }
}

function getFillColor() {
  let newColor = color(0, 0, 100, 0);
  if (hasFill && colorGenerateMode == GRADIENT) {
    const hue = map(mouseX - width / 2, 0, width / 2, 0, 100);
    newColor = color(hue, 100, 100, opacity);
  }
  if (hasFill && colorGenerateMode == RANDOM) {
    const hue = random(0, width / 8);
    newColor = color(hue, 100, 100, opacity);
  }
  return newColor;
}

function getStrokeColor() {
  let newColor = color(0, 0, 100, 0);
  if (hasStroke && colorGenerateMode == GRADIENT) {
    const hue = map(mouseX - width / 2, 0, width / 2, 100, 0);
    newColor = color(hue, 100, 100, opacity / 2);
  }
  if (hasStroke && colorGenerateMode == RANDOM) {
    const hue = random(0, width / 8);
    newColor = color(hue, 100, 100, opacity / 2);
  }
  return newColor;
}

function keyReleased() {
  if (key == "1") hasFill = !hasFill;
  if (key == "2") hasStroke = !hasStroke;
  if (key == "3") background(0, 0, 100);
  if (key == "4") setcolorGenerateMode();
  if (key == "5") setOpacity();
}

function setcolorGenerateMode() {
  if (colorGenerateMode == RANDOM) {
    colorGenerateMode = GRADIENT;
    return;
  }
  colorGenerateMode = RANDOM;
}

function setOpacity() {
  if (opacity == LOW_OPACITY) {
    opacity = HIGH_OPACITY;
    return;
  }
  opacity = LOW_OPACITY;
}
