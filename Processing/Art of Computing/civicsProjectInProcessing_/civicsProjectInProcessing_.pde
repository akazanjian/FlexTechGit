ArrayList<Branch> branches;

void setup() {
  size(1000, 1000);
  branches = new ArrayList<Branch>();
}

void draw() {
  background(255);
  if (frameCount == 1) {
    branches.add(new Branch(color(255, 0, 0), 1, PI));
    branches.add(new Branch(color(0, 0, 255), 0.5, 2 * PI));
  }
  for (Branch aBranch: branches) {
    aBranch.draw();
  }
  fill(0);
  ellipse(width/2, height/2, 2, 2);
}
