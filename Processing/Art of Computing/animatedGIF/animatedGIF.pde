float rotationAngle = 1.1;
float frameNumber;

void setup() {
  size(200, 200);
  frameRate(60);
}

void draw() {
//  if (frameNumber >= 1001) {
//    frameNumber = 0;
//  }
//  frameNumber = frameNumber + 1;
//  if (frameNumber <= 500) {
//    rotationAngle = rotationAngle * 1.01;
//  }
//  if (frameNumber >= 501 && frameNumber <= 1000) {
//    rotationAngle = rotationAngle / 1.01;
//  }
  rotationAngle = rotationAngle + .1;
  background(0);
  fill(255);
  translate(width/2, height/2);
  rectMode(CENTER);
  rotate(rotationAngle/1);
  rect(0, 0, 20, 80);
}

