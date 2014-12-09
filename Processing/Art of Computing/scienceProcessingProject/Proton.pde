class Proton {
  float diameter;
  float x, y;
  int protonNumber;

  Proton(int protonNumber_) {
    float angle = random(0, 2 * PI);
    x = protonNuclearRadius * cos(angle);
    y = protonNuclearRadius * sin(angle);
    protonNumber = protonNumber_;
    diameter = 50;
  }

  void draw() {
    pushMatrix();
    stroke(153, 51, 255, 125);
    fill(204, 153, 255, 150);
    translate(width/2, height/2);
    ellipse(x, y, diameter, diameter);
    popMatrix();
  }
}
