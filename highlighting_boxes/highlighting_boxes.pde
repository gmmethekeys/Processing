void setup ()
{
  size(400,400);
  smooth(); 
  background(0);
}

void draw()
{
  background(0);
  
  if (mouseX < 200 && mouseY < 200)  {
    //fill(255);
    rect(0,0,200,200);
  }
  
  else if (mouseX > 200 && mouseY < 200){
  rect (200,0,200,200);}
  
  
 
  
  strokeWeight(2);
  stroke(255);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
 

}
