void setup()
{
  size(400,400);
  smooth();
  background(200);
}

void draw()
{
  //line(pmouseX,pmouseY,mouseX,mouseY);
}

void mouseDragged()
{
  strokeWeight(dist(mouseX,mouseY,pmouseX,pmouseY));
  stroke(0);
  line(pmouseX,pmouseY,mouseX,mouseY);
}

void keyPressed()
{
  background(200);
}
