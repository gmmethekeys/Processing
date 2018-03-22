class Car {
  float x;
  float y;
  float thesize;
  float offset;
  float speed;
  
  Car(float newx, float newy, float newsize) {
    x = newx;
    y = newy;
    thesize = newsize;
    offset = thesize/4;
    speed = 0.0; 
}

void draw() {
  rectMode(CENTER);
  stroke(0);
  fill(175);
  rect(x,y,thesize,thesize/2);
  
  fill(0);
  rect(x-offset,y-offset,offset,offset/2);
  rect(x+offset,y-offset,offset,offset/2);
  rect(x-offset,y+offset,offset,offset/2);
  rect(x+offset,y+offset,offset,offset/2);
}
void drive() {
  x+=speed;
}
void accelerator(float amount) {
  speed+=amount;
}
}
