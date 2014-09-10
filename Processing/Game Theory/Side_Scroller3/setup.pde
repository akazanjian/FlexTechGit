Player player;
World world;

void setup() {
  size(500, 400);
  player = new Player(width/2, height/2);
  world = new World(width/2, height/2);
}

void draw() {
  background(10, 170, 255);
  world.drawWorld();
  player.drawPlayer();
  player.move();
}

