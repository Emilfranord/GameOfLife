class DeadCell extends Cell {
  DeadCell(Cell prev) {
    super(prev.xPosition/Cell.SIZE, prev.yPosition/Cell.SIZE, false);
  }

  DeadCell(int xArray, int yArray) {
    super(xArray, yArray);
  }

  void render() {
    fill(#ffffff);
    super.render();
  }
  char toChar() {
    return 'D';
  }
}
