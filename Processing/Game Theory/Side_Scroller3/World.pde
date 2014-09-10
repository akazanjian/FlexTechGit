class World {
  //ArrayList<obstacle>
  int x, y;
  // 500 X 400 area

  World(int x_, int y_) {
    x = x_;
    y = y_;
  }

  void drawWorld() {
    fill(10, 51, 0);
    rect(450, 380, 50, 20);
  }
}
//
//class Obstacle {
//  int x, y;
//  // 500 X 400 area
//
//  World(int x_, int y_) {
//    x = x_;
//    y = y_;
//  }
//
//  void drawWorld() {
//    fill(10, 51, 0);
//    rect(450, 380, 50, 20);
//  }
//}

