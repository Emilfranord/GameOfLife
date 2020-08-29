class DeadCell extends Cell {

  DeadCell(Cell prev) {
    super(prev.xPosition, prev.yPosition, false);
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
