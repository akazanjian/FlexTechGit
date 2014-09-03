float rotation = PI /3;
float scaleDown = 1;
int maxLevel = 10;

float cosR = cos(rotation);
float sinR = sin(rotation);

void setup() {
  size(1000, 1000);
  
  int bgColor = 255;
  background(bgColor);


  drawTree(width/2, height * 0.9, width/2, height * 0.77, 0);
}

void drawTree(float x1, float y1, float x2, float y2, int level) {
  float trunkLength = dist(x1, y1, x2, y2);
  if (level > maxLevel) {
    return;
  }
  line(x1, y1, x2, y2);
  drawTree(x2, y2, x2 + scaleDown * (cosR*(x2-x1) - sinR*(y2 - y1)), y2 + scaleDown * (sinR*(x2-x1) + cosR*(y2 - y1)), level + 1);
  drawTree(x2, y2, x2 + scaleDown * (cosR*(x2-x1) + sinR*(y2 - y1)), y2 +scaleDown * (- sinR*(x2-x1) + cosR*(y2 - y1)), level + 1);
}
