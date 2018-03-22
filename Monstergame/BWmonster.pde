class BWSmoke 
{ 
  int renderThrottle = 3;
  int frameCounter = 0;

  float x;
  float y;
  int pSize;
  int pCount;
  int realPCount;
  boolean stopped;
  float[] xPoints;
  float[] yPoints;

  BWSmoke(float x, float y, int pSize, int pCount)
  {
    this.x = x;
    this.y = y;
    this.pSize = pSize;
    this.pCount = pCount;
    this.realPCount = 0;
    this.stopped = false;

    xPoints = new float[pCount];
    yPoints = new float[pCount];
  }

  void stop()
  {
    stopped = true;
  }
  
  void start()
  {
    stopped = false;
  }

  void render()
  {
    if(stopped && realPCount == 0)
    {
      return;
    }

    frameCounter++;

    // don't update particles every frame
    if(frameCounter % renderThrottle == 0)
    {
      if(stopped)
      {
        realPCount--;
      }
      else if(realPCount < pCount)
      {
        realPCount++;
      }   

      // shift up
      for(int i = realPCount - 1; i > 0; i--)
      {
        xPoints[i] = xPoints[i - 1];
        yPoints[i] = yPoints[i - 1];
        yPoints[i] -= random(pSize / 3, pSize / 2);
        yPoints[i] += random(-1, 1);
      }

      // reset frame counter
      frameCounter = 0;
      xPoints[0] = random(-pSize / 2, pSize / 2) + x;
      yPoints[0] = y;
    }

    noStroke();
    //  draw the particles
    for(int i = 0; i < realPCount; i++)
    {
      fill(0, map(i, 0, realPCount, 200, 20));
      float realPSize = map(i, 0, pSize, pSize, pSize / 1.2);

      pushMatrix();
      translate(xPoints[i], yPoints[i]);
      rotate(TWO_PI / random(1, 10));
      rect(-realPSize / 2, -realPSize / 2, realPSize, realPSize);
      popMatrix();
    }

  }
}





