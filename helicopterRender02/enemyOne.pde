class Enemy
{
  int numenemy = 20;
  Enemyellipse[] enemyellipse =  new Enemyellipse[nE];
  
  Enemy() {
  }
  
  void setEnemy() {
    for (int i = 0; i < nE; i++) {
      enemyellipse[i] = new Enemyellipse();
    }
  }
  
  void enemyfieldMath() {
    for (int d = 0; d < nE; d++) {
      enemyellipse[d].enemyfMath(world.r2,world.speed);  //note don't know what world.r2 or world.speed is
    }
  }
  
  void enemyfieldRender() {
    for (int d = 0; d < nE; d++) {
      enemyellipse[d].enemyRender(); //this is the render for the enemy
    }
  }
  
  class Enemyellipse {          // boolean hit = false
  
    boolean blownup = false;
    float y_locTwo=-2;        // y location of astroid
    float x_locTwo=-2;        // x location of astroid
    int r2;                   // radius of astroids
    
    Enemyellipse() {
    }
    
    
    void enemyMath(int r2, float speed) {
      this.r2= r2;
      if (x_locTwo == -2) {
        x_locTwo = random(width,width+width);
      }
      
      //  float missle_distance = dist(missle.missle_X,missle.missle_Y,x_locTwo,y_locTwo);
      //  if (missle_distance<missle.missle_radius+r2){
      //    destroyed=true;
      //  }
      
      x_locTwo -= speed;
      
      if (y_locTwo == -2) {
        y_locTwo = random(0,height);
      }
      if (x_locTwo < 0) {
        x_locTwo += width;
        y_locTwo = random(0,height);
      }
    }
    
    void enemyRender() {
      noFill();
      ellipse(x_locTwo,y_locTwo,r2,r2);
      //imageMode(CENTER);
      //if(!blownup) {
      //image(enemy_Image,x_locTwo,y_locTwo);
      //}
    }
  }
}

