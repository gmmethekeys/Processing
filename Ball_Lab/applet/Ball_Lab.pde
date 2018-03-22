Ball[] balls = new Ball[300];

void setup() {
  size(800,800);
  smooth();
  int i = 0;
  while(i < 300) {
    balls[i] = new Ball(random(800),random(800),15);
    i += 1;
    noCursor();
  }    
}

void draw() {
  background(175);
  float ballsize = random(100);
  for(int i = 0; i < balls.length; i++) {
    balls[i].move();
    balls[i].display();
    line(mouseX+5,mouseY,mouseX-5,mouseY);
    line(mouseX,mouseY+5,mouseX,mouseY-5); 
  }
  
}


 
