class AliveCell extends Cell {

  AliveCell(Cell prev) {
    super(prev.xPosition, prev.yPosition, true);
  }

  void render() {
    fill(255);
    super.render();
  }
  
  char toChar(){
  return 'A';
  }
  
  
}
