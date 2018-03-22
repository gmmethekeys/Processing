import processing.video.*;
Capture video;
PImage prevFrame;

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
     
     color c = color(max(dr,dg,db));
     pixels[loc] = c;
   }
 }
updatePixels();
}
