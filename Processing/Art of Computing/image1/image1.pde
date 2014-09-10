PImage img;
int imageX;
int imageY;

void setup() {
  imageX = 300;
  imageY = 200;
  //300 x 200
  size(imageX, imageY);
  img = loadImage("image.png");
}

void draw() {
  image(img, 0, 0, width, height);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      color c = get(x, y);
      set(x, y, color(255-green(c), 255-red(c), 255-blue(c)));
    }
  }
}

