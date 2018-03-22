void setup()
{
  size(400,400);
  //rectMode(CENTER); if desired
  
}

void draw()
{ 
  background(64,187,91);
  fill(87,191,64);
  rectMode(CENTER);
  rect(mouseX,mouseY,40,40);
  line(mouseX,mouseY,200,200);  
}


