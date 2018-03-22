Helicopter helicopter;
import processing.video.*;
Capture video;

boolean showHelicopter = false;
float[] brightsX = new float[4];
float[] brightsY = new float[4];
int n = 0;

float mbx = 0;
float mby = 0;


void setup() {
  background(255);
  size(800,600,P2D);
  frameRate(30);
  helicopter = new Helicopter();
  video = new Capture(this,320,240,30);
  
}

void draw() {
  helicopter.render();
  helicopter.move();
  getBrightness();

  ellipse(mbx,mby,50,50);
}

void keyPressed(){
  if (keyCode == UP) {
    helicopter.up=true;
    //  break;
  }
  if (keyCode == DOWN) {
    helicopter.down=true;
    // break;
  }
  if (keyCode == LEFT) {
    helicopter.left=true;
    // break;
  }
  if (keyCode == RIGHT) {
    helicopter.right=true;
    // break;
  }
}
void keyReleased(){
  if (keyCode == UP) {
    helicopter.up=false;
    // break;
  }
  if (keyCode == DOWN) {
    helicopter.down=false;
    // break;
  }
  if (keyCode == LEFT) {
    helicopter.left=false;
    // break;
  }
  if (keyCode == RIGHT) {
    helicopter.right=false;
    // break;
  }
}




