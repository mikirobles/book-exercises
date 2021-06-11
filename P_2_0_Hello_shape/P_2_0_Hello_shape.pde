boolean hasFill = true;
boolean hasStroke = true;

void setup() {
  background(255,255,255);
  size(800,800);
  colorMode(HSB, width/2, 100, 100, 1);
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
  if (!hasFill) return color(0,0,100,0);
  float hue = map(mouseX - width/2, 0, width/2, 0, 100);
  return color(hue,100,100, .05);
}

color getStrokeColor() {
  if (!hasStroke) return color(0,0,100,0);
  float hue = map(mouseX - width/2, 0, width/2, 100, 0);
  return color(hue,100,50, .4);
}

void keyReleased() {
  if (key == '1') hasFill = !hasFill;
  if (key == '2') hasStroke = !hasStroke;
  if (key == '3') background(0, 0,100);
}
