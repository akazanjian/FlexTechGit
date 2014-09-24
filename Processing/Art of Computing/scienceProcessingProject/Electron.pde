class Electron {
  float x;
  float y;
  float diameter;

  Electron(float x_, float y_) {
    x = x_;
    y = y_;
    diameter = 20;
  }

  void draw() {
    pushMatrix();
    translate(width/2, height/2);
    noStroke();
    fill(255, 255, 0);
    ellipse(x, y, diameter, diameter);
    popMatrix();
  }
}

