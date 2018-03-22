void setup() {
  size(400,400);
  background(255);
  smooth();
}

  
void draw() {
    
 pushMatrix();
 translate(200,200);
 ellipseMode(CENTER);
 ellipse(0,0,75,75);
  
 float r = 0.0;
 while(r < 365) {
   pushMatrix();
   rotate(radians(r));
   ellipse(40,0,40,12);
   popMatrix();
   r += 36.0;
 }
 
 ellipse(0,0,20,20);
 
 popMatrix();
  
}

