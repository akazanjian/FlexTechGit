class Electron {
  float x;
  float y;
  float rotationSpeed;
  float diameter;
  int electronNumber;

  Electron(int electronNumber_) {
    electronNumber = electronNumber_;
    rotationSpeed = .05;
    diameter = 20;
  }

  void draw() {
    pushMatrix();
    translate(width/2, height/2);
    stroke(204, 204, 0, 150);
    fill(255, 255, 0, 100);
    float phaseAngle = electronNumber * 2 * PI/numberOfElectronsInShell();
    float angle =  rotationSpeed * frameCount + phaseAngle;   
    float radius = shellDiameter(electronNumber)/2;
    ellipse(radius * cos(angle), radius * sin(angle), diameter, diameter);
    popMatrix();
  }
}
