//returnType functionName( arguments )
//{
  //code goes here
//}

void setup() {
  size(800,800);
  smooth();
}

void draw() {
  background(175);
  
  drawFancyCircle();
}

void drawFancyCircle() {
  stroke(255,0,200);
  strokeWeight(3);
  fill(200,200,50);
  ellipse(400,400,400,400);
}
