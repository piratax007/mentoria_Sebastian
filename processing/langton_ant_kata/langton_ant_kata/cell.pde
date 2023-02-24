class cell {
  float horizontalPosition;
  float verticalPosition;
  float cellWidth;
  float cellHeight;
  char currentState;
  
  cell(float hP, float vP, float cW, float cH, char cS) {
    horizontalPosition = hP;
    verticalPosition = vP;
    currentState = cS;
    cellWidth = cW;
    cellHeight = cH;
  }
  
  void display() {
    stroke(#898787);
    
    switch (currentState) {
      case 'R':
        fill(255, 0, 0);
        break;
       case 'B':
         fill(0);
         break;
       default:
         fill(255);
         break;
    }
    
    rect(horizontalPosition, verticalPosition, cellWidth, cellHeight);
  }
}
