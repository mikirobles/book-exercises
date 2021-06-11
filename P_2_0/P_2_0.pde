void setup() {
  size(500,500);
}

void draw() {
  if (mousePressed) {
    translate(width/2,height/2);
  
    int segmentCount = (int) map(mouseY, 0, height, 2, 40);
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
  colorMode(HSB, width/2, 100, 100);
  float hue = map(mouseX - width/2, 0, width/2, 0, 100);
  return color(hue,100,100, 2);
}

color getStrokeColor() {
  colorMode(HSB, width/2, 100, 100);
  float hue = map(mouseX - width/2, 0, width/2, 100, 0);
  return color(hue,100,10, 40);
}
