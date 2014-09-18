class Platform {
  //  float rotationAngle = 0;
  float frameNumber;
  float x, y;
  float w, h;
  float deg;
  float rad;

  Platform() {
    x = 0;
    y = 0;
    w = 80;
    h = 20;
    deg = 12;
    rad = radians(deg);
  }

  void draw() {
    rad = rad + radians(deg);
    fill(255);
    pushMatrix();
    translate(width/2, height/2);
    rectMode(CENTER);
    rotate(rad);
    rect(x, y, w, h);
    popMatrix();
  }
}

