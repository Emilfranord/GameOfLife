class Cell {
  int xPosition;
  int yPosition;
  static final int SIZE = 40;
  //boolean isAlive;

  Cell(int xArray, int yArray) {
    xPosition = xArray * SIZE;
    yPosition = yArray * SIZE;
    //isAlive = random(2)>1;
  }

  Cell(int xArray, int yArray, boolean lifeStatus) {
    this(xArray, yArray);
    //isAlive = lifeStatus;
  }

  char toChar() {
    return 'C';
  }

  boolean isAlive() {
    return this instanceof AliveCell;
  }

  boolean isDead() {
    return this instanceof DeadCell;
  }

  void render() {
    //fill(#ff0000);
    //println("super render");
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

  boolean isClicked(int xForMouse, int yForMouse) {
    if (xForMouse > this.xPosition && xForMouse < this.xPosition+SIZE &&  yForMouse > this.yPosition && yForMouse < this.yPosition+SIZE) {
      return true;
      //this.kill();
    }
    return false;
  }

  DeadCell kill() {
    return new DeadCell(floor(this.xPosition / Cell.SIZE), floor(this.yPosition / Cell.SIZE) );
  }

  AliveCell resurrect() {
    return new AliveCell(floor(this.xPosition / Cell.SIZE), floor(this.yPosition / Cell.SIZE));
  }
}
