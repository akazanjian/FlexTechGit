Player player;

void setup() {
  size(500, 400);
  player = new Player(width/2, height/2);
}

void draw() {
  background(10, 170, 255);
  player.move();
  player.drawPlayer();
}

