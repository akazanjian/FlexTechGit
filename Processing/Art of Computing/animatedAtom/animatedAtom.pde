Proton proton;
ArrayList<Electron> electrons;
ArrayList<Photon> photons;
float r = 100;

void setup() {
  size(500, 500);
  proton = new Proton();
  electrons = new ArrayList<Electron>();
  photons = new ArrayList<Photon>();
  frameRate(60);
}

void draw() {
  if (frameCount >= 240) {
    return;
  }
  background(255);
  proton.draw();
  if (frameCount == 1) {
    photons.add(new Photon());
    electrons.add(new Electron());
  }
  for (Photon aPhoton: photons) {
    aPhoton.draw();
  }
  for (Electron anElectron: electrons) {
    anElectron.draw();
  }
  if (frameCount == 60) {
    photons.remove(photons.size() - 1);
  }
  if (frameCount == 120) {
    photons.add(new Photon());
  }
  saveFrame("animatedAtom-###.png");
}

