Ball[] balls = new Ball[1000];
float friction = .1;

void setup() {
  size(800,800);
  smooth();
  int i = 0;
  while(i < 1000) {
    balls[i] = new Ball (random(800),random(800),20);
    i += 1;
  }    
}

void draw() {
  background(255);
  
  for(int i = 0; i < balls.length; i++) {
    balls[i].move();
    balls[i].display(); 
  }
  
}


 
