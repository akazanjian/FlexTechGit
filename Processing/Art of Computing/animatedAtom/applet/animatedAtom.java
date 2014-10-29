import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class animatedAtom extends PApplet {

Proton proton;
ArrayList<Electron> electrons;
ArrayList<Photon> photons;
float r = 100;

public void setup() {
  size(500, 500);
  proton = new Proton();
  electrons = new ArrayList<Electron>();
  photons = new ArrayList<Photon>();
  frameRate(60);
}

public void draw() {
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
  if (frameCount < 60) {
    return;
  }
  if (frameCount == 60) {
    photons.remove(photons.size() - 1);
  }
  if (frameCount == 120) {
    photons.add(new Photon());
  }
}

class Electron {
  float r;

  Electron() {
    r = 100;
  }

  public void draw() {
    pushMatrix();
    translate(width/2, height/2);
    stroke(0);
    fill(255, 255, 0);
    float phaseAngle = 2 * PI;
    float angle = 0.08f * frameCount + phaseAngle;
    ellipse(r * cos(angle), r * sin(angle), 25, 25);
    popMatrix();
    if (frameCount < 60) {
      return;
    }
    r = 200;
    if (frameCount < 120) {
      return;
    }
    r = 100;
  }
}

class Photon {
  float x;
  float y;
  float x2;
  float y2;

  Photon() {
    x = 0;
    y = 0;
    x2 = 75;
    y2 = height/2;
  }

  public void draw() {
    translate(width/2, 0);
    float phaseAngle = 2 * PI;
    float angle = 0.08f * frameCount + phaseAngle;    
    if (frameCount >= 120) {
      fill(255, 255, 153);
      stroke(0);
      ellipse(x2, y2, 10, 10);
      x2 -= 2.5f;
      return;
    }
    fill(255, 255, 153);
    stroke(0);
    ellipse(r * cos(angle), y, 10, 10);
    y += 2.5f;
  }
}

class Proton {


  Proton() {
  }

  public void draw() {
    pushMatrix();
    translate(width/2, height/2);
    fill(150, 0, 150);
    stroke(0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "animatedAtom" });
  }
}
