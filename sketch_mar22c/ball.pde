class Ball {
  float x;
  float y;
  float speed;
  float w;
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    
  } 
  
  void move() {
   speed = speed + gravity;
   
   
   y = y + speed;
   
   if (y > height) {
     speed = speed * -0.95;
     y = height;
   }
  } 
  
  void display() {
    fill(195);
    stroke(0);
    
    ellipse(x,y,w,w);
  }
    
}
