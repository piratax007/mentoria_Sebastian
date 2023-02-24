bubble b1;
bubble b2;

void setup(){
  b1 = new bubble();
  b2 = new bubble();
  
  size(300, 300);
}

void draw(){
  background(125);
  
  b1.display();
  b1.move();
  b1.detectColition(b2);
 
  
  b2.display();
  b2.move();
  b1.detectColition(b1);
}
