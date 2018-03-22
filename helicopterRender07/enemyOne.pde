class Enemy
{ 
  boolean blownup = false;
  boolean live;
  float y;        // y location of enemy
  float x;        // x location of enemy
  int r;                   // radius of enemy
  float speed;
  int enemyDamage;
  float fn = random(255);


  Enemy(int tempr) {
    r = tempr;
    speed = random(-5.0,-0.5);
    x = width;
    y = random(10,height-10);
    live = true;
    enemyDamage = 1;
  }

  void render() {
    
    x += speed;
    fill(fn,fn,fn);
    ellipse(x,y,r,r);
    if (x < 0) {
    //  println("enemy x < 0");
      live = false;
    }
  }
}




