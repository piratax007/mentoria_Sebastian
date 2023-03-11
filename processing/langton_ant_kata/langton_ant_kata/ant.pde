class ant {
  String direction;
  int indexHorizontalPosition, indexVerticalPosition;
  int horizontalPosition, verticalPosition;
  grid currentBoard;
  IntDict moves;
  
  ant(grid board) {
    currentBoard = board;
    direction = "N";
    int cellWidth = width / board.rows;
    int cellHeight = height / board.rows;
    indexHorizontalPosition = floor(random(0, board.rows));
    indexVerticalPosition = floor(random(0, board.columns));
    horizontalPosition = indexHorizontalPosition * cellWidth + cellWidth / 2;
    verticalPosition = indexVerticalPosition * cellHeight + cellHeight / 2;
    
    moves = new IntDict();
    moves.set("N", -1);
    moves.set("S", 1);
    moves.set("W", -1);
    moves.set("E", 1);
  }
  
  void display() {
    fill(color(#AF7120));
    
    ellipse(horizontalPosition, verticalPosition, 5, 5);
  }
  
  void move(){
    cell currentCell = currentBoard.cells[indexHorizontalPosition][indexVerticalPosition];
    println(currentCell.currentState);
  }
  
  void change_cell_state(){}
}
