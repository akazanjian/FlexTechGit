Raccoon rocky;
ArrayList<Food> foods;

void setup() {
  size(1000, 800);
  rocky = new Raccoon(width/2, height/2);
  foods = new ArrayList<Food> ();
  setNumberOfFoods(10);
  frameRate(30);
}


void setNumberOfFoods(int n) {
  while (foods.size ()<n) {
    foods.add(new Food(random(100, 900), random(100, 700)));
  }
  while (foods.size ()>n) {
    foods.remove(0);
  }
}

//void draw() {
//  background(0);
//  rocky.drawRaccoon();
//  garbage.drawFood();
//}

void draw() {
  background(0);
  for (Food food: foods) {
    food.drawFood();
  }
  rocky.drawRaccoon();
  Food closestFood = rocky.moveToClosestFood();
  if (rocky.touching (closestFood)) {
    closestFood.teleport();
  }
}



class Raccoon {
  float easing = .1;
  float x, y;
  float scale = 2;


  void setScale(float s) {
    scale = s;
  }

  Raccoon(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void drawRaccoon() {
    Food closeFood = closestFood(); 
    float angle = rotation(closeFood.x - x, closeFood.y - y); 

    pushMatrix();
    noStroke();
    translate(x, y);
    //println(angle);
    rotate(angle);
    float distance = 1.75;
    float eyeDiameter = 10 * scale;
    float pupilDiameter = eyeDiameter * 1 / 2;
    float bodyDiameter = 30 * scale;
    //body
    fill(102, 51, 0);
    ellipse(0, 0 - bodyDiameter, bodyDiameter, bodyDiameter * 2);
    //nose
    triangle(0, 0 + bodyDiameter, 0 + 5, 0, 0 - 5, 0);
    //lefteye
    fill(255);
    ellipse(0 - eyeDiameter/distance, 0, eyeDiameter, 3 * eyeDiameter);
    //righteye
    ellipse(0 + eyeDiameter/distance, 0, eyeDiameter, 3 * eyeDiameter);
    //leftpupil
    fill(51, 51, 0);
    ellipse(0 - eyeDiameter/distance, 0, pupilDiameter, 3 * pupilDiameter);
    //rightpupil
    ellipse(0 + eyeDiameter/distance, 0, pupilDiameter, 3 * pupilDiameter);
    //tail
    fill(96, 96, 96);
    bezier(0, 0 - 120, 0 - 60, 0 - 300, 0 + 60, 0 - 300, 0, 0 - 120);
    popMatrix();
  }

  Food closestFood() {
    Food closeFood = null;
    float closestDistance = 10000000;
    for (Food food: foods) {
      float d = dist(rocky.x, rocky.y, food.x, food.y);
      if (d < closestDistance) {
        closestDistance = d;
        closeFood = food;
      }
    }
    return closeFood;
  }

  Food moveToClosestFood() {
    Food closeFood = closestFood();
    easing = .1;
    x += (closeFood.x - x) * easing;
    y += (closeFood.y - y) * easing;
    return closeFood;
  }

  float rotation(float pointToX, float pointToY) {
    //println (x+"," + y+"," + pointToX+"," + pointToY);
    if (pointToX == 0) {
      return (pointToY < 0)? PI: - PI;
    }
    float rotationAngleInRadians = atan(pointToY / pointToX) - PI * 0.5;
    if (pointToX < 0)
      rotationAngleInRadians += PI;
    return rotationAngleInRadians;
  }



  boolean touching(Food closestFood) {
    float d;
    d = dist(rocky.x, rocky.y, closestFood.x, closestFood.y);
    return d <= 10;
    //    if (d <= 10) {
    //      return true;
    //    } 
    //    else {
    //      return false;
    //    }
  }
}

