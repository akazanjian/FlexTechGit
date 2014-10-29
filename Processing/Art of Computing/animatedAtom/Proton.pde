class Proton {


  Proton() {
  }

  void draw() {
    pushMatrix();
    translate(width/2, height/2);
    fill(150, 0, 150);
    stroke(0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
}

