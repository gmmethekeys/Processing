import processing.video.*;

Helicopter helicopter;
Enemy enemy;
Gunshot gunshot;

Capture video;

boolean showHelicopter = false;
float[] brightsX = new float[4];
float[] brightsY = new float[4];
Enemy[] enemies = new Enemy[0];
Gunshot[] shots = new Gunshot[0];
int n = 0;
int nE = 2;
float mbx = 0;
float mby = 0;

void setup() {
  background(255);
  size(800,600,P2D);
  frameRate(30);
  helicopter = new Helicopter();
  addEnemy();
  video = new Capture(this,320,240,30);
}

void draw() {
  helicopter.render();
  helicopter.move();
  getBrightness();

  if(frameCount % 60 == 0) {
    addEnemy();
  }
  enemyRender();

  for (int i = 0; i < shots.length; i++) {
    if (shots[i].live) {
      shots[i].render();
    }
  }
  gunReaper();

  //  ellipse(mbx,mby,50,50);
}

void addEnemy() {
  println ("addEnemy");
  for (int i = 0; i < nE; i++) {
    Enemy e = new Enemy(20);
    enemies = (Enemy[])append(enemies,e);
  }
}

void enemyRender() {
  for (int d = 0; d < enemies.length; d++) {

    enemies[d].render();       //this is the render for the enemy
  }
}

void mousePressed() {
  Gunshot s = new Gunshot(helicopter.x,helicopter.y);
  shots = (Gunshot[])append(shots,s);
}

void gunReaper() {
  boolean check = true;
  while (check && (shots.length > 0)) {
    int lastElement = shots.length - 1;
    if (shots[lastElement].live == false) {
      println("delete");
      shots = (Gunshot[])shorten(shots);
    }
    else {
      check = false;
    }
  }
}




