class Branch {
  color branchColor;
  float r;
  float size; //This is the default size of the circles.
  float angle;
  float scale_; //This variable will change depending on what arrow key is pressed;
  // all objects will shrink or grow based on whether you press up or down.
  float x, y;
  float sizeModifier; //This variable changes the size for the different levels of government;
  // the state and local government spheres are always smaller than the federal government spheres, and
  // this variable is what determines that.

  Branch(color bColor, float sizeModifier_, float a) {
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
    float radius = (r * scale_) * sizeModifier;
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
    ellipse(radius * cos(angle), radius * sin(angle), (size * scale_) * sizeModifier, (size * scale_) * sizeModifier);
    println("scale=" + scale_);
    popMatrix();
  }
}
