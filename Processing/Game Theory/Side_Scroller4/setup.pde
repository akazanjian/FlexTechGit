World world;

void setup() {
  size(500, 400);
  world = new World();
}

void draw() {
  background(10, 170, 255);
  world.drawWorld();
}

