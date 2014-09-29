ArrayList<Proton> protons;
ArrayList<Electron> electrons;
//ArrayList<Neutron> neutrons;
//float minFrames = 1;
//float framesPerSecond = 60;
//float framesUpOrDown = 1;
//float numberOfProtons = 0;
//float numberOfElectrons = 0;
int w = 750;
int h = 750;

void setup() {
  size(w, h);
  protons = new ArrayList<Proton>();
  electrons = new ArrayList<Electron>();
  //  neutrons = new ArrayList<Neutron>();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      electrons.add(new Electron(electrons.size()));
    }

    if (electrons.size() > 1) {
      if (keyCode == LEFT) {
        electrons.remove(electrons.size() - 1);
      }
    }

    if (keyCode == UP) {
      protons.add(new Proton(protons.size() + 1, protons.size() + 1, protons.size()));
    }
    if (protons.size() > 1) {
      if (keyCode == DOWN) {
        protons.remove(protons.size() - 1);
      }
    }
  }
}

void draw() {
  float chargeUp = protons.size() - electrons.size();
  float chargeDown = electrons.size() - protons.size();
  //  translate(width/2, height/2);
  //  frameRate(framesPerSecond);
  background(150);
  if (frameCount == 1) {
    protons.add(new Proton(0, 0, 0));
    electrons.add(new Electron(0));
  }
  for (Proton aProton: protons) {
    aProton.draw();
  }
  for (Electron anElectron: electrons) {
    anElectron.draw();
  }
  fill(255);
  //  text("fps =" + framesPerSecond, w - 80, h * .03);
  text("Number Of Protons: " + protons.size(), w - 200, h * .05);
  text("Number Of Electrons: " + electrons.size(), w - 200, h * .07);
  if (protons.size() > electrons.size()) {
    text("Charge: + " + chargeUp, w - 200, h * .09);
  }
  if (protons.size() == electrons.size()) {
    text("Charge: Neutral", w - 200, h * .09);
  }
  if (protons.size() < electrons.size()) {
    text("Charge: - " + chargeDown, w - 200, h * .09);
  }
  if (protons.size() == 1) {
    text("Element: Hydrogen", w - 200, h * .11);
  }
  if (protons.size() == 2) {
    text("Element: Helium", w - 200, h * .11);
  }
  if (protons.size() == 3) {
    text("Element: Lithium", w - 200, h * .11);
  }
  if (protons.size() == 4) {
    text("Element: Beryllium", w - 200, h * .11);
  }
  if (protons.size() == 5) {
    text("Element: Boron", w - 200, h * .11);
  }
  if (protons.size() == 6) {
    text("Element: Carbon", w - 200, h * .11);
  }
  if (protons.size() == 7) {
    text("Element: Nitrogen", w - 200, h * .11);
  }
  if (protons.size() == 8) {
    text("Element: Oxygen", w - 200, h * .11);
  }
  if (protons.size() == 9) {
    text("Element: Flourine", w - 200, h * .11);
  }
  if (protons.size() == 10) {
    text("Element: Neon", w - 200, h * .11);
  }
}
