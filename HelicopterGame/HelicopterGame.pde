float heliPosY = 0;
float heliPosX = 0;

void setup() {
  size(800,700,P3D);
  smooth();
}

void draw() {
  background(255);
  stroke(0);
  fill(100);
  rectMode(CENTER);
  
  translate(50,50);
  rect(heliPosX,heliPosY,60,60);
  
  if (keyPressed) {
    if (keyCode == UP) {
      heliPosY -= 0.5;
    }
    if (keyCode == DOWN) {
      heliPosY += 0.5;
    }
    if (keyCode == RIGHT) {
      heliPosX += 0.5;
    }
    if (keyCode == LEFT) {
      heliPosX -= 0.5;
    }
  }
}


