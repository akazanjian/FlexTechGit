float[] oldX, oldY;
float easing;
int numberOfPoints;

void setup() {
  size(640, 480);
  numberOfPoints = 30;
  oldX = new float[numberOfPoints];
  oldY = new float[numberOfPoints];
  easing = .6;
}

void draw() {
  background(0);
  noStroke();
  // index will be from 0 to numberOfPoints - 1
  int index = frameCount % numberOfPoints;
  println(frameCount);
  for (int i = 0; i< numberOfPoints; i++) {
    ellipse(oldX[i], oldY[i], 30, 30);
  }
  oldX[index] = oldX[index] + easing * (mouseX - oldX[index]);
  oldY[index] = oldY[index] + easing * (mouseY - oldY[index]);
}

