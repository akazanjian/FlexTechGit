class Food {
  float x, y;
  float scale = 2;
  boolean isVisible = true;
  long teleportTime;
  long TELEPORT_DURATION = 500;


  void setScale(float s) {
    scale = s;
  }

  Food(float x_, float y_) {
    x = x_;
    y = y_;
  }
  void drawFood() {
    fill(0, 0, 255);
    ellipse(x, y, 25, 25);
  }
  //1000 X 800 window
  void teleport() {
    teleportTime = millis();
    isVisible = false;
    x = random(100, 900);
    y = random(100, 700);
    if (millis() - teleportTime > TELEPORT_DURATION) {
      isVisible = true;
    }
  }
}
