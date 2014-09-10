World world;

void setup() {
  size(500, 400);
  world = new World();
}

void draw() {
  background(10, 170, 255);
  world.drawWorld();
}

class Player  {
  int x, y, vy, vx, bodyHeight = 72, bodyWidth = 12;
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
    pushMatrix();
    translate(x, y);
    float headDiameter = 12 * scale;
    fill(0);
    noStroke();
    ellipse(0, 0, headDiameter, headDiameter);
    stroke(0);
    line(0, 0, 0, (0 + headDiameter) * 2);
    line(0 - headDiameter * 1/2, 0 + headDiameter, 0 + headDiameter * 1/2, 0 + headDiameter);
    line(0, 0 + headDiameter * 2, 0 + (headDiameter * 1/2), (0 + bodyHeight));
    line(0, 0 + headDiameter * 2, 0 - (headDiameter * 1/2), (0 + bodyHeight));
    popMatrix();
  }


  void move(ArrayList<Obstacle> obstacles) {
    float minDist = 39;
    int moveSize = 3;
    boolean rightArrowPressed = false;
    boolean leftArrowPressed = false;
    if (keyCode == UP && keyPressed) {
      if (!jumping) {
        jumping = true;
        vy = 20;
      }
    }
    //    if (keyPressed == true) {
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
    y -= vy;
    if (y >= height - bodyHeight) {
      vy = 0;
      y = height - bodyHeight;
      jumping = false;
    }
    //Prevents going off left of screen.
    if (x >= width - bodyWidth && !leftArrowPressed) {
      vx = 0;
    }
    //Prevents going off right of screen.
    if (x <= 0 + bodyWidth && !rightArrowPressed) {
      vx = 0;
    }
    boolean canMoveX = true;
    for (Obstacle block: obstacles) {
      if (y + bodyHeight > block.y ) {
        if (vx > 0) {
          if (block.x > x) {
            if (block.x - x < minDist) {
              canMoveX = false;
            }
          }
        }
        if (vx < 0) {
          if (block.x < x) {
            if (x - block.x < minDist) {
              canMoveX = false;
            }
          }
        }
      }
    }
//    boolean canMoveY = true;
//    for (Obstacle block: obstacles) {
//      if (x + bodyWidth > 
//      
      
    if (canMoveX) {
      x += vx;
    }
    vy -= 1;
  }
}

