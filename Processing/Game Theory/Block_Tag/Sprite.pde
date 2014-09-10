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

