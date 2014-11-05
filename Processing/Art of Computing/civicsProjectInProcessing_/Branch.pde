class Branch {
  color branchColor;
  float r;
  float size;
  float angle;
  float scale_;
  float x, y;
  int sizeModifier;

  Branch(color bColor, int sizeModifier_, float a) {
    sizeModifier = sizeModifier_;
    angle = a;
    size = 200;
    r = 200;
    branchColor = bColor;
    scale_ = 1;
    x = 0;
    y = 0;
  }

  void draw() {
    pushMatrix();
    translate(width/2, height/2);
    float radius = r * scale_;
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          scale_ += 0.1;
        }
        if (scale_ > 1) {
          if (keyCode == DOWN) {
            scale_ -= 0.1;
          }
        }
      }
    }
    fill(branchColor);
    stroke(0);
    ellipse(radius * cos(angle), radius * sin(angle), size * scale_, size * scale_);
    println("scale=" + scale_);
    popMatrix();
  }
}
