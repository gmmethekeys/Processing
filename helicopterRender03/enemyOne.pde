class Enemy
{ 
  boolean blownup = false;
  float y;        // y location of enemy
  float x;        // x location of enemy
  int r;                   // radius of enemy
  

  Enemy(int tempr) {
    r = tempr;
   
    x = width;
    y = random(10,height-10);
    }



  /* void enemyfieldMath() {
   for (int d = 0; d < nE; d++) {
   enemyellipse[d].enemyfMath(world.r2,world.speed);  //note don't know what world.r2 or world.speed is
   }
   } */


  // boolean hit = false


  void render() {
    float speed = random(-.5,-2);
    x += speed;
    noFill();
    ellipse(x,y,r,r);
    
    
    //imageMode(CENTER);
    //if(!blownup) {
    //image(enemy_Image,x_locTwo,y_locTwo);
    //}
  }
}



