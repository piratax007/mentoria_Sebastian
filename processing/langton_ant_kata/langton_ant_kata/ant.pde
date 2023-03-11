class ant {
  String currentDirection;
  IntDict directions = new IntDict();  
  int indexHorizontalPosition, indexVerticalPosition;
  int horizontalPosition, verticalPosition;
  grid currentBoard;
  
  ant(grid board) {
    currentBoard = board;
    currentDirection = "N";
    directions.set("N", 0);
    directions.set("E", 1);
    directions.set("S", 2);
    directions.set("W", 3);
    int cellWidth = width / currentBoard.rows;
    int cellHeight = height / currentBoard.rows;
    indexHorizontalPosition = floor(random(0, currentBoard.rows));
    indexVerticalPosition = floor(random(0, currentBoard.columns));
    horizontalPosition = indexHorizontalPosition * cellWidth + cellWidth / 2;
    verticalPosition = indexVerticalPosition * cellHeight + cellHeight / 2;
  }
  
  void display() {
    fill(color(#5BFA66));
    noStroke();
    
    ellipse(horizontalPosition, verticalPosition, 10, 10);
    move();
  }
  
  void move(){
    cell currentCell = currentBoard.cells[indexHorizontalPosition][indexVerticalPosition];
    
    newPositionalIndex(changeDirection(currentCell.currentState));
    changePosition();
    currentDirection = changeDirection(currentCell.currentState);
  }
  
  String changeDirection(char cellCurrentState) {
    String[] selectableDirections = new String[]{"N", "E", "S", "W"};
    int indexCurrentDirection = directions.get(currentDirection);
    switch (cellCurrentState) {
      case 'R':
        return currentDirection;
      case 'B':
        if (indexCurrentDirection == 2) {
          return selectableDirections[0];
        }
        return selectableDirections[indexCurrentDirection + 1];
      case 'W':
        if (indexCurrentDirection == 0) {
          return selectableDirections[2];
        }
        return selectableDirections[indexCurrentDirection - 1];
    }
    
    return "";
  }
  
  void newPositionalIndex(String currentDirection) {
    switch (currentDirection) {
        case "N":
        indexVerticalPosition -= 1;
        if (indexVerticalPosition < 0) {
          indexVerticalPosition = currentBoard.rows - 1;
        }
        break;
        case "S":
        indexVerticalPosition += 1;
        if (indexVerticalPosition > currentBoard.rows-1) {
          indexVerticalPosition = 0;
        }
        break;
        case "W":
        indexHorizontalPosition -= 1;
        if (indexHorizontalPosition < 0) {
          indexHorizontalPosition = currentBoard.columns - 1;
        }
        break;
        case "E":
        indexHorizontalPosition += 1;
        if (indexHorizontalPosition > currentBoard.columns-1) {
          indexHorizontalPosition = 0;
        }
        break;
        default:
        break;
      }
  }
  
  void changePosition() {
    int cellWidth = width / currentBoard.rows;
    int cellHeight = height / currentBoard.rows;
    horizontalPosition = indexHorizontalPosition * cellWidth + cellWidth / 2;
    verticalPosition = indexVerticalPosition * cellHeight + cellHeight / 2;
  }
  
  void change_cell_state(){}
}
