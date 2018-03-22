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
int page = 1;
int score = 0; 
float mbx = 0;
float mby = 0;
String scoreNumber;

PFont font;

void setup() {
  background(255);
  size(800,600,P2D);
  frameRate(30);
  helicopter = new Helicopter();
  addEnemy();
  video = new Capture(this,320,240,30);
  font = loadFont("ArnoPro-SmbdItalicSmText-80.vlw"); 
}

void draw() {
  background(255);
  
  fill(0);
  stroke(0);
  scoreNumber = "score: " + score;
  textFont(font,30);
  text(scoreNumber,40,40);
  
  if (page == 1) {
    if (helicopter.live == true) {
      helicopter.render();
      helicopter.move();
    }
    if(frameCount % 60 == 0) {
      addEnemy();
    }
    checkforcollisions();
    checkforhits();
    enemyRender();


    for (int i = 0; i < shots.length; i++) {
     // println("render shot " + i );
      if (shots[i].live == true) {
        shots[i].render();
      }
    }
    
    gunReaper();
    enemyReaper();
    getBrightness();
    //  ellipse(mbx,mby,50,50);
    
  }

  else if (page == 2) {
    background(155);
    textAlign(CENTER);
    fill(255, 255, 148);
    textFont(font,80);
    text("YOU SUCK", width/2, height/2);
  }
}

void checkforcollisions() {
  if (helicopter.live == true) {
    helicopter.checkforcollision();
  }
}

void checkforhits() {
  for (int i = 0; i < shots.length; i++) {
    if (shots[i].live) {
      shots[i].checkforhit();
    }
  }
}

void addEnemy() {
  // println ("addEnemy");
  for (int i = 0; i < nE; i++) {
    Enemy e = new Enemy(20);
    enemies = (Enemy[])append(enemies,e);
  }
}

void enemyRender() {
  for (int d = 0; d < enemies.length; d++) {
    if (enemies[d].live) {
      enemies[d].render();                     //this is the render for the enemy
    }
  }
}

void mousePressed() {
  Gunshot s = new Gunshot(helicopter.x,helicopter.y);
  shots = (Gunshot[])append(shots,s);
}

void gunReaper() {
  boolean guncheck = true;
  while (guncheck && (shots.length > 0)) {
    int lastElement = shots.length - 1;
    if (shots[lastElement].live == false) {
      //println("delete");
      shots = (Gunshot[])shorten(shots);
    }
    else {
      guncheck = false;
    }
  }
}

void enemyReaper() {
  int i = enemies.length - 1;
  while (i >= 0) {
    if (enemies[i].live == false) {
      // println("enemy deleted");
     //  println(i + " - " + enemies.length);
    //  println(enemies[i].x);
      if (i == (enemies.length - 1)) {
        //enemies = (Enemy[])subset(enemies,0,i-1);
      }
      else if (i == 0) {
        enemies = (Enemy[])subset(enemies,i+1);
      }
      else {
        Enemy[] a = (Enemy[])subset(enemies,0,i);
        Enemy[] b = (Enemy[])subset(enemies,i+1);
        enemies   = (Enemy[])concat(a,b);
      }
    }
    i--;
  }
}

