Atom atom;
//Shell shell;
ArrayList<Proton> protons;
ArrayList<Electron> electrons;
ArrayList<Atom> atoms;
ArrayList<Neutron> neutrons;
int w = 750;
int h = 750;
float neutronNuclearRadius = 20;
float protonNuclearRadius = 30;
int[] shellCapacities = new int[] {
  0, 2, 8, 18, 32, 50, 72
};
int[] shellDiameters = new int[] {
  100, 200, 350, 450, 600, 800
};


void setup() {
  size(750, 750);
  createAtoms();
  protons = new ArrayList<Proton>();
  electrons = new ArrayList<Electron>();
  neutrons = new ArrayList<Neutron>();
}


void keyPressed() {
  float angle = random(0, 2 * PI);
  float neutronX = neutronNuclearRadius * cos(angle);
  float neutronY = neutronNuclearRadius * sin(angle);
  float protonX = protonNuclearRadius * cos(angle);
  float protonY = protonNuclearRadius * sin(angle);
  //  if (electronCount > 2) {
  //     = 2;
  //  }
  //  if (electronCount <= 2) {
  //     = 1;
  //  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      electrons.add(new Electron(electrons.size()));
    }
    if (electrons.size() > 0) {
      if (keyCode == LEFT) {
        electrons.remove(electrons.size() - 1);
      }
    }
    if (keyCode == SHIFT) {
      neutrons.add(new Neutron(neutronX, neutronY, neutrons.size()));
    }
    if (neutrons.size() > 0) {
      if (keyCode == CONTROL) {
        neutrons.remove(neutrons.size() - 1);
      }
    }
    if (protons.size() < 109) {
      if (keyCode == UP) {
        protons.add(new Proton(protonX, protonY, protons.size()));
      }
    }
    if (protons.size() > 0) {
      if (keyCode == DOWN) {
        protons.remove(protons.size() - 1);
      }
    }
  }
}

int electronCount() {
  return electrons.size();
}

int shellLevel(int electronNumber) {
  if (electronCount() <= 2) {
    return 1;
  }
  if (electronCount() <= 10) {
    return 2;
  }
  if (electronCount() <= 28) {
    return 3;
  }
  if (electronCount() <= 60) {
    return 4;
  }
  if (electronCount() <= 110) {
    return 5;
  }
  return 6;
}

int shellDiameter(int electronNumber) {
  return shellDiameters[shellLevel(electronNumber)];
}

int numberOfElectronsInShell(int shellLevel_) {
  //Not the capacity of the shell. Rather, how many
  //electrons are currently in the shell?
  return electronCount();
}

void draw() {
  float atomicMass = protons.size() + neutrons.size();
  float chargeUp = protons.size() - electrons.size();
  float chargeDown = electrons.size() - protons.size();
  background(255);
  if (frameCount == 1) {
    protons.add(new Proton(0, 0, 0));
    electrons.add(new Electron(0));
    neutrons.add(new Neutron(10, 10, 0));
    //    electronCount = 1;
  }
  for (Proton aProton: protons) {
    aProton.draw();
  }
  for (Electron anElectron: electrons) {
    anElectron.draw();
  }
  for (Neutron aNeutron: neutrons) {
    aNeutron.draw();
  }
  fill(0);
  text("Number Of Protons: " + protons.size(), w - 200, h * .05);
  text("Number Of Electrons: " + electrons.size(), w - 200, h * .07);
  text("Number Of Neutrons: " + neutrons.size(), w - 200, h * .09);
  text("Atomic Mass: " + atomicMass, w - 200, h * .17);
  if (protons.size() > electrons.size()) {
    text("Charge: + " + chargeUp, w - 200, h * .11);
  }
  if (protons.size() == electrons.size()) {
    text("Charge: Neutral", w - 200, h * .11);
  }
  if (protons.size() < electrons.size()) {
    text("Charge: - " + chargeDown, w - 200, h * .11);
  }

  int atomicNumber = protons.size();
  Atom atom = atoms.get(atomicNumber);
  text("Element: " + atom.name, w - 200, h * .13);
  text("Symbol: " + atom.symbol, w- 200, h * .15);
}

void createAtoms() {
  atoms = new ArrayList<Atom>();
  atoms.add(new Atom(0, 0, "Nonexistium", "Nx"));
  atoms.add(new Atom(1, 1.0079, "Hydrogen", "H"));
  atoms.add(new Atom(2, 4.0026, "Helium", "He"));
  atoms.add(new Atom(3, 6.941, "Lithium", "Li"));
  atoms.add(new Atom(4, 9.0122, "Beryllium", "Be"));
  atoms.add(new Atom(5, 10.811, "Boron", "B"));
  atoms.add(new Atom(6, 12.0107, "Carbon", "C"));
  atoms.add(new Atom(7, 14.0067, "Nitrogen", "N"));
  atoms.add(new Atom(8, 15.9994, "Oxygen", "O"));
  atoms.add(new Atom(9, 18.9984, "Fluorine", "F"));
  atoms.add(new Atom(10, 20.1797, "Neon", "Ne"));
  atoms.add(new Atom(11, 22.9897, "Sodium", "Na"));
  atoms.add(new Atom(12, 24.305, "Magnesium", "Mg"));
  atoms.add(new Atom(13, 26.9815, "Aluminum", "Al"));
  atoms.add(new Atom(14, 28.0855, "Silicon", "Si"));
  atoms.add(new Atom(15, 30.9738, "Phosphorus", "P"));
  atoms.add(new Atom(16, 32.065, "Sulfur", "S"));
  atoms.add(new Atom(17, 35.453, "Chlorine", "Cl"));
  atoms.add(new Atom(18, 39.948, "Argon", "Ar"));
  atoms.add(new Atom(19, 39.0983, "Potassium", "K"));
  atoms.add(new Atom(20, 40.078, "Calcium", "Ca"));
  atoms.add(new Atom(21, 44.9559, "Scandium", "Sc"));
  atoms.add(new Atom(22, 47.867, "Titanium", "Ti"));
  atoms.add(new Atom(23, 50.9415, "Vanadium", "V"));
  atoms.add(new Atom(24, 51.9961, "Chromium", "Cr"));
  atoms.add(new Atom(25, 54.938, "Manganese", "Mn"));
  atoms.add(new Atom(26, 55.845, "Iron", "Fe"));
  atoms.add(new Atom(27, 58.9332, "Cobalt", "Co"));
  atoms.add(new Atom(28, 58.6934, "Nickel", "Ni"));
  atoms.add(new Atom(29, 63.546, "Copper", "Cu"));
  atoms.add(new Atom(30, 65.39, "Zinc", "Zn"));
  atoms.add(new Atom(31, 69.723, "Gallium", "Ga"));
  atoms.add(new Atom(32, 72.64, "Germanium", "Ge"));
  atoms.add(new Atom(33, 74.9216, "Arsenic", "As"));
  atoms.add(new Atom(34, 78.96, "Selenium", "Se"));
  atoms.add(new Atom(35, 79.904, "Bromine", "Br"));
  atoms.add(new Atom(36, 83.8, "Krypton", "Kr"));
  atoms.add(new Atom(37, 85.4678, "Rubidium", "Rb"));
  atoms.add(new Atom(38, 87.62, "Strontium", "Sr"));
  atoms.add(new Atom(39, 88.9059, "Yttrium", "Y"));
  atoms.add(new Atom(40, 91.224, "Zirconium", "Zr"));
  atoms.add(new Atom(41, 92.9064, "Niobium", "Nb"));
  atoms.add(new Atom(42, 95.94, "Molybdenum", "Mo"));
  atoms.add(new Atom(43, 98, "Technetium", "Tc"));
  atoms.add(new Atom(44, 101.07, "Ruthenium", "Ru"));
  atoms.add(new Atom(45, 102.9055, "Rhodium", "Rh"));
  atoms.add(new Atom(46, 106.42, "Palladium", "Pd"));
  atoms.add(new Atom(47, 107.8682, "Silver", "Ag"));
  atoms.add(new Atom(48, 112.411, "Cadmium", "Cd"));
  atoms.add(new Atom(49, 114.818, "Indium", "In"));
  atoms.add(new Atom(50, 118.71, "Tin", "Sn"));
  atoms.add(new Atom(51, 121.76, "Antimony", "Sb"));
  atoms.add(new Atom(52, 127.6, "Tellurium", "Te"));
  atoms.add(new Atom(53, 126.9045, "Iodine", "I"));
  atoms.add(new Atom(54, 131.293, "Xenon", "Xe"));
  atoms.add(new Atom(55, 132.9055, "Cesium", "Cs"));
  atoms.add(new Atom(56, 137.327, "Barium", "Ba"));
  atoms.add(new Atom(57, 138.9055, "Lanthanum", "La"));
  atoms.add(new Atom(58, 140.116, "Cerium", "Ce"));
  atoms.add(new Atom(59, 140.9077, "Praseodymium", "Pr"));
  atoms.add(new Atom(60, 144.24, "Neodymium", "Nd"));
  atoms.add(new Atom(61, 145, "Promethium", "Pm"));
  atoms.add(new Atom(62, 150.36, "Samarium", "Sm"));
  atoms.add(new Atom(63, 151.964, "Europium", "Eu"));
  atoms.add(new Atom(64, 157.25, "Gadolinium", "Gd"));
  atoms.add(new Atom(65, 158.9253, "Terbium", "Tb"));
  atoms.add(new Atom(66, 162.5, "Dysprosium", "Dy"));
  atoms.add(new Atom(67, 164.9303, "Holmium", "Ho"));
  atoms.add(new Atom(68, 167.259, "Erbium", "Er"));
  atoms.add(new Atom(69, 168.9342, "Thulium", "Tm"));
  atoms.add(new Atom(70, 173.04, "Ytterbium", "Yb"));
  atoms.add(new Atom(71, 174.967, "Lutetium", "Lu"));
  atoms.add(new Atom(72, 178.49, "Hafnium", "Hf"));
  atoms.add(new Atom(73, 180.9479, "Tantalum", "Ta"));
  atoms.add(new Atom(74, 183.84, "Tungsten", "W"));
  atoms.add(new Atom(75, 186.207, "Rhenium", "Re"));
  atoms.add(new Atom(76, 190.23, "Osmium", "Os"));
  atoms.add(new Atom(77, 192.217, "Iridium", "Ir"));
  atoms.add(new Atom(78, 195.078, "Platinum", "Pt"));
  atoms.add(new Atom(79, 196.9665, "Gold", "Au"));
  atoms.add(new Atom(80, 200.59, "Mercury", "Hg"));
  atoms.add(new Atom(81, 204.3833, "Thallium", "Tl"));
  atoms.add(new Atom(82, 207.2, "Lead", "Pb"));
  atoms.add(new Atom(83, 208.9804, "Bismuth", "Bi"));
  atoms.add(new Atom(84, 209, "Polonium", "Po"));
  atoms.add(new Atom(85, 210, "Astatine", "At"));
  atoms.add(new Atom(86, 222, "Radon", "Rn"));
  atoms.add(new Atom(87, 223, "Francium", "Fr"));
  atoms.add(new Atom(88, 226, "Radium", "Ra"));
  atoms.add(new Atom(89, 227, "Actinium", "Ac"));
  atoms.add(new Atom(90, 232.0381, "Thorium", "Th"));
  atoms.add(new Atom(91, 231.0359, "Protactinium", "Pa"));
  atoms.add(new Atom(92, 238.0289, "Uranium", "U"));
  atoms.add(new Atom(93, 237, "Neptunium", "Np"));
  atoms.add(new Atom(94, 244, "Plutonium", "Pu"));
  atoms.add(new Atom(95, 243, "Americium", "Am"));
  atoms.add(new Atom(96, 247, "Curium", "Cm"));
  atoms.add(new Atom(97, 247, "Berkelium", "Bk"));
  atoms.add(new Atom(98, 251, "Californium", "Cf"));
  atoms.add(new Atom(99, 252, "Einsteinium", "Es"));
  atoms.add(new Atom(100, 257, "Fermium", "Fm"));
  atoms.add(new Atom(101, 258, "Mendelevium", "Md"));
  atoms.add(new Atom(102, 259, "Nobelium", "No"));
  atoms.add(new Atom(103, 262, "Lawrencium", "Lr"));
  atoms.add(new Atom(104, 261, "Rutherfordium", "Rf"));
  atoms.add(new Atom(105, 262, "Dubnium", "Db"));
  atoms.add(new Atom(106, 266, "Seaborgium", "Sg"));
  atoms.add(new Atom(107, 264, "Bohrium", "Bh"));
  atoms.add(new Atom(108, 277, "Hassium", "Hs"));
  atoms.add(new Atom(109, 268, "Meitnerium", "Mt"));
}
