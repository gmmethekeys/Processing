PImage img;

void setup() {
 img = loadImage("pic1.jpg");
 size(img.width,img.height);
 frameRate(30);
 
}

void draw() {
  for( int i = 0; i < 400; i++) {
  
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y * img.width;
  
  img.loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
 
 noStroke(); 
 fill(r,g,b,127);
 //float w = random(20,80);
 //float l = random(20,80);
 
 float d = dist(mouseX,mouseY,x,y);
 float v = 60;
   if(d < v) {
    int l=5;
    int w=5;
    rect(x,y,l,w);
  }
  else{
     float w = random(20,50);
     float l = random(20,50);
     rect(x,y,l,w);
  }
}
}


