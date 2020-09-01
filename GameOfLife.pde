Cell[][] cellArray;
int ArrayDimentions = 15;

void settings() {
  size(ArrayDimentions * Cell.SIZE, ArrayDimentions * Cell.SIZE);
}

void setup() {
  frameRate(2);
  cellArray = loadCells();
  saveCells(cellArray);
  //String[] loadedFile = loadStrings("output.txt");
  //cellArray = loadCells(loadedFile);
}

void draw() {
  render(cellArray);
  cellArray = updateLife(cellArray);
}

Cell[][] loadCells() { // new random cell field
  // TODO: remake to fit into loadCells(String[]) variant.
  Cell[][] output =  new Cell[ArrayDimentions][ArrayDimentions];
  for (int i = 0; i<output.length; i++) {
    for (int j = 0; j<output.length; j++) {
      //output[i][j] = new Cell(i, j);
      if (random(2)<1) {
        output[i][j] = loadCell('D', i, j);
      } else {
        output[i][j] = loadCell('A', i, j);
      }
    }
  }
  return output;
}

Cell[][] loadCells(String[] input) { // construct from a String[]
  Cell[][] temp = new Cell[ArrayDimentions][ArrayDimentions];
  for (int i = 0; i<temp.length; i++) {
    for (int j = 0; j<temp.length; j++) {
      temp[i][j] = loadCell(input[i].charAt(j), i, j);
    }
  }
  return temp;
}


Cell loadCell(char entry, int i, int j ) {
  if (entry== 'D') {
    return new DeadCell(i, j);
  }
  if (entry == 'A') {
    return new AliveCell(i, j);
  }
  if (entry == 'F') {
    return new FrendlyCell(i, j);
  }
  return new DeadCell(i, j);
}



void saveCells(Cell[][] output) { // construct a txt file from the Cell[][]
  String[] temp = new String[output.length];
  for (int i = 0; i<output.length; i++) {
    temp[i] = "";
    for (int j = 0; j<output.length; j++) {
      temp[i] += output[i][j].toChar();
    }
  }
  saveStrings("output.txt", temp );
}

void render(Cell[][] input) {// renders a cell array array. 
  for (int i = 0; i<input.length; i++) {
    for (int j = 0; j<input.length; j++) {
      input[i][j].render();
    }
  }

  input[7][4].render();
}

void mousePressed() {
  for (int i = 0; i<cellArray.length; i++) {
    for (int j = 0; j<cellArray.length; j++) {
      if (cellArray[i][j].isClicked(mouseX, mouseY)) {
        cellArray[i][j] = cellArray[i][j].kill();
      }
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveCells(cellArray);
    println("state saved");
  }
  key = 'q';
}

Cell[][] updateLife(Cell[][] life) {
  Cell[][] futureSetup = new Cell[life.length][life.length];

  for (int i = 0; i<life.length; i++) {
    for (int j = 0; j<life.length; j++) {
      int count = 0;
      if (i!=0 && j!=0) {
        //println(life[i-1][j-1].isAlive);
        if (life[i-1][j-1].isAlive) {
          //println("ff");
          count++;
        }
      }

      if (j!=0) {
        if (life[i][j-1].isAlive) {
          count++;
        }
      }

      if (i!= life.length-1 && j!=0) {
        if (life[i+1][j-1].isAlive) {
          count++;
        }
      }

      if (i!=0) {
        if (life[i-1][j].isAlive) {
          count++;
        }
      }

      if (i!= life.length-1) {
        if (life[i+1][j].isAlive) {
          count++;
        }
      }

      if (i!=0 && j!= life.length-1) {// changed from 2
        if (life[i-1][j+1].isAlive) {
          count++;
        }
      }

      if (j!= life.length-1) { // changed from 2
        if (life[i][j+1].isAlive) {
          count++;
        }
      }

      if (i!= life.length-1 && j!= life.length-1) {
        if (life[i+1][j+1].isAlive) {
          count++;
        }
      }

      // inside of the for loops.
      // next generation, based on conways game of life.

      futureSetup[i][j] = loadCell(life[i][j].toChar(), i, j);

      if (life[i][j].isAlive == true && count == 1 || count == 0) {
        futureSetup[i][j] = futureSetup[i][j].kill();
      }
      if (life[i][j].isAlive == true && count == 2 || count == 3) {
        // nothing
      }
      if (life[i][j].isAlive == true && count <3) {
        futureSetup[i][j] = futureSetup[i][j].kill();
      }

      if (life[i][j].isAlive == false && count == 3) {
        futureSetup[i][j] = futureSetup[i][j].resurrect();
      }
    }
  }
  // outside of the for loops.

  return futureSetup;
}
