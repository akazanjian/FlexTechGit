package org.akazanjian.games;

import processing.core.PApplet;
import processing.core.PConstants;

import java.util.ArrayList;

class Player {
	int x, y, vy, vx, bodyHeight = 72, bodyWidth_ = 12;
	int scale = 2;
	boolean jumping;
	private PApplet sketch;

	void setScale(int s) {
		scale = s;
	}

	Player(int x_, int y_, PApplet sketch_) {
		x = x_;
		y = y_;
		vy = 0;
		jumping = false;
		sketch = sketch_;
	}

	float bodyWidth() {
		return bodyWidth_ * scale;
	}

	void drawPlayer() {
		sketch.pushMatrix();
		sketch.translate(x, y);
		float headDiameter = bodyWidth();
		sketch.fill(0);
		sketch.noStroke();
		sketch.ellipse(0, 0, headDiameter, headDiameter);
		sketch.stroke(0);
		sketch.line(0, 0, 0, (0 + headDiameter) * 2); // Body
		sketch.line(0 - headDiameter * 1 / 2, 0 + headDiameter,
				0 + headDiameter * 1 / 2, 0 + headDiameter);
		sketch.line(0, 0 + headDiameter * 2, 0 + (headDiameter * 1 / 2),
				(0 + bodyHeight)); //
		sketch.line(0, 0 + headDiameter * 2, 0 - (headDiameter * 1 / 2),
				(0 + bodyHeight)); //
		sketch.popMatrix();
	}

	Rectangle rectangle() {
		return new Rectangle(x - bodyWidth() / 2, y - bodyWidth() / 2,
				bodyWidth(), bodyHeight + bodyWidth() / 2);
	}

	boolean overlapsHorizontally(Obstacle block) {
		return rectangle().overlapsHorizontally(block.rectangle());
	}

	boolean above(Obstacle block) {
		return rectangle().above(block.rectangle());
	}

	boolean below(Obstacle block) {
		return rectangle().below(block.rectangle());
	}

	boolean overlapsVertical(Obstacle block) {
		return rectangle().overlapsVertical(block.rectangle());
	}

	boolean leftOf(Obstacle block) {
		return rectangle().leftOf(block.rectangle());
	}

	boolean rightOf(Obstacle block) {
		return rectangle().rightOf(block.rectangle());
	}

	void move(ArrayList<Obstacle> obstacles) {
		int moveSize = 3;
		boolean rightArrowPressed = false;
		boolean leftArrowPressed = false;
		boolean aboveBlock = false;
		boolean belowBlock = false;
		// jump
		if (sketch.keyCode == PConstants.UP && sketch.keyPressed) {
			if (!jumping) {
				jumping = true;
				vy = 20;
			}
		}
		if (!jumping) {
			vx = 0;
			if (sketch.keyPressed) {
				if (sketch.keyCode == PConstants.RIGHT) {
					rightArrowPressed = true;
					vx = moveSize;
				} else if (sketch.keyCode == PConstants.LEFT) {
					leftArrowPressed = true;
					vx = -moveSize;
				}
			}
		}
		// Prevents going off screen on the left.
		if (x >= sketch.width - bodyWidth_ && (rightArrowPressed || jumping)) {
			vx = 0;
		}
		// Prevents going off screen on the right.
		if (x <= 0 + bodyWidth_ && (leftArrowPressed || jumping)) {
			vx = 0;
		}
		y -= vy;
		// am I touching the ground?
		if (y >= sketch.height - bodyHeight) {
			vy = 0;
			y = sketch.height - bodyHeight;
			jumping = false;
		}
		boolean canMove = true;
		if (!jumping) {
			for (Obstacle block : obstacles) {
				if (overlapsHorizontally(block)) {
					if ((leftOf(block) && vx > 0) || (rightOf(block) && vx < 0))
						canMove = false;
				}
			}
		}
		if (jumping) {
			for (Obstacle block : obstacles) {
				if (overlapsVertical(block)) {
					if (overlapsHorizontally(block)) {
						if ((below(block) && vy >= 0)
								|| (above(block) && vy <= 0))
							vy = 1;
					}
				}
			}
		}
		for (Obstacle block : obstacles) {
			if (above(block)) {
				aboveBlock = true;
			}
			if (below(block)) {
				belowBlock = true;
			}
		}
//		sketch.text("frame=" + sketch.frameCount + " fps="
//				+ (int) (1000.00 * sketch.frameCount / sketch.millis()) + "\njumping="
//				+ jumping + "\nkeyPressed=" + sketch.keyPressed + "\nkeyCode="
//				+ sketch.keyCode + "\nleftArrowPressed=" + leftArrowPressed
//				+ "\nrightArrowPressed=" + rightArrowPressed + "\nvx=" + vx
//				+ "\nvy=" + vy + "\naboveBlock=" + aboveBlock + "\nbelowBlock="
//				+ belowBlock, 20, 20);
		if (canMove)
			x += vx;

		vy -= 1;
	}
}
