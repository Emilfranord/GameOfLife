class AliveCell extends Cell {

  AliveCell(Cell prev) {
    super(prev.xPosition/Cell.SIZE, prev.yPosition/Cell.SIZE, true);
  }

  AliveCell(int xArray, int yArray) {
    super(xArray, yArray);
  }

  void render() {
    //println("alive render");
    fill(255);
    super.render();
  }

  char toChar() {
    return 'A';
  }
}
