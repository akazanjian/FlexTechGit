float scaleDown = 0.45;
int maxLevel = 6;

//float cosR = cos(rotation);
//float sinR = sin(rotation);

void setup() {
  size(1000, 1000);

  int bgColor = 255;
  background(bgColor);


  //drawSquare(width/2, height/2, width/2, 0);
}

void drawSquare(float x1, float y1, float sideLength, int level) {
  if (level > maxLevel) {
    return;
  }
  rectMode(CENTER);  // Set rectMode to CENTER
  noFill();
  rect(x1, y1, sideLength, sideLength);
  drawSquare(x1-(sideLength/2), y1-(sideLength/2), sideLength * scaleDown, level + 1);
  drawSquare(x1+(sideLength/2), y1+(sideLength/2), sideLength * scaleDown, level + 1);
  drawSquare(x1-(sideLength/2), y1+(sideLength/2), sideLength * scaleDown, level + 1);
  drawSquare(x1+(sideLength/2), y1-(sideLength/2), sideLength * scaleDown, level + 1);
}

void draw() {
  background(255);
  scaleDown = cos(frameCount * 0.01) * 0.1 + 0.5;
  drawSquare(width/2, height/2, width/2, 0);
}

