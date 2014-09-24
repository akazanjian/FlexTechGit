ArrayList<Proton> protons;
ArrayList<Electron> electrons;
//ArrayList<Neutron> neutrons;
float minFrames = 1;
float framesPerSecond = 15;
float framesUpOrDown = 1;

void setup() {
  size(500, 500);
  protons = new ArrayList<Proton>();
  electrons = new ArrayList<Electron>();
  //  neutrons = new ArrayList<Neutron>();
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
  //  translate(width/2, height/2);
  frameRate(framesPerSecond);
  background(150);
  if (frameCount == 1) {
    protons.add(new Proton(0, 0));
    electrons.add(new Electron(50, 50));
  }
  for (Proton aProton: protons) {
    aProton.draw();
  }
  for (Electron anElectron: electrons) {
    anElectron.draw();
  }
  fill(255);
  text("fps =" + framesPerSecond, 400, 20);
}

