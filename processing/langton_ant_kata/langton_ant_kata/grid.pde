class grid{
  int rows, columns;
  cell[][] cells;
  char[] states = new char[]{'W', 'B', 'R'};
  
  grid(int r, int c){
    rows = r;
    columns = c;
    
    cells = new cell[rows][columns];
    
    float cellWidth = width / columns;
    float cellHeight = height / rows;
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        cells[i][j] = new cell(i*cellWidth, j*cellHeight, cellWidth, cellHeight, states[floor(random(0,3))]);
      }
    }
  }


  void displayGrid() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        cells[i][j].display();
      }
    }
  }
}
