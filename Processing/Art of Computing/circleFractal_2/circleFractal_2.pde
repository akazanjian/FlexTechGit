int maxLevel = 6;//5;
float diameterScaling = 0.375;//375;
float[] randomValues;
int counter = 0;

void setup() {
  size(720, 720);
  int arraySize = (int)(2 * (pow(4, maxLevel) + 1));
  randomValues = new float[arraySize];
  for (int i = 0; i < randomValues.length; ++i) {
    randomValues[i] = random(1.5, random(3, 6))*0.0001;
  }
  frameRate(60);
}

void draw() {
  diameterScaling = cos(frameCount * 0.01) * 0.1 + 0.5;
  background(255);
  text("fps="+ (int)(1000.00 * frameCount/millis()), 20, 20);
  translate(width/2, height/2);
  rotate(millis()*diameterScaling*0.00005);
  counter = 0;
  drawFractal(0, 0, width/2, 0);
  saveFrame("myImageSequence-####.png");
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

