grid board;
ant hormiga;

void setup(){
  size(800, 800);
  
  board = make_board(50, 50);
  hormiga = new_ant(board);
}

void draw(){
  board.displayGrid();
  hormiga.display();
  hormiga.move();
}

grid make_board(int rows, int columns) {
  return new grid(rows, columns);
}

ant new_ant(grid board) {
  return new ant(board);
}
