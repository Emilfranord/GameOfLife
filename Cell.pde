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

  Cell(int xArray, int yArray, char saveData) {
    this(xArray, yArray, saveData == 'T');
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
    if (this.xPosition + SIZE == suspect.xPosition && this.yPosition == suspect.yPosition) {
      return true;
    }  
    if (this.xPosition == suspect.xPosition && this.yPosition  + SIZE == suspect.yPosition) {
      return true;
    } 
    if (this.xPosition - SIZE == suspect.xPosition && this.yPosition == suspect.yPosition) {
      return true;
    } 
    if (this.xPosition == suspect.xPosition && this.yPosition  - SIZE == suspect.yPosition) {
      return true;
    } 
    if (this.xPosition + SIZE == suspect.xPosition && this.yPosition  - SIZE == suspect.yPosition) {
      return true;
    } 
    if (this.xPosition - SIZE == suspect.xPosition && this.yPosition  + SIZE == suspect.yPosition) {
      return true;
    }
    if (this.xPosition - SIZE == suspect.xPosition && this.yPosition  - SIZE == suspect.yPosition) {
      return true;
    } 
    if (this.xPosition + SIZE == suspect.xPosition && this.yPosition  + SIZE == suspect.yPosition) {
      return true;
    }
    return false;
  }

  void onClick(int xForMouse, int yForMouse) {
    if (xForMouse > this.xPosition && xForMouse < this.xPosition+SIZE &&  yForMouse > this.yPosition && yForMouse < this.yPosition+SIZE) {
      isAlive = !isAlive;
    }
  }
  
    
  
}
