PImage img;
int cellsize = 2;
int cols;
int rows;

void setup() {
  size(800,500,P3D);
  img = loadImage("pic1.jpg");
  cols = width / cellsize;
  rows = height / cellsize;
  frameRate(30);
}

void draw () {
  background (255);
  img.loadPixels();

  for(int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * cellsize + cellsize / 2;
      int y = j * cellsize + cellsize / 2;
      int loc = x + y * img.width;
      color c = img.pixels[loc];

      float z = (mouseX/(float)width) * brightness(c) - 100.0;

      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
    }
  }

}

