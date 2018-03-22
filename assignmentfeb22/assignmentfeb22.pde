boolean isButtonActive = false;

void setup()
{
 size(400,400);
 background(200);
 smooth(); 
}

void draw()
{
  rectMode(CENTER);
  if (isButtonActive == false) {
    fill(0);
  }
  else if (isButtonActive == true) {
    fill(255);
  }
  if (mouseX > 175 && mouseX < 225 && mouseY >175 && mouseY < 225) {
    fill(150);
  }
    rect (200,200,50,50);
}

void mouseClicked() {
  if (mouseX > 175 && mouseX < 225 && mouseY >175 && mouseY < 225) {
  if (isButtonActive == false) { 
    isButtonActive = true; 
  }
  else {
    isButtonActive = false;
  }
}
}

