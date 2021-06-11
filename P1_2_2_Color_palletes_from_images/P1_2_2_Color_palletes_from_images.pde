import generativedesign.*;
PImage img;
color[] colors;
int tileCount;
float tileSize;
String sortMode = null;

void setup() {
  img = loadImage("img.png");
  size(500,500);
  noStroke();
}

void draw() {
  tileCount = width / max(mouseX, 2);
  tileSize = width / tileCount;
  
  colors = new color[tileCount*tileCount];
  
  setColors();
  if (sortMode != null) {
    sortColors();
  }
  drawPicture();
}

void setColors() {
  int i = 0;
  for(int gridY = 0; gridY < tileCount;gridY++) {
    for(int gridX = 0; gridX < tileCount;gridX++) {
       int py = (int) (gridY * tileSize);
       int px = (int) (gridX * tileSize);
       colors[i] = img.get(px,py);
       i++;
    }
  }
}

void drawPicture() {
  int i = 0;
  for(int gridY = 0; gridY < tileCount;gridY++) {
    for(int gridX = 0; gridX < tileCount;gridX++) {
       fill(colors[i]);
       rect(gridX * tileSize, gridY * tileSize, tileSize, tileSize);
       i++;
    }
  }
}

void sortColors() {
  colors = GenerativeDesign.sortColors(this,colors,sortMode);
}

void keyReleased() {
  if (key == '1') sortMode = null;
  if (key == '2') sortMode = GenerativeDesign.HUE;
  if (key == '3') sortMode = GenerativeDesign.SATURATION;
  if (key == '4') sortMode = GenerativeDesign.BRIGHTNESS;
  if (key == '5') sortMode = GenerativeDesign.GRAYSCALE;
}
