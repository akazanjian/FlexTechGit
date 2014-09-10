int maxLevel = 5;
float diameterScaling = 0.375;
float[] randomValues;
int counter = 0;

void setup() {
  size(400, 400);

  randomValues = new float[2049];
  for (int i = 0; i < randomValues.length; ++i) {
    randomValues[i] = random(1.5, random(3, 6))*0.0001;
  }
}

void draw() {
  counter = 0;
  drawFractal(0, 0, width/2, 0);
  diameterScaling = cos(frameCount * 0.01) * 0.1 + 0.5;
  background(255);
  translate(width/2, height/2);
  rotate(millis()*0.0002);
}

void drawFractal(float x, float y, float diameter, int level) {
  if (level >= maxLevel) {
    return;
  }
  ++counter;
  rotate(PI/(level + randomValues[counter]));
  //  noStroke();
  fill(255.0*(level + 1)/(maxLevel), 0, 255.0*(level + 3)/(maxLevel));
  ellipse(x, y, diameter, diameter);
  drawFractal(x-diameter/2, y, diameter * diameterScaling, level + 1);
  drawFractal(x+diameter/2, y, diameter * diameterScaling, level + 1);
  drawFractal(x, y-diameter/2, diameter * diameterScaling, level + 1);
  drawFractal(x, y+diameter/2, diameter * diameterScaling, level + 1);
}


