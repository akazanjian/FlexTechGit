class Electron {
  float r;

  Electron() {
    r = 100;
  }

  void draw() {
    pushMatrix();
    translate(width/2, height/2);
    stroke(0);
    fill(255, 255, 0);
    float phaseAngle = 2 * PI;
    float angle = 0.08 * frameCount + phaseAngle;
    ellipse(r * cos(angle), r * sin(angle), 25, 25);
    popMatrix();
    if (frameCount < 60) {
      return;
    }
    r = 200;
    if (frameCount < 120) {
      return;
    }
    r = 100;
  }
}

