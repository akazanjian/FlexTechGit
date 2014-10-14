class Electron {
  float x;
  float y;
  float rotationSpeed, r;
  float diameter;
  int electronNumber;

  Electron(int electronNumber_, float r_) {
    electronNumber = electronNumber_;
    r = r_;
    rotationSpeed = .05;
    diameter = 20;
  }

  void draw() {
    pushMatrix();
    translate(width/2, height/2);
    stroke(204, 204, 0, 150);
    fill(255, 255, 0, 100);
    float phaseAngle = electronNumber * 2 * PI/shell.size();
    float angle =  rotationSpeed * frameCount + phaseAngle;   
    ellipse(r * cos(angle), r * sin(angle), diameter, diameter);
    popMatrix();
  }
}
