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
