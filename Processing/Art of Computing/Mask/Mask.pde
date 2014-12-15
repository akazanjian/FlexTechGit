PGraphics pg; //<>//

void setup() {
  size(644, 500);
  pg  = createGraphics(width, height);
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();
  pg.fill(255);
  pg.ellipse(width/2, height/2, 50, 50);
  pg.ellipse(100, 100, 50, 50);
  pg.ellipse(600, 400, 50, 50);
  pg.ellipse(200, 350, 50, 50);
  pg.endDraw();
}

void draw() {
  image(pg, 0, 0);
}
