class Ball {
  float diameter = 20;
  float strokeWidth = 3;
  float x, y;
  float vx, vy;
  float ay;

  Ball() {
    x = 0;
    y = 0;
    vx = 8;
    vy = 0;
    ay = .5;
  }

  void draw() {
    fill(0, 255, 0);
    stroke(strokeWidth);
    ellipse(x, y, diameter, diameter);
    x += vx;//x moves forward with velocity vx
    y += vy;//y moves forward with velocity vy
    vy += ay;//vy increases due to gravitational acceleration
  }
}

