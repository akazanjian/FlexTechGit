package org.akazanjian.games;

import processing.core.PApplet;

class Obstacle {
	float x, y, w, h;
	private PApplet sketch;

	Obstacle(float x_, float y_, PApplet sketch_) {
		x = x_;
		y = y_;
		w = 50;
		h = 50;
		sketch = sketch_;
	}

	void drawObstacle() {
		sketch.pushMatrix();
		// rectMode(CENTER);
		sketch.rect(x, y, 50, 50);
		sketch.popMatrix();
	}

	Rectangle rectangle() {
		return new Rectangle(x, y, w, h);
	}
}
