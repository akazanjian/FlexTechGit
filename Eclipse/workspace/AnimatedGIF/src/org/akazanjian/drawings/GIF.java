package org.akazanjian.drawings;

import gifAnimation.*;

import processing.core.*;

public class GIF extends PApplet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int numFrames = 30;
	private GifMaker gifExport;

	public void setup() {
		size(100, 100);
		frameRate(10);
		background(0);

		println("gifAnimation " + Gif.version());
		gifExport = new GifMaker(this, "export.gif");
		gifExport.setRepeat(0); // make it an "endless" animation
		// gifExport.setTransparent(0, 0, 0); // make black the transparent
		// color.
		// every black pixel in the
		// animation will be transparent
	}

	public void draw() {
		if (frameCount >= numFrames)
			System.exit(0);
		fill(255);
		textSize(20);
		if (frameCount == 5) {
		text("H", 25, 50);
		}
		if (frameCount == 10) {
			text("E", 40, 50);
		}
		if (frameCount == 15) {
			text("L", 55, 50);
		}
		if (frameCount == 20) {
			text("L", 70, 50);
		}
		if (frameCount == 25) {
			text("O", 85, 50);
		}
//		float angle = 2 * PI * frameCount / numFrames;
//		float diameterScalar = (float) ((1 + sin(angle)) * 0.45 + 0.05);
//		ellipse(0, 0, width * diameterScalar, height * diameterScalar);
		gifExport.setDelay(1);
		gifExport.addFrame();
		if (frameCount == numFrames - 1)
			gifExport.finish();
	}
}
