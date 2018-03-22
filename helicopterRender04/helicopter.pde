class Helicopter
{
  boolean up=false;             //Boolean for keyboard control
  boolean down=false;
  boolean left=false;
  boolean right=false;

  float x;
  float y;
  PVector dir;
  float speed;

  float cx = 400;
  float cy = 300;
  float ym;
  float xm;

  Helicopter() {
    x = width / 3;  
    y = height / 2;
    speed = 0;
    dir = new PVector(0,0);
  }

  void render() {
    //main helicopter
    background(255);
    noStroke();
    fill(0);
    rect(x,y, 20, 11);           //fuesalage
    rect(x-15,y,15,4);           //tail
    ellipse(x-17,y+2,10,10);     //rear rotor
    stroke(0);
    strokeWeight(2);
    line(x+5,y+11,x+5,y+15);     //left leg
    line(x+12,y+11,x+12,y+15);   //right leg
    line(x,y+15,x+18,y+15);      //bottom leg
    line(x+9,y,x+9,y-5);         //main rotor hub    
    if (frameCount % 2 == 0) {
      line(x-13,y-5,x+9,y-5);    //left main rotor
    }
    else {
      line(x+9,y-5,x+31,y-5);    //right main rotor
    }
  }

  void move() {
    x += dir.x;
    y += dir.y;

    ym = map(abs(mby-cy),50,250,0.0,1.0);
    xm = map(abs(mbx-cx),50,400,0.0,1.0);


    if (mby < cy) {   
      dir.y -= (0.75 * ym);
    }
    if (mby > cy) {    
      dir.y += (1.2 * ym);
    }
    if (mbx < cx) {   
      dir.x += (1.0 * xm);
    }
    if (mbx > cx) {     
      dir.x -= (1.0 * xm);
    } 
    if(x < 0) {
      x = 0;
      dir.x *= -1.0;
    }
    else if(x > width) {
      x = width;
      dir.x *= -1.0;
    }
    if(y < 0) {
      y = 0;
      dir.y *= -1.0;
    }
    else if(y > height) {
      y = height;
      dir.y *= -1.0; 
    }

    dir.x *= .9;
    dir.y *= .9;
  }

}





