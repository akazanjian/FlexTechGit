Sprite player;
TargetSprite target;


void setup() {
  size(600, 500);
  player = new Sprite( width/2, height * 3 / 4, 30, 30, color(0, 0, 255));
  target = new TargetSprite( width/2, height / 2, 30, 30, color(255, 0, 0), player);
  background(100);
}

void draw() {
  background(100);
  stroke(2);
  float xscale = width/1300.0;
  float yscale = height/1000.0;
  line(135 * width/1300, 85 * yscale, 135 * xscale, 915 * yscale); //vertical
  line(1165 * xscale, yscale * 85, 1165 * xscale, yscale *915); // vertical
  line(135 * xscale, 85 * yscale, 1165 *xscale, 85 * yscale); // horizontal
  line(135 * xscale, 915 * yscale, 1165 * xscale, 915 * yscale); // horizontal
  line(mouseX, mouseY, player.x, player.y);
  // if (keyPressed) 
  player.move();
  target.move();
  if (player.touching (target)) {
    target.teleport();
  }
  target.drawSprite();
  player.drawSprite();
}

void keyPressed() {
  if (key == 32) {
    player.setTurbo(true);
  }
}

void keyReleased() {
  player.setTurbo(false);
}
class Sprite {
  float easing = .01;
  float x, y, w, h, xp, yp;
  color c;

  Sprite(float x_, float y_, float w_, float h_, color c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }


  void drawSprite() {
    pushMatrix();
    rectMode(CENTER);
    fill(c);
    noStroke();
    rect(x, y, w, h);
    popMatrix();
  }

  void moveRight(float deltaX) {
    x += deltaX;
  }

  void moveDown(float deltaY) {
    y += deltaY;
  }

  void move() {
    //println(keyPressed);
    //println(keyCode);
    //if (key == CODED);
    //if (keyPressed && (key == 't')) {
    //easing = .3;
    //}
    x += (mouseX - x) * easing;
    y += (mouseY - y) * easing;
    // || (1/2 * height == 800)
  }

  void setTurbo(boolean turboOn) {
    if (turboOn) {
      easing = .3;
    } 
    else {
      easing = .01;
    }
  }

  boolean touching(Sprite otherSprite) {
    if (abs(x - otherSprite.x) > (w + otherSprite.w)/2) {
      return false;
    }
    return (abs(y - otherSprite.y) < (h + otherSprite.h)/2);
  }
  void eat(Sprite otherSprite) {
    //h* = (w*h1)/w1 and w* = square root of (w1/h1 (w1h1 + w2h2)
  }
}

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

    //float moveSize = 3;
    //if (keyCode == UP) {
    //moveDown(-moveSize);
    //      y -= 10;
    //} 
    //else if (keyCode == DOWN) {
    //moveDown(moveSize);
    //} 
    //else if (keyCode == RIGHT) {
    //moveRight(moveSize);
    //} 
    //else if (keyCode == LEFT) {
    //moveRight(-moveSize);
    //  }

