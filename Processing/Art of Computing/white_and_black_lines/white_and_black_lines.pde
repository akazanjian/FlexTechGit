/**
 * Continuous Lines. 
 * 
 * Click and drag the mouse to draw a line. 
 */

void setup() {
  size(640, 360);
  background(255, 0, 0);
}

void draw() {
  if (mousePressed == true) {
    background (255, 0, 0);
  }
  if (keyPressed == true) {
    background (0, 0, 255);
  }
}
