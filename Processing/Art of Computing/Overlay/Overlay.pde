void setup() {
  size(750, 750);
}

void draw() {
  background(186, 216, 88);
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 100, 100);
  fill(255);
  noStroke();
  ellipse(width/2, height/2, 50, 50);
  ellipse(100, 100, 50, 50);
}
