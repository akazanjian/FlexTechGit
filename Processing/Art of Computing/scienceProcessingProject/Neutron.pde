class Neutron {
  float diameter;
  float x, y;
  int neutronNumber;

  Neutron(float x_, float y_, int neutronNumber_) {
    x = x_;
    y = y_;
    neutronNumber = neutronNumber_;
    diameter = 50;
  }

  void draw() {
    pushMatrix();
    stroke(5);
    fill(160, 160, 160, 100);
    translate(width/2, height/2);
    ellipse(x, y, diameter, diameter);
    popMatrix();
  }
}
