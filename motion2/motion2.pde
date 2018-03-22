import processing.video.*;
Capture video;
PImage prevFrame;

float px;
float py;

void setup() {
  size(320,240);
  video = new Capture(this,width,height,15);
  prevFrame = createImage(video.width,video.height,RGB);
}

void draw() {
  background(0);
  if(video.available()) {
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
    prevFrame.updatePixels();
    video.read();             //capture a new frame from the camera
    
  } 
  
loadPixels();
video.loadPixels();
prevFrame.loadPixels();

float threshold = 50;
int npixelsThreshold = 10;
float xsum = 0.0;
float ysum = 0.0;
int npixels = 0;  //these are for average 
 
 for(int x = 0; x < video.width; x++) {
   for(int y = 0; y < video.height; y++) {
     int loc = x + y * video.width;
     color current = video.pixels[loc];
     color previous = prevFrame.pixels[loc];
     
     float r1 = red(current);
     float g1 = green(current);
     float b1 = blue(current);
     
     float r2 = red(previous);
     float g2 = green(previous);
     float b2 = blue(previous);
     
     float dr = abs(r2-r1);
     float dg = abs(g2-g1);
     float db = abs(b2-b1);
     
     if(dr > threshold || dg > threshold || db > threshold) {
       
       xsum += x;
       ysum +=y;
       npixels++;
     }
     
     color c = color(max(dr,dg,db));
     pixels[loc] = c;
   }
 }
updatePixels();

if (npixels > npixelsThreshold) {
  float xc = xsum / npixels;
  float yc = ysum / npixels;
  noFill();
  stroke(255);
 // ellipse(xc,yc,30,30);
  ellipse((xc-px)/2.0,(yc-py)/2.0,30,30);
  
  px = xc;
  py = yc;
  
}
}
