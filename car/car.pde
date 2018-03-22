void setup() {
  size(400,400);
  smooth();
  int baz = 2;
  println("before baz is " + baz);
  foo (baz);
  println("after baz is " + baz);
  
  int result  = sum(10,20,30);
  println ("result is " + result);
}

void draw() {
  background(255);
  drawCar(100,100,50);
  drawCar(200,200,100);
  drawCar(300,300,150);
}

// draws the car
void drawCar(int newx, int newy, int newsize) {
  int x =  newx;
  int y = newy;
  int thesize = newsize;
  int offset = thesize/4;
  
  rectMode(CENTER);
  stroke(0);
  fill(175);
  rect(x,y,thesize,thesize/2);
  
  fill(0);
  rect(x-offset,y-offset,offset,offset/2);
  rect(x+offset,y-offset,offset,offset/2);
  rect(x-offset,y+offset,offset,offset/2);
  rect(x+offset,y+offset,offset,offset/2);
  
  x = 200;
  y = 200;
  thesize = 40;
  offset = thesize/4;
 }
 
void foo( int bar) {
  bar = 10;
  println ("bar is " + bar);
}

int sum (int a, int b, int c) {
  int total= a+b+c;
  return total;
}
