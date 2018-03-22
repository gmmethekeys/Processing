void setup () {
  size(400,400);
  smooth();
}

void draw() {
 background(0);
 int circleSize = 250;
 ellipseMode(CENTER);
 
 while (circleSize > 0) {
   fill(circleSize);
   ellipse(mouseX,mouseY,circleSize,circleSize);
   circleSize -= 25; 
 } 
}
