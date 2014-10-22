class Electron {
  float x;
  float y;
  float rotationSpeed;
  float diameter;
  int electronNumber;

  Electron(int electronNumber_) {
    electronNumber = electronNumber_;
    diameter = 20;
  }

  void draw() {
    pushMatrix();
    translate(width/2, height/2);
    float red_ = 0;
    float green_ = 204;
    float blue_ = 204;
    stroke(red_, green_, blue_, 150);
    fill(red_, green_, blue_, 100);
    int shellLevel_ = shellLevel(electronNumber);
    int numberOfElectronsInShell_ = numberOfElectronsInShell(shellLevel_);
    println("electronNumber="+electronNumber+"  shellLevel_="+shellLevel_+ "   numberOfElectronsInShell_="+numberOfElectronsInShell_);
    float phaseAngle = electronNumber * 2 * PI/numberOfElectronsInShell_;
    float rotationSpeed = .05 + 0.005 * shellLevel_;
    float angle =  rotationSpeed * frameCount + phaseAngle;   
    float radius = shellDiameter(electronNumber)/2;
    ellipse(radius * cos(angle), radius * sin(angle), diameter, diameter);
    popMatrix();
  }
}
