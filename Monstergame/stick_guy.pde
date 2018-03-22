class StickGuy
{
  float x;
  float y;
  boolean isDead;
  int persistFrames;
  int deadFrames;
  BWSmoke smoke;
  int direction;
  float speed;
  
  StickGuy(float x, float y)
  {
    isDead = false;
    persistFrames = 1000;
    this.x = x;
    this.y = y;
    direction = (int)pow(-1, int(random(0,2)));
    speed = random(0.2, 0.8);
  }

  void kill()
  {
    if(isDead)
    {
      return;
    }
    
    smoke = new BWSmoke(x, y - 4, 3, 12);
    
    deadFrames = 0;
    isDead = true;
  }
  
  boolean hitTest(int x, int y)
  {
    if(x >= this.x - 4
      && x <= this.x + 4
      && y >= this.y - 15
      && y <= this.y)
    {
      return true;
    }
    
    return false;
  }

  // return true if the guy is gone
  boolean render()
  {
    stroke(0);
    fill(255);
    
    if(isDead == false)
    {
      return renderAlive();
    }
    else
    {
      return renderDead();
    }
  }
  
  boolean renderAlive()
  {
    x += speed * direction;
    
    if(x > width)
    {
      direction = -1;
    }
    else if(x < 0)
    {
      direction = 1;
    }
    
    // body
    line(x, y - 4, x, y - 10);
    
    // legs
    line(x - 3, y, x, y - 4);
    line(x + 3, y, x, y - 4);
    
    // arms
    line(x - 3, y - 9, x, y - 6);
    line(x + 3, y - 9, x, y - 6);
    
    // head
    ellipse(x, y - 13, 5, 5);
    
    // is not gone
    return false;
  }
  
  boolean renderDead()
  {
    if(deadFrames == persistFrames)
    {
      // is gone
      return true;
    }
    
    // stop smoking after a while
    if(deadFrames >= persistFrames / 1.5 && smoke.stopped == false)
    {
      smoke.stop();
    }
    
    deadFrames++;
    
    fill(0);
    stroke(0);
    triangle(x, y - 3, x - 4, y, x + 4, y);
    smoke.render();
    
    // is gone
    return false;
  }
}


