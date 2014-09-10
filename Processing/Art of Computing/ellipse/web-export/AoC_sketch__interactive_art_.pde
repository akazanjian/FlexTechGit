float scale = 1;
color theColor = color(255);

void setup() {
  size(1000, 800);
  setScale(700);
  setColor(color(255, 0, 0));
  background(12, 12, 12);
}

void setScale(float s) {
  scale = s;
}

void setColor(color c) {
  theColor = c;
}

void draw() {
  noStroke();
  fill(theColor);
  ellipse(width/2, height/2, scale, scale);
}

