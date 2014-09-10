int factorial(int n) {
  int product=1;
  for (int i=1; i<=n; ++i)
    product=product*i;
  return product;
}

void setup() {
  size(200, 150);
  textSize(32);
  text("6!="+factorial(6), 10, 30);
}

