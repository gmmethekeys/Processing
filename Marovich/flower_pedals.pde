class RetroFlower {
  
  float x;
  float y;
  float s;
  float rr;
  float gg;
  float bb;
  
  
RetroFlower(float newx, float newy, float news) {
  x = newx;
  y = newy;
  s = news;
  rr = random(255);
  gg = random(255);
  bb = random(255);
}
  
void draw() {
 
 pushMatrix();
 translate(x,y);
 ellipseMode(CENTER);
 ellipse(0,0,75,75);
  
 float r = 0.0;
 while(r < 365) {
   pushMatrix();
   rotate(radians(r));
   fill(rr,gg,bb);  
   ellipse(40,0,s,12);
   popMatrix();
   r += 36.0;
 }
 fill(rr,gg,bb);  
 ellipse(0,0,20,20);
 
 popMatrix();
  
}
}

