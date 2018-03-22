float x = 200;
float y = 200;
float w = 32;
float h = 32;
float velocityX= 1;

void setup()
{
  size(400,400);
  smooth();
}

void draw ()
{
  background(170);
  {
    move(mouseX/10);
    bounce();
  }
  drawCircle();
}

void move() {
  x = x + velocityX;
}

void bounce() {
  if (x > (width-w/2) || x < (w/2))
  velocityX = velocityX * -1;
}

void drawCircle() {
   ellipse (x,y,w,h);
}
