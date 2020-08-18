//Gemme information om det 2-dimensionelle array i fil
//Tegne ”brættet” ud fra en fil
//Skifte farven i firkanter der klikkes på

Cell[][] cellArray;

void setup() {
  size(400, 400);
  cellArray = createCells();
}

void draw() {
  render(cellArray);
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

void render(Cell[][] input) { // renders a cell array array. 
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

  Cell(String saveData) { // this can only get the info of one cell, not a array array.
    //TODO: implement this.
    int seperator = saveData.indexOf(":");
    
    if(saveData.endsWith("T!")){
      
    }else if(saveData.endsWith("F!")){
      
    }else {
      println("Incomplete data");
    }
  }

  String toString() {
    if (isAlive) {
      return xPosition+ ":"+yPosition+"T!";
    } else {
      return xPosition+ ":"+yPosition+"T!";
    }
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
  
  void onClick(){
  // TODO: implement this
  // have the cell 
  }
  
}
