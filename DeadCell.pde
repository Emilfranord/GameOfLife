class DeadCell extends Cell {
  
  boolean isAlive = false;

  DeadCell(Cell prev) {
    super(prev.xPosition/Cell.SIZE, prev.yPosition/Cell.SIZE, false);
    isAlive = false;
  }

   DeadCell(int xArray, int yArray) {
    super(xArray, yArray);
    isAlive = false;
  }

  void render() {
    //println("dead render");
    fill(#ffffff);
    super.render();
  }
  char toChar() {
    return 'D';
  }
  
  AliveCell reproduction(){
    return new AliveCell(xPosition/Cell.SIZE,yPosition/Cell.SIZE );
    
  }
  
  
}
