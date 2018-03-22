float circleX = 10;
float circleY = 200;
float w = 40;
float h = 40;
float r;
float g;
float b;
float a;


void setup()
{
  size(400,400);
  smooth();
}

void draw()
{
 
  r = random(255);
  g=random(255);
  b=random(255);
  a=random(255);
 noStroke();
 fill(r,g,b,a);
  circleX = random(width);
  circleY = random(height);
  w = random(10,50);
  h = w;
  ellipse(circleX,circleY,w,h);
}

