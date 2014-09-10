package org.akazanjian.games;

import processing.core.*;

public class SideScroller8 extends PApplet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7247382589764939063L;
	World world;

	public void setup() {
		super.size(500, 400);
		world = new World(this);
		frameRate(60);
	}

	public void draw() {
		background(10, 170, 255);
		world.drawWorld();
		saveFrame("./movie/sideScrolling-####.png");
	}
	public static void main(String[] args) {
		PApplet.main(new String[] { "--present",
				"org.akazanjian.games" });
	}

}
