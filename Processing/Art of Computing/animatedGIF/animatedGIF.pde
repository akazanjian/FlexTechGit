float rotationAngle = 1.1;

void setup() {
  size(300, 300);
  frameRate(60);
}

void draw() {
  if (frameCount <= 500) {
    rotationAngle = rotationAngle * 1.01;
  }
  if (frameCount >= 501 && frameCount <= 1000) {
    rotationAngle = rotationAngle / 1.01;
  }
  background(0);
  fill(.1 * millis());
  translate(width/2, height/2);
  rectMode(CENTER);
  rotate(rotationAngle/1);
  rect(0, 0, 20, 80);
}

