String GRADIENT = "gradient";
String RANDOM = "random";
float LOW_OPACITY = 0.2;
float HIGH_OPACITY = 1;

boolean hasFill = true;
boolean hasStroke = true;
String colorMode = GRADIENT; 
float opacity = LOW_OPACITY;

void setup() {
  background(255,255,255);
  size(800,800);
  colorMode(HSB, width/8, 100, 100, 1);
  frameRate(44);
}

void draw() {
  if (mousePressed) {
    translate(width/2,height/2);
  
    int segmentCount = (int) map(mouseY, 0, height, 2, 20);
    float radius = mouseX - width/2 + 0.5;
    float segmentAngle = TWO_PI/segmentCount;
    
    strokeWeight(2);
    stroke(getStrokeColor());
    fill(getFillColor());
    beginShape();
    for (int i = 0; i <= segmentCount; i++) {
      float py = cos(i*segmentAngle)*radius;
      float px = sin(i*segmentAngle)*radius;
      vertex(px, py);
    }
    endShape();
  }
}

color getFillColor() {
  color newColor = color(0,0,100,0);
  if (hasFill && colorMode == GRADIENT) {
    float hue = map(mouseX - width/2, 0, width/2, 0, 100);
    newColor = color(hue,100,100, opacity);
  }
  if (hasFill && colorMode == RANDOM) {
    float hue = random(0,width/8);
    newColor = color(hue,100,100, opacity);
  }
  return newColor;
}

color getStrokeColor() {
  color newColor = color(0,0,100,0);
  if (hasStroke && colorMode == GRADIENT) {
    float hue = map(mouseX - width/2, 0, width/2, 100, 0);
    newColor = color(hue,100,100, opacity/2);
  }
  if (hasStroke && colorMode == RANDOM) {
    float hue = random(0,width/8);
    newColor = color(hue,100,100, opacity/2);
  }
  return newColor;
}

void keyReleased() {
  if (key == '1') hasFill = !hasFill;
  if (key == '2') hasStroke = !hasStroke;
  if (key == '3') background(0, 0,100);
  if (key == '4') setColorMode();
  if (key == '5') setOpacity();
}

void setColorMode() {
  if (colorMode == RANDOM) {
   colorMode = GRADIENT;
   return;
  }
  colorMode = RANDOM;
}

void setOpacity() {
  if (opacity == LOW_OPACITY) {
   opacity = HIGH_OPACITY;
   return;
  }
  opacity = LOW_OPACITY;
}
