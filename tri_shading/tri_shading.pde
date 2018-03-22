void setup()
{
  size(400,400);
  
}

void draw()
{
  if (mouseX < width/3) {
  background(255);
  }
  else if (mouseX < 2*width/3) {
    background(110);
  }
  else {
    background(0);
  }
  stroke(128);
  line(width/3,0,width/3,height);
  line(2*width/3,0,2*width/3,height);
}

// and &&
// or ||
// negate !
