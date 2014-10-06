class Proton {
  float diameter;
  float x, y;
  int protonNumber;

  Proton(float x_, float y_, int protonNumber_) {
    x = x_;
    y = y_;
    protonNumber = protonNumber_;
    diameter = 50;
  }

  void draw() {
    pushMatrix();
    stroke(5);
    fill(204, 153, 255, 150);
    translate(width/2, height/2);
    ellipse(x, y, diameter, diameter);
    popMatrix();
  }
}
