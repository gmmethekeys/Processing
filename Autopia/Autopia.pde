Car myCar;

void setup() {
  size(400,400);
  smooth();
  myCar = new Car(200,200,100);
}

void draw() {
  background(255);
  myCar.drive();
  myCar.draw();

}

void keyPressed() {
  if(key == 'i') { 
   
  }
  else if (key == 'k'){
  }
} 

