void setup()
{
  size(400,400);
}

void draw()
{
  background(0,243,59);
  ellipseMode(CENTER);
  strokeWeight(2); 
  fill(255,227,38);
  ellipse(mouseX,mouseY,80,80);
  
  
  if(mouseY<200)
  { 
    smooth();
    fill(255);
    arc(mouseX,mouseY,50,50,0,PI/2);
    arc(mouseX,mouseY,50,50,PI/2,PI);
    line(mouseX-25,mouseY,mouseX+25,mouseY);
  }
  else {
     arc(mouseX,mouseY+25,50,50,PI,TWO_PI);
  }  
  fill(255);
  ellipse(mouseX-15,mouseY-20,10,10);
  ellipse(mouseX+15,mouseY-20,10,10);
  
 // point 
}
