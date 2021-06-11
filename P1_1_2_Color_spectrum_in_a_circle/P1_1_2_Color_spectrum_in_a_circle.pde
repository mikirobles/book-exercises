int segmentCount;

void setup() {
 size(500,500); 
 noStroke();
 segmentCount = 12;
}

void draw() {
 colorMode(HSB, 360, width, height);
 background(360);
 int radius = 200;
 int angleStep = 360/segmentCount;
 
 beginShape(TRIANGLE_FAN);
 vertex(width/2,height/2);
 for(int angle=0;angle<=360;angle+=angleStep) {
   vertex(
     (width/2 + cos(radians(angle)) * radius),
     (height/2 + sin(radians(angle)) * radius)
   );
   fill(angle,mouseX,mouseY);
 }
}

void keyReleased() {
  switch(key) {
    case '1':
      segmentCount = 10;
      break;
    case '2':
      segmentCount = 20;
      break;
    case '3':
      segmentCount = 30;
      break;
    case '4':
      segmentCount = 40;
      break;
    case '5':
      segmentCount = 60;
      break;
  }
}
