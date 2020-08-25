class DeadCell extends Cell {

  DeadCell(Cell prev) {
    super(prev.xPosition, prev.yPosition, false);
  }

  void render() {
    fill(0);
    super.render();
  }
  char toChar() {
    return 'D';
  }
}
