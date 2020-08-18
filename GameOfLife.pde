//Lav et program der opdeler skærmen i en masse firkanter (ala et skakbræt). Lad firkanterne have en tilfældig af 2 forskellige farver. Det skal gerne ligne noget i stil med figuren.
//Det vil være smart at bruge et 2-dimensionelt array i forhold til næste opgave.

//Gemme information om det 2-dimensionelle array i fil
//Tegne ”brættet” ud fra en fil
//Skifte farven i firkanter der klikkes på

void setup() {
  size(100, 100);
}

void draw() {
}

Cell[][] createSquares() {
  
  return new Cell[10][10];
}

class Cell{
  int xPosition;
  int yPosition;
  final int SIZE = 10;
  boolean isAlive;
  
  Cell(int xArray, int yArray){
    // TODO implement this.
    // new random life status
  }
  
  Cell(int xArray, int yArray, boolean lifeStatus){
    this(xArray, yArray);
    isAlive = lifeStatus;
  }
  

}
