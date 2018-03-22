PImage img;
PImage destination;

void setup() {
 size(825,743);
 img = loadImage("pic1.jpg");
 destination = createImage(img.width,img.height,RGB);
}

void draw() {
  
  destination.loadPixels();
  img.loadPixels();
  
 // float threshold = 127;
  
  for(int x = 1; x < img.width; x++) {
    for(int y = 0; y < img.height; y++)   {    
      int loc = x + y * img.width;
      
      color pix = img.pixels[loc];
      int leftLoc = (x-1) + y * img.width;
      color leftPix = img.pixels[leftLoc];
      
      float diff = abs(brightness(pix) - brightness(leftPix));
      
 /*     float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      float distance = dist(x,y,mouseX,mouseY);
      float adjustBrightness = (150 - distance) / 50;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,225); */
      
      destination.pixels[loc] = color(diff);
     }
  }
  
  destination.updatePixels();
  
  if(mousePressed) {
    image(img,0,0);
  }
  else {
    image(destination,0,0);
  }
}
