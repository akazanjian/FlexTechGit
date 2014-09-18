ArrayList<Ball> balls;
int numberFramesPerBall = 15;
int numberFramesToSkipBeforeRecording = 100;

void setup() {
  size(500, 500);
  balls = new ArrayList<Ball>();
  frameRate(100);
}

void draw() {
  if (frameCount >= numberFramesToSkipBeforeRecording + numberFramesPerBall) {
    return;
  }
  background(150);
  if (frameCount % numberFramesPerBall == 0) {
    balls.add(new Ball());
  }
  for (Ball aBall: balls) {
    aBall.draw();
  }

  if (frameCount < numberFramesToSkipBeforeRecording) {
    return;
  }
  
  saveFrame("flyingBall-###.png");
}

