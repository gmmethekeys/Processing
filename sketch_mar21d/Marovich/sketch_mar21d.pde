RetroFlower flowerA;
RetroFlower flowerB;
RetroFlower flowerC;
RetroFlower flowerD;
RetroFlower flowerE;

void setup() {
  size(400,400);
  smooth();
  flowerA = new RetroFlower(100,100,50);
  flowerB = new RetroFlower(300,100,50);
  flowerC = new RetroFlower(200,200,50);
  flowerD = new RetroFlower(100,300,50);
  flowerE = new RetroFlower(300,300,50);
}


void draw() {
  background(255);
  line(200,200,200,180); 
  flowerA.s=map(mouseX,0,400,0,80);
  flowerB.s=map(mouseY,0,400,0,100);
  flowerC.s=map(mouseX,0,400,0,80);
  flowerD.s=map(mouseX, 0,400,0,100);
  flowerE.s=map(mouseY,0,400,0,100);
  flowerA.draw();
  flowerB.draw();
  flowerC.draw();
  flowerD.draw();
  flowerE.draw();
}
