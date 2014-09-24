class Proton {
  float diameter;
  float x, y;

  Proton(float x_, float y_) {
    x = x_;
    y = y_;
    diameter = 50;
  }

  void draw() {
    pushMatrix();
    fill(204, 153,255);
    noStroke();
    translate(width/2, height/2);
    ellipse(x, y, diameter, diameter);
    popMatrix();
  }
}

