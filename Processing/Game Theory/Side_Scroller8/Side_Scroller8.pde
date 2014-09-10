World world;

void setup() {
  size(500, 400);
  world = new World();
  frameRate(10);
}

void draw() {
  background(10, 170, 255);
  world.drawWorld();
}

class Rectangle {
  float x, y, w, h;

  Rectangle(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }


  boolean leftOf(Rectangle rectangle) {
    return x < rectangle.x;
  }

  boolean rightOf(Rectangle rectangle) {
    return x > rectangle.x;
  }

  boolean toTheRightOfLeftEdgeOf(Rectangle rectangle) {
    return x + w >= rectangle.x;
  }

  boolean toTheLeftOfRightEdgeOf(Rectangle rectangle) {
    return rectangle.x + rectangle.w <= x;
  }
  boolean above(Rectangle rectangle) {
    return y + h <= rectangle.y + 1/2 ;
  }
  boolean below(Rectangle rectangle) {
    return y >= rectangle.y + h;
  }



  boolean overlapsVertical(Rectangle rectangle) {
    if (rectangle.y >= y + h) {
      return false;
    }
    if (rectangle.y + rectangle.h <= y) {
      return false;
    }
    return true;
  }

  boolean overlapsHorizontally(Rectangle rectangle) {
    if (rectangle.x >= x + w) {
      return false;
    }
    if (rectangle.x + rectangle.w < x) {
      return false;
    }
    return true;
  }
}

class Player {
  int x, y, vy, vx, bodyHeight = 72, bodyWidth_ = 12;
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

  float bodyWidth() {
    return bodyWidth_ * scale;
  }

  void drawPlayer() {
    pushMatrix();
    translate(x, y);
    float headDiameter = bodyWidth();
    fill(0);
    noStroke();
    ellipse(0, 0, headDiameter, headDiameter);
    stroke(0);
    line(0, 0, 0, (0 + headDiameter) * 2); //Body
    line(0 - headDiameter * 1/2, 0 + headDiameter, 0 + headDiameter * 1/2, 0 + headDiameter);
    line(0, 0 + headDiameter * 2, 0 + (headDiameter * 1/2), (0 + bodyHeight)); //
    line(0, 0 + headDiameter * 2, 0 - (headDiameter * 1/2), (0 + bodyHeight)); //
    popMatrix();
  }

  Rectangle rectangle() {
    return new Rectangle(x - bodyWidth()/2, y - bodyWidth()/2, bodyWidth(), bodyHeight + bodyWidth()/2);
  }

  boolean overlapsHorizontally(Obstacle block) {
    return rectangle().overlapsHorizontally(block.rectangle());
  }
  boolean above(Obstacle block) {
    return rectangle().above(block.rectangle());
  }
  boolean below(Obstacle block) {
    return rectangle().below(block.rectangle());
  }
  boolean overlapsVertical(Obstacle block) {
    return rectangle().overlapsVertical(block.rectangle());
  }
  boolean leftOf(Obstacle block) {
    return rectangle().leftOf(block.rectangle());
  }

  boolean rightOf(Obstacle block) {
    return rectangle().rightOf(block.rectangle());
  }


  void move(ArrayList<Obstacle> obstacles) {
    int moveSize = 3;
    boolean rightArrowPressed = false;
    boolean leftArrowPressed= false;
    boolean aboveBlock = false;
    boolean belowBlock = false;
    //jump
    if (keyCode == UP && keyPressed) {
      if (!jumping) {
        jumping = true;
        vy = 20;
      }
    }
    if (!jumping) {
      vx = 0;
      if (keyPressed) {
        if (keyCode == RIGHT) {
          rightArrowPressed = true;
          vx = moveSize;
        }
        else if (keyCode == LEFT) {
          leftArrowPressed = true;
          vx = -moveSize;
        }
      }
    }
    //Prevents going off screen on the left.
    if (x >= width - bodyWidth_ && (rightArrowPressed || jumping)) {
      vx = 0;
    }
    //Prevents going off screen on the right.
    if (x <= 0 + bodyWidth_ && (leftArrowPressed || jumping)) {
      vx = 0;
    }
    y -= vy;
    //am I touching the ground?
    if (y >= height - bodyHeight) {
      vy = 0;
      y = height - bodyHeight;
      jumping = false;
    }
    boolean canMove = true;
    if (!jumping) {
      for (Obstacle block: obstacles) {
        if (overlapsHorizontally (block)) {
          if ((leftOf(block) && vx > 0) || (rightOf(block) && vx < 0))
            canMove = false;
        }
      }
    }
    if (jumping) {
      for (Obstacle block: obstacles) {
        if (overlapsVertical (block)) {
          if (overlapsHorizontally (block)) {
            if ((below(block) && vy >= 0) || (above(block) && vy <= 0))
              vy = 1;
          }
        }
      }
    }
    for (Obstacle block: obstacles) {
      if (above(block)) {
        aboveBlock = true;
      }
      if (below(block)) {
        belowBlock = true;
      }
    }
    text("frame="+frameCount
      + " fps="+ (int)(1000.00 * frameCount/millis())
      + "\njumping="+jumping
      + "\nkeyPressed="  + keyPressed
      + "\nkeyCode=" + keyCode
      + "\nleftArrowPressed="+ leftArrowPressed
      + "\nrightArrowPressed="+ rightArrowPressed
      + "\nvx="+ vx
      + "\nvy="+ vy
      + "\naboveBlock="+ aboveBlock
      + "\nbelowBlock="+ belowBlock
      , 20, 20);
    if (canMove) x += vx;

    vy -= 1;
  }
}

