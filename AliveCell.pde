class AliveCell extends Cell {

  AliveCell(Cell prev) {
    super(prev.xPosition/Cell.SIZE, prev.yPosition/Cell.SIZE, true);
    //isAlive = true;
  }

  AliveCell(int xArray, int yArray) {
    super(xArray, yArray);
    //isAlive = true;
  }

  void render() {
    //println("alive render");
    fill(0);
    super.render();
  }

  char toChar() {
    return 'A';
  }
}
