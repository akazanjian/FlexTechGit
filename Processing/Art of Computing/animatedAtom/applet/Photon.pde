class Photon {
  float x;
  float y;
  float x2;
  float y2;

  Photon() {
    x = 0;
    y = 0;
    x2 = 75;
    y2 = height/2;
  }

  void draw() {
    translate(width/2, 0);
    float phaseAngle = 2 * PI;
    float angle = 0.08 * frameCount + phaseAngle;    
    if (frameCount >= 120) {
      fill(255, 255, 153);
      stroke(0);
      ellipse(x2, y2, 10, 10);
      x2 -= 2.5;
      return;
    }
    fill(255, 255, 153);
    stroke(0);
    ellipse(r * cos(angle), y, 10, 10);
    y += 2.5;
  }
}

