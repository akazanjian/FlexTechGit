class Neutron {
  float diameter;
  float x, y;
  int neutronNumber;

  Neutron(int neutronNumber_) {
    float angle = random(0, 2 * PI);
    x = neutronNuclearRadius * cos(angle);
    y = neutronNuclearRadius * sin(angle);
    neutronNumber = neutronNumber_;
    diameter = 50;
  }

  void draw() {
    pushMatrix();
    stroke(96, 96, 96, 125);
    fill(160, 160, 160, 100);
    translate(width/2, height/2);
    ellipse(x, y, diameter, diameter);
    popMatrix();
  }
}
