PGraphics mask; //<>//
int WHITE = color(255);
int BLACK = color(0);

void setup() {
  size(644, 500);
  mask  = createGraphics(width, height);
  mask.beginDraw();
  mask.background(0);
  mask.noStroke();
  mask.fill(255);
  mask.ellipse(width/2, height/2, 50, 50);
  mask.ellipse(100, 100, 50, 50);
  mask.ellipse(600, 400, 50, 50);
  mask.ellipse(200, 350, 50, 50);
  mask.endDraw();
  mask.loadPixels();
}

void draw() {
  background(102, 178, 255);
  fill(255, 0, 0);
  noStroke();
  ellipse(mouseX, mouseY, 50, 50);
  maskPixels();
  //  image(mask, 0, 0);
}

void maskPixels() {
  loadPixels();
  int[] pxls = mask.pixels;
  for (int i = 0; i < pxls.length; ++i) {
    int maskPixel= pxls[i];
    if (maskPixel != WHITE) {
      pixels[i] = BLACK;
    }
  }
  updatePixels();
}
