Ball[] balls = new Ball[1];
float gravity = .1;

void setup() {
 size(400,400);
 smooth();
 balls[0] = new Ball(200,0,50);
}

void draw() {
  background(255);
  
  for (int i = 0; i < balls.length; i++){
  
  balls[i].move();
  balls[i].display(); 
  }
  
}

void mousePressed() {
 Ball b = new Ball(mouseX,mouseY,20); 
 balls =(Ball[])append(balls,b);
}
