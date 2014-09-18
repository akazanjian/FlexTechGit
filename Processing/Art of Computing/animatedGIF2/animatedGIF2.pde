ArrayList<Ball> balls;
ArrayList<Platform> platforms;
float minFrames = 1;
float framesPerSecond = 10;
float framesUpOrDown = 1;
int numberFramesPerBall = 15;
int numberFramesToSkipBeforeRecording = 100;

void setup() {
  size(500, 500);
  platforms = new ArrayList<Platform>();
  balls = new ArrayList<Ball>();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      framesPerSecond = framesPerSecond + framesUpOrDown;
    }
    if (framesPerSecond > minFrames) {

      if (keyCode == DOWN) {
        framesPerSecond = framesPerSecond - framesUpOrDown;
      }
    }
  }
}

void draw() {
  frameRate(framesPerSecond);
  //  if (frameCount >= numberFramesToSkipBeforeRecording + numberFramesPerBall) {
  //    return;
  //  }
  //  if (frameCount > 100) return;
  background(150);
  if (frameCount % numberFramesPerBall == 0) {
    balls.add(new Ball());
  }
  for (Ball aBall: balls) {
    aBall.draw();
  }
  if (frameCount == 1) {
    platforms.add(new Platform());
  }
  for (Platform aPlatform: platforms) {
    aPlatform.draw();
  }
  text("fps =" + framesPerSecond, 400, 20);


  //  if (frameCount < numberFramesToSkipBeforeRecording) {
  //    return;
  //  }

  //  saveFrame("flyingBall-###.png");
}

