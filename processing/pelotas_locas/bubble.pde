class bubble {
  int radius;
  float positionX;
  float positionY;
  float velocityComponentX;
  float velocityComponentY;
  color fillColor;
  
  bubble(){
    radius = floor(random(10, 20.1));
    positionX = random(radius, width-radius);
    positionY = random(radius, height-radius);
    velocityComponentX = random(-5, 5);
    velocityComponentY= random(-5, 5);
    fillColor = color(#F5A031);
  }
  
  bubble(boolean exist){
    if (!exist) {
      radius = 0;
    }
  }
  
  void display(){
    noStroke();
    fill(fillColor);
    
    ellipse(positionX, positionY, 2*radius, 2*radius);
  }
  
  void move(){
    positionX += velocityComponentX;
    positionY += velocityComponentY;
    
    edgeBounce();
  }
  
  boolean horizontalEdgeDetect() {
    if (positionY < radius || positionY > height-radius) {
      return true;
    }
    
    return false;
  }
  
  boolean verticalEdgeDetect() {
    if (positionX < radius || positionX > width-radius) {
      return true;
    }
    
    return false;
  }
  
  void horizontalBounce(boolean horizontalColition) {
    if (horizontalColition) {
      velocityComponentY *= -1;
    }
  }
  
  void verticalBounce(boolean verticalColition) {
    if (verticalColition) {
      velocityComponentX *= -1;
    }
  }
  
  void edgeBounce() {
    horizontalBounce(horizontalEdgeDetect());
    verticalBounce(verticalEdgeDetect());
  }
  
  
  void detectColition(bubble otherBubble) {
    float ownVelocityX = velocityComponentX;
    float ownVelocityY = velocityComponentY;
    float otherVelocityX = otherBubble.velocityComponentX;
    float otherVelocityY = otherBubble.velocityComponentY;
    
    
    if (dist(positionX, positionY, otherBubble.positionX, otherBubble.positionY) < radius+otherBubble.radius) {
      velocityComponentX = otherVelocityX;
      velocityComponentY = otherVelocityY;
      
      otherBubble.velocityComponentX = ownVelocityX;
      otherBubble.velocityComponentY = ownVelocityY;
    }
  }
  
  bubble mergeBubbles(bubble otherBubble) {
    bubble newBubble = new bubble(false);
    
    if (dist(positionX, positionY, otherBubble.positionX, otherBubble.positionY) < radius+otherBubble.radius) {
      radius = 0;
      otherBubble.radius = 0;
      
      newBubble = new bubble(true);
      
      newBubble.radius = radius + otherBubble.radius;
      newBubble.positionX = (positionX + otherBubble.positionX) / 2;
      newBubble.positionY = (positionY + otherBubble.positionY) / 2;
      newBubble.velocityComponentX = (velocityComponentX + otherBubble.velocityComponentX) / 2;
      newBubble.velocityComponentY = (velocityComponentY + otherBubble.velocityComponentY) / 2;
    }
    
    return newBubble;
  }
}
