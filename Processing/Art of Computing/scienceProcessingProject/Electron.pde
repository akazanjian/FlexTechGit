class Electron {
  float x;
  float y;
  float diameter;
  float rotationSpeed, r;
  int electronNumber;

  Electron(int electronNumber_, float r_) {
    electronNumber = electronNumber_;
    diameter = 20;
    r = r_;
    rotationSpeed = .05;
  }

  void draw() {
    pushMatrix();
    translate(width/2, height/2);
    stroke(5);
    fill(255, 255, 0, 100);
    float phaseAngle = electronNumber * 2 * PI/electrons.size();
    float angle =  rotationSpeed * frameCount + phaseAngle;   
    ellipse(r * cos(angle), r * sin(angle), diameter, diameter);
    popMatrix();
  }
}
