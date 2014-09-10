class World {
  Player player;
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
  // 500 X 400 area

  World() {
    obstacles.add(new Obstacle(450, 350));
    obstacles.add(new Obstacle(100, 350));
    obstacles.add(new Obstacle(300, 100));
    player = new Player(width/2, height/2);
  }
  void drawWorld() {
    boolean playerWillTouch = false;
    for (Obstacle obstacle: obstacles) {
      obstacle.drawObstacle();
    }
    player.move(obstacles);
    player.drawPlayer();
  }
}


class Obstacle {
  float x, y;

  Obstacle(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void drawObstacle() {
    pushMatrix();
    rectMode(CENTER);
    rect(x, y, 50, 50);
    popMatrix();
  }
}

