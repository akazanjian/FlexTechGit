class TargetSprite extends Sprite {
  boolean isVisible = true;
  long teleportTime;
  long TELEPORT_DURATION = 500;
  Sprite player;


  TargetSprite (float x_, float y_, float w_, float h_, color c_, Sprite p_) {
    super(x_, y_, w_, h_, c_);
    player = p_;
  }

  void move() {
    float dist = sqrt((x - player.x) * (x - player.x) + (y - player.y) * (y - player.y));
    x += (x - player.x) / dist;
    y += (y - player.y) / dist;
    float xscale = width/1300.0;
    float yscale = height/1000.0;
    // Prevent target from going off screen.
    if (target.x < 150.0 * xscale) {
      // || (1/2 * height2500)
      x = 150.0 * xscale;
      y += (y - player.y) / dist;
    }
    if (target.x > 1150.0 * xscale) {
      x = 1150.0 * xscale;
      y += (y - player.y) / dist;
    }
    if (target.y < 100.0 * yscale) {
      y = 100.0 * yscale;
      x += (x - player.x) / dist;
    }
    if (target.y > 900.0 * yscale) {
      y = 900.0 * yscale;
      x += (x - player.x) / dist;
    }
  }

  void teleport() {
    teleportTime = millis();
    isVisible = false;
    float xscale = width/1300.0;
    float yscale = height/1000.0;
    x = random(200 * xscale, 1200 * xscale);
    y = random(150 * yscale, 950 * yscale);
  }

  void drawSprite() {
    if (isVisible) {
      super.drawSprite(); 
      return;
    }
    if (millis() - teleportTime > TELEPORT_DURATION) {
      isVisible = true;
    }
  }
}

