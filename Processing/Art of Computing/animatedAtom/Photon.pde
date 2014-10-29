class Photon {
  float x;
  float y;
  float x2;
  float y2;
  float r;
  float timing;
  float timing2;

  Photon() {
    x = 0;
    y = 0;
    x2 = -200;
    y2 = 0;
    r = 50;
    timing = 0;
    timing2 = 0;
  }

  void draw() {
    timing += 1;
    float phaseAngle = 2 * PI;
    float angle = 0.08 * timing + phaseAngle;
    if (frameCount >= 120) {
      pushMatrix();
        translate(width/2, height/2);
      timing2 += 1;
      float angle2 = 0.08 * timing2 + phaseAngle;
      fill(255, 255, 153);
      stroke(0);
      ellipse(x2, r * sin(angle2), 10, 10);
      x2 -= 2.5;
      popMatrix();
      return;
    }
    pushMatrix();
    translate(width/2, 0);
    fill(255, 255, 153);
    stroke(0);
    ellipse(r * cos(angle), y, 10, 10);
    y += 2.5;
    popMatrix();
  }
}

