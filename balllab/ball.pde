class Ball { 
  float x;
  float y;
  float speed;
  float w;
  PVector dir;
  float a,b,c; q
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    dir = new PVector(0,0);
    a= random(255);
    b= random(255);
    c= random(255);
  } 
  
  void move() {
 //   speed = speed + friction;
   float d = dist(mouseX,mouseY,x,y);
   float v = 30;
     if(d < v) {
       PVector der = new PVector(x-mouseX,y-mouseY); 
       der.normalize();
       float m = map(d,0,v,1,0) * 30;
       dir.x += der.x*m;
       dir.y += der.y*m;
       
     }     
    x += dir.x;
    y += dir.y;
    if(x < 0) {
      x = 0;
      dir.x *= -0.9;
    }
    else if(x > width) {
      x = width;
      dir.x *= -0.9;
    }
    if(y < 0) {
      y = 0;
      dir.y *= -.9;
    }
    else if(y > height) {
       y = height;
       dir.y *= -0.9; 
    }
    
    dir.x *= .955;
    dir.y *= .955;
 }
  

void display() {
  fill(a,b,c);
  stroke(0);
  ellipse(x,y,w,w);
}
}
