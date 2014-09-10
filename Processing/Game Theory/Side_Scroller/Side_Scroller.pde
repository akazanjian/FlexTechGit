class Player {
  int x, y, vy, vx, bodyHeight = 72;
  int scale = 2;
  boolean jumping;

  void setScale(int s) {
    scale = s;
  }

  Player(int x_, int y_) {
    x = x_;
    y = y_;
    vy = 0;
    jumping = false;
  }

  void drawPlayer() {
    translate(x, y);
    float headDiameter = 12 * scale;
    fill(0);
    ellipse(0, 0, headDiameter, headDiameter);
    line(0, 0, 0, (0 + headDiameter) * 2);
    line(0 - headDiameter * 1/2, 0 + headDiameter, 0 + headDiameter * 1/2, 0 + headDiameter);
    line(0, 0 + headDiameter * 2, 0 + (headDiameter * 1/2), (0 + bodyHeight));
    line(0, 0 + headDiameter * 2, 0 - (headDiameter * 1/2), (0 + bodyHeight));
  }



  void move() {
    int moveSize = 3;
    if (keyCode == UP) {
      if (!jumping) {
        jumping = true;
        vy = 20;
      }
    }
    else if (keyCode == RIGHT) {
      vx = moveSize;
    }
    else if (keyCode == LEFT) {
      vx = -moveSize;
    }
    x += vx;
    y -= vy;
    vy -= 1;
    if (y >= height - bodyHeight) {
      vy = 0;
      y = height - bodyHeight;
      jumping = false;
    }
  }
}
