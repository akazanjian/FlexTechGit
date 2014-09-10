Player player;
World world;

boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keydown = false;

void setup() {
  size(500, 400);
  player = new Player(width/2, height/2);
  world = new World();
  frameRate(50);
}

void draw() {
  background(51, 255, 255);
  player.drawPlayer();
  player.move();
  world.drawWorld();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) keyup = true; 
    if (keyCode == DOWN) keydown = true; 
    if (keyCode == LEFT) keyleft = true; 
    if (keyCode == RIGHT) keyright = true; 
  }
}
 
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false; 
    if (keyCode == DOWN) keydown = false; 
    if (keyCode == LEFT) keyleft = false; 
    if (keyCode == RIGHT) keyright = false; 
  }
}
class Player {
  int x, y;
  boolean jumping = false;
  int ySpeed = 0;

  Player(int x_, int y_) {
    x = x_;
    y = y_;
  }

  void drawPlayer() {
    pushMatrix();
    fill(0);
    translate(x, y);
    float headDiameter = 24;
    //draw head
    ellipse(0, 0, 0 + headDiameter, 0 + headDiameter);
    //draw body
    line(0, 0 +(headDiameter * 1/2), 0, 0 + (playerHeight()/2));
    //draw arm
    line(0, 0 + (headDiameter), 0 - (headDiameter * 1/2), 0 + (playerHeight()/2));
    //draw other arm
    line(0, 0 + (headDiameter), 0 + (headDiameter * 1/2), 0 + (playerHeight()/2));
    //draw leg
    line(0, 0 + (playerHeight()/2), 0 + (headDiameter * 1/2), 0 + playerHeight());
    //draw other leg
    line(0, 0 + (playerHeight()/2), 0 - (headDiameter * 1/2), 0 + playerHeight());
    popMatrix();
  }

  int playerHeight() {
    return 96;
  }

  void moveRight(int deltaX) {
    x += deltaX;
  }

  void jump() {
    if (jumping) {
      return;
    }
    jumping = true;
    ySpeed = 15;
  }

  void move() {
    y = y - ySpeed;
    ySpeed--;
    if (y >= height - playerHeight()) {
      jumping = false;
      ySpeed = 0;
    }
    if (!keyPressed) {
      return;
    }
    int moveSize = 3; 
    if (keyup) {
      jump();
    } 
     if (keyright) {
      moveRight(moveSize);
    } 
     if (keyleft) {
      moveRight(-moveSize);
    }
  }
}

class World {
  void drawWorld() {
    rect(0, 0, 25, 25);
  }
}

