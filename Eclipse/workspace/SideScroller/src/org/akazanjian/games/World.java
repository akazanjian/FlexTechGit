package org.akazanjian.games;

import java.util.ArrayList;

import processing.core.PApplet;

public class World {
	Player player;
	ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

	// 500 X 400 area

	public World(PApplet sketch) {
		obstacles.add(new Obstacle(450, 350, sketch));
		obstacles.add(new Obstacle(100, 350, sketch));
		// obstacles.add(new Obstacle(300, 100));
		player = new Player(sketch.width / 2, sketch.height / 2, sketch);
	}

	void drawWorld() {
		// boolean playerWillTouch = false;
		for (Obstacle obstacle : obstacles) {
			obstacle.drawObstacle();
		}
		player.move(obstacles);
		player.drawPlayer();
	}
}
