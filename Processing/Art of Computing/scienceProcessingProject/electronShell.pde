class ElectronShell {
  float x;
  float y;
  float diameter;

  ElectronShell(float diameter_) {
    diameter = diameter_;
    x = width/2;
    y = height/2;
  }

  void draw() {
    fill(0, 0, 0, 0);
    stroke(0, 0, 0, 150);
    ellipse(x, y, diameter, diameter);
  }
}
