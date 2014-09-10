World world;

void setup() {
  size(500, 400);
  world = new World();
  frameRate(6);
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

  boolean toTheRightOfLeftEdgeOf(Rectangle rectangle) {
    return x + w >= rectangle.x;
//    if (rectangle.x == x + w) {
//      return true;
//    }
//    return (overlapsVertical(rectangle));
  }

  boolean toTheLeftOfRightEdgeOf(Rectangle rectangle) {
    if (x == rectangle.x + rectangle.w) {
      return true;
    }
    return (overlapsVertical(rectangle));
  }


  boolean overlapsVertical(Rectangle rectangle) {
    if (rectangle.y > y + h) {
      return false;
    }
    if (rectangle.y + rectangle.h < y) {
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


  boolean toTheRightOfLeftEdgeOf(Obstacle block) {
    return rectangle().toTheRightOfLeftEdgeOf(block.rectangle());
  }

  boolean toTheLeftOfRightEdgeOf(Obstacle block) {
    return rectangle().toTheLeftOfRightEdgeOf(block.rectangle());
  }


  void move(ArrayList<Obstacle> obstacles) {
    int moveSize = 3;
    boolean rightArrowPressed = false;
    boolean leftArrowPressed= false;
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
    println("frame="+frameCount+ " jumping="+jumping+ "  keyPressed=" + keyPressed+ "  keyCode=" + keyCode+ "  rightArrowPressed=" + rightArrowPressed);
    y -= vy;
    //am I touching the ground?
    if (y >= height - bodyHeight) {
      vy = 0;
      y = height - bodyHeight;
      jumping = false;
    }
    //Prevents going off screen on the left.
    if (x >= width - bodyWidth_ && !leftArrowPressed) {
      vx = 0;
    }
    //Prevents going off screen on the right.
    if (x <= 0 + bodyWidth_ && !rightArrowPressed) {
      vx = 0;
    }
    boolean canMove = true;
    //if trying to move right
    if (vx > 0) {
      for (Obstacle block: obstacles) {
        if (toTheRightOfLeftEdgeOf (block)) {
          canMove = false;
        }
      }
      if (canMove) x += vx;
    }

    //if trying to move left
    if (vx < 0) {
      for (Obstacle block: obstacles) {
        if (toTheLeftOfRightEdgeOf (block)) {
          canMove = false;
        }
      }
      if (canMove) x += vx;
      ;
    }

    vy -= 1;
  }
}
