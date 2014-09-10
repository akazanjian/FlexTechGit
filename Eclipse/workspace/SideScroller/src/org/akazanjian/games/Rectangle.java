package org.akazanjian.games;

class Rectangle {
	float x, y, w, h;

	Rectangle(float x_, float y_, float w_, float h_) {
		x = x_;
		y = y_;
		w = w_;
		h = h_;
	}

	boolean leftOf(Rectangle rectangle) {
		return x < rectangle.x;
	}

	boolean rightOf(Rectangle rectangle) {
		return x > rectangle.x;
	}

	boolean toTheRightOfLeftEdgeOf(Rectangle rectangle) {
		return x + w >= rectangle.x;
	}

	boolean toTheLeftOfRightEdgeOf(Rectangle rectangle) {
		return rectangle.x + rectangle.w <= x;
	}

	boolean above(Rectangle rectangle) {
		return y + h <= rectangle.y + rectangle.h;

	}

	boolean below(Rectangle rectangle) {
		return y >= rectangle.y + h;
	}

	boolean overlapsVertical(Rectangle rectangle) {
		if (rectangle.y >= y + h) {
			return false;
		}
		if (rectangle.y + rectangle.h <= y) {
			return false;
		}
		return true;
	}

	boolean overlapsHorizontally(Rectangle rectangle) {
		if (rectangle.x >= x + w) {
			return false;
		}
		if (rectangle.x + rectangle.w < x) {
			return false;
		}
		return true;
	}
}