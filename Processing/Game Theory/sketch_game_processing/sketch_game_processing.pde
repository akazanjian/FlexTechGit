Sprite player;
TargetSprite target;


void setup() {
  size(600, 500);
  player = new Sprite( width/2, height * 3 / 4, 30, 30, color(0, 0, 255));
  target = new TargetSprite( width/2, height / 2, 30, 30, color(255, 0, 0), player);
  background(100);
}

void draw() {
  background(100);
  stroke(2);
  float xscale = width/1300.0;
  float yscale = height/1000.0;
  line(135 * width/1300, 85 * yscale, 135 * xscale, 915 * yscale); //vertical
  line(1165 * xscale, yscale * 85, 1165 * xscale, yscale *915); // vertical
  line(135 * xscale, 85 * yscale, 1165 *xscale, 85 * yscale); // horizontal
  line(135 * xscale, 915 * yscale, 1165 * xscale, 915 * yscale); // horizontal
  line(mouseX, mouseY, player.x, player.y);
  // if (keyPressed) 
  player.move();
  target.move();
  if (player.touching (target)) {
    target.teleport();
  }
  target.drawSprite();
  player.drawSprite();
}

void keyPressed() {
  if (key == 32) {
    player.setTurbo(true);
  }
}

void keyReleased() {
  player.setTurbo(false);
}
