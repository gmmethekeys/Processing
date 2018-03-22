import processing.video.*;

Helicopter helicopter;
Enemy enemy;

Capture video;

boolean showHelicopter = false;
float[] brightsX = new float[4];
float[] brightsY = new float[4];
Enemy[] enemies = new Enemy[10];
int n = 0;
int nE = 10;
float mbx = 0;
float mby = 0;


void setup() {
  background(255);
  size(800,600,P2D);
  frameRate(30);
  helicopter = new Helicopter();
  setEnemy();
  video = new Capture(this,320,240,30);
  
}

void draw() {
  helicopter.render();
  helicopter.move();
  getBrightness();
  
  enemyRender();
  
  
//  ellipse(mbx,mby,50,50);
}

void setEnemy() {
    for (int i = 0; i < nE; i++) {
      enemies[i] = new Enemy(20);
    }
  }
  
   void enemyRender() {
    for (int d = 0; d < nE; d++) {
      enemies[d].render(); //this is the render for the enemy
    }
  }




