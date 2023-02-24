grid board;

void setup(){
  size(600, 800);
  
  board = new grid(50, 50);
}

void draw(){
  board.displayGrid();
}
