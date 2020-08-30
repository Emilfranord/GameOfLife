class DeadCell extends Cell {

  DeadCell(Cell prev) {
    super(prev.xPosition/Cell.SIZE, prev.yPosition/Cell.SIZE, false);
  }

   DeadCell(int xArray, int yArray) {
    super(xArray, yArray);
  }

  void render() {
    //println("dead render");
    fill(#000000);
    super.render();
  }
  char toChar() {
    return 'D';
  }
}
