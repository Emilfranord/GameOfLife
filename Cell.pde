class Cell {
  int xPosition;
  int yPosition;
  static final int SIZE = 40;
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
    // TODO: implement this
    
  }

  Cell(int xArray, int yArray, char saveData) {
    this(xArray, yArray, saveData == 'T');
  }

  String toString() { // the format is XXXXXX:YYYYYYT!
    if (isAlive) {
      return xPosition+ ":"+yPosition+"T!";
    } else {
      return xPosition+ ":"+yPosition+"T!";
    }
  }

  char toChar() {
    if (isAlive) {
      return 'T';
    } else {
      return 'F';
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

  void onClick() {
    // TODO: implement this
    // have the cell
  }
}
