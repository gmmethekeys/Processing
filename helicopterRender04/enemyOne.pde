class Enemy
{ 
  boolean blownup = false;
  float y;        // y location of enemy
  float x;        // x location of enemy
  int r;                   // radius of enemy
  float speed;

  Enemy(int tempr) {
    r = tempr;
    speed = random(-5.0,-0.5);
    x = width;
    y = random(10,height-10);
    }

  void render() {
    x += speed;
    noFill();
    ellipse(x,y,r,r);
   
  }
}



