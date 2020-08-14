//Gemme information om det 2-dimensionelle array i fil
//Tegne ”brættet” ud fra en fil
//Skifte farven i firkanter der klikkes på

void setup() {
  size(400, 400);
  Cell[][] cellArray = createCells();
  render(cellArray);
}

void draw() {
}

Cell[][] createCells() {
  Cell[][] output =  new Cell[10][10];

  for (int i = 0; i<output.length; i++) {
    for (int j = 0; j<output.length; j++) {
      println(i, j);
      output[i][j] = new Cell(i, j);
    }
  }

  return output;
}

Cell[][] loadCells() {
  // TODO implement this
  return new Cell[10][10];
}

void render(Cell[][] input) {
  for (int i = 0; i<input.length; i++) {
    for (int j = 0; j<input.length; j++) {
      input[i][j].render();
    }
  }
}

class Cell {
  int xPosition;
  int yPosition;
  final int SIZE = 40;
  boolean isAlive;

  Cell(int xArray, int yArray) {
    xPosition = xArray * SIZE;
    yPosition = yArray * SIZE;

    isAlive = random(2)>1;
  }

  Cell(int xArray, int yArray, boolean lifeStatus) {
    this(xArray, yArray);
    isAlive = lifeStatus;
  }

  Cell(String saveData) {
    // TODO implement this
    // expect data like toString
  }

  String toString() {
    // TODO implement this
    // give data to String constructor 
    return "test";
  }

  void render() {
    if (isAlive) {
      fill(0);
    } else {
      fill(255);
    }
    square(xPosition, yPosition, SIZE);
  }

  boolean isNeighbour(Cell suspect) {
    // TODO implement this
    // use size and distance to the other quorners. They are at the locations, relative to this cell:(size, 0), (0,size), (-size,0), (0,-size)
    return false;
  }
}
