class FrendlyCell extends Cell {
  FrendlyCell(Cell prev) {
    super(prev.xPosition/Cell.SIZE, prev.yPosition/Cell.SIZE, true);
  }

  FrendlyCell(int xArray, int yArray) {
    super(xArray, yArray);
  }

  void render() {
    fill(#00ee00);
    super.render();
  }

  char toChar() {
    return 'F';
  }
}
