int factorial (int n) {
  if (n == 0) {
    return 1;
  }
  return n * factorial(n-1);
}


void setup() {
  size(500, 500);
  background(0);
  textSize(20);
  text("10!=" + factorial(10), 190, 240);
}

