float oldX, oldY, easing;

void setup() {
  size(640, 480);
  oldX = mouseX;
  oldY = mouseY;
  easing = .03;
}

void draw() {
  background(0);
  textSize(32);
  oldX = oldX + easing * (mouseX - oldX);
  oldY = oldY + easing * (mouseY - oldY);
  fill(0, 255, 0);
  text("Hello", oldX, oldY);
}

