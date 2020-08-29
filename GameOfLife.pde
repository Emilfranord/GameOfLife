 Cell[][] cellArray;

void setup() {
  size(400, 400);
  //cellArray = loadCells();
  //saveCells(cellArray);
  String[] loadedFile = loadStrings("output.txt");
  cellArray = loadCells(loadedFile);
}

void draw() {
  render(cellArray);
}

Cell[][] loadCells() { // new random cell field
  Cell[][] output =  new Cell[10][10];

  for (int i = 0; i<output.length; i++) {
    for (int j = 0; j<output.length; j++) {
      output[i][j] = new Cell(i, j);
      if (random(2)<1) {
        output[i][j] = new DeadCell(output[i][j]);
      } else {
        output[i][j] = new AliveCell(output[i][j]);
      }
    }
  }
  return output;
}


Cell[][] loadCells(String[] input) { // construct from a String[]
  Cell[][] temp = new Cell[10][10];
  for (int i = 0; i<temp.length; i++) {
    for (int j = 0; j<temp.length; j++) {
      if (input[i].charAt(j) == 'D') {
        temp[i][j] = new DeadCell(i, j);
      }
      if (input[i].charAt(j) == 'A') {
        temp[i][j] = new AliveCell(i, j);
      }
    }
  }
  return temp;
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

void updateLife(Cell[][] life) {
  Cell[][] futureSetup = new Cell[life.length][life.length];

  for (int i = 0; i<life.length; i++) {
    for (int j = 0; j<life.length; j++) {
      int count = 0;
      if (i!=0 && j!=0) {
        if (life[i-1][j-1].isAlive) {
          count++;
        }
      }

      if (j!=0) {
        if (life[i][j-1].isAlive) {
          count++;
        }
      }

      if (i!= life.length-2 && j!=0) {
        if (life[i+1][j-1].isAlive) {
          count++;
        }
      }

      if (i!=0) {
        if (life[i-1][j].isAlive) {
          count++;
        }
      }

      if (i!= life.length-2) {
        if (life[i+1][j].isAlive) {
          count++;
        }
      }

      if (i!=0 && j!= life.length-2) {
        if (life[i-1][j+1].isAlive) {
          count++;
        }
      }

      if (j!= life.length-2) {
        if (life[i][j+1].isAlive) {
          count++;
        }
      }

      if (i!= life.length-2 && j!= life.length-2) {
        if (life[i+1][j+1].isAlive) {
          count++;
        }
      }
    }
  }
}
