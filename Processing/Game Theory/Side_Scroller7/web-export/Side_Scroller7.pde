World world;

void setup() {
  size(500, 400);
  world = new World();
  frameRate(60);
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


  boolean overlapsVertical(Rectangle rectangle) {
    if (rectangle.y > y + h) {
      return false;
    }
    if (rectangle.y + rectangle.h < y) {
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
    text("frame="+frameCount
      + "\njumping="+jumping
      + "\nkeyPressed="  + keyPressed
      + "\nkeyCode=" + keyCode
      + "\nleftArrowPressed="+ leftArrowPressed
      + "\nrightArrowPressed="+ rightArrowPressed
      + "\nvx="+ vx
      , 20, 20);
    y -= vy;
    //am I touching the ground?
    if (y >= height - bodyHeight) {
      vy = 0;
      y = height - bodyHeight;
      jumping = false;
    }
    //Prevents going off screen on the left.
    if (x >= width - bodyWidth_ && rightArrowPressed) {
      vx = 0;
    }
    //Prevents going off screen on the right.
    if (x <= 0 + bodyWidth_ && leftArrowPressed) {
      vx = 0;
    }
    boolean canMove = true;
    if (!jumping) {
      for (Obstacle block: obstacles) {
        if (overlapsHorizontally (block)) {
          if ((leftOf(block) && vx > 0) || (rightOf(block)&& vx < 0))
            canMove = false;
        }
      }
    }
    if (canMove) x += vx;

    vy -= 1;
  }
}

class World {
  Player player;
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
  // 500 X 400 area

  World() {
    obstacles.add(new Obstacle(450, 350));
    obstacles.add(new Obstacle(100, 350));
    //obstacles.add(new Obstacle(300, 100));
    player = new Player(width/2, height/2);
  }
  void drawWorld() {
    //boolean playerWillTouch = false;
    for (Obstacle obstacle: obstacles) {
      obstacle.drawObstacle();
    }
    player.move(obstacles);
    player.drawPlayer();
  }
}


class Obstacle {
  float x, y, w, h;

  Obstacle(float x_, float y_) {
    x = x_;
    y = y_;
    w = 50;
    h = 50;
  }

  void drawObstacle() {
    pushMatrix();
    //rectMode(CENTER);
    rect(x, y, 50, 50);
    popMatrix();
  }
  Rectangle rectangle() {
    return new Rectangle(x, y, w, h);
  }
}

