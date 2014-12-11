class Proton {
  float diameter;
  float x, y;
  int protonNumber;
  boolean amICentered;

  Proton(int protonNumber_, boolean amICentered_) {
    amICentered = amICentered_;
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
    if (amICentered) {
      ellipse(0, 0, diameter, diameter);
    }
    else {
      ellipse(x, y, diameter, diameter);
    }
    popMatrix();
  }
}
