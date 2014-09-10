int[] test= {
  2, 5, 7, 6, 1, 3, 1, 4, 5, 9, 2, 6, 1, 3, 13, 12, 3, 8, 2
};

int i = 1;

void setup() {
  size(400, 200);
  //  textSize(24);
  //  fill(255);
  //  text((test), 10, 100);
  //  bubbleSort(test);
}

void bubbleSort(int[] input) {
  boolean swapped = true;
  while (swapped) {
    swapped = false;
    for (int i = 1; i < input.length; i++) {
      if (input[i-1] > input[i]) {
        int swap = input[i-1];
        input[i-1] = input[i];
        input[i] = swap;
        swapped = true;
      }
    }
  }
}

void makeASwap(int[] input) {
  if (input[i-1] > input[i]) {
    int swap = input[i-1];
    input[i-1] = input[i];
    input[i] = swap;
  }
  i++;
  if (i >= input.length) {
    i = 1;
  }
}

String numberList(int[] input) { 
  String s="" + input[0];
  for (int k = 0; k < input.length; ++k) {
    s += ", " + input[k];
  }
  return s;
}

void draw() {
  makeASwap(test);
  textSize(16);
  fill(255);
  background(0);
  text(numberList(test), 10, 70);
}
