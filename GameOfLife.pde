//Gemme information om det 2-dimensionelle array i fil
//Tegne ”brættet” ud fra en fil
//Skifte farven i firkanter der klikkes på

Cell[][] cellArray;

void setup() {
  size(400, 400);
  //cellArray = createCells();
  //saveCells(cellArray);
  String[] loadedFile = loadStrings("output.txt");
  
  cellArray = loadCells(loadedFile); 
}

void draw() {
  render(cellArray);
}

Cell[][] createCells() { // new random cell field
  Cell[][] output =  new Cell[10][10];

  for (int i = 0; i<output.length; i++) {
    for (int j = 0; j<output.length; j++) {
      println(i, j);
      output[i][j] = new Cell(i, j);
    }
  }
  return output;
}

Cell[][] loadCells(String[] input) { // construct form a String[]
  // TODO implement this
 Cell[][] temp = new Cell[10][10];
 
   for (int i = 0; i<temp.length; i++) {
    for (int j = 0; j<temp.length; j++) {
      println(i, j);
      temp[i][j] = new Cell(i, j, input[i].charAt(j));
    }
  }
  
  return temp;
  
}

void saveCells(Cell[][] output) { // construct a txt file from the Cell[][]
  String[] temp = new String[output.length];

  for (int i = 0; i<output.length; i++) {
    temp[i] = "";
    for (int j = 0; j<output.length; j++) {
      //println(i, j);
      temp[i] += output[i][j].toChar();
    }
  }

  saveStrings("output.txt", temp );
}

void render(Cell[][] input) { // renders a cell array array. 
  for (int i = 0; i<input.length; i++) {
    for (int j = 0; j<input.length; j++) {
      input[i][j].render();
    }
  }
}
