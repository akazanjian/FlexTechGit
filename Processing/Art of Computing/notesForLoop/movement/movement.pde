int w=0;

void setup() {
  size(1500, 1000);
  background(100);
}

void draw() {
  background(100);
  fill(50);
  rect(60+w, 40, 80, 40);
  ++w;
}

