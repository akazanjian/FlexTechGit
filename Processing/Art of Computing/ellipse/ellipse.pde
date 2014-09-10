float scale = 1;
color theColor = color(255);

void setup() {
  size(400, 400);
  setScale(50);
  setColor(color(255, 0, 0));
}

void setScale(float s) {
  scale = s;
}

void setColor(color c) {
  if (c < 0) {
    theColor = c;
  } 
  else {
    theColor = unhex("FF" + c);
  }
  //println(c);
  //theColor = c;
}

void draw() {
  background(12, 12, 12);
  noStroke();
  fill(theColor);
  ellipse(width/2, height/2, scale, scale);
}

