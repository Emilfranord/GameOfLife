class Cell {
  int xPosition;
  int yPosition;
  static final int SIZE = 40;
  //boolean isAlive;

  Cell(int xArray, int yArray) {
    xPosition = xArray * SIZE;
    yPosition = yArray * SIZE;
  }

  Cell(int xArray, int yArray, boolean lifeStatus) {
    this(xArray, yArray);
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
    square(xPosition, yPosition, SIZE);
  }

  boolean isClicked(int xForMouse, int yForMouse) {
    if (xForMouse > this.xPosition && xForMouse < this.xPosition+SIZE &&  yForMouse > this.yPosition && yForMouse < this.yPosition+SIZE) {
      return true;
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
