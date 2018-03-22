import processing.video.*;

Capture video;
int cols;
int rows;
int videoScale;

void setup() {
  size(640,480);
  smooth();
  videoScale = 16;
  cols = width / videoScale;
  rows = height / videoScale;
  video = new Capture(this,cols,rows,30);
}
 
void draw() {
  background(0);
  
  if(video.available()) {
    video.read();
  }
  video.loadPixels();
  
  float offset = videoScale / 2.0;
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * videoScale;
      int y = j * videoScale;
      int loc = i + j * video.width;
      color c = video.pixels[loc];
      float sz = (brightness(c)/255.0)*videoScale;
      
      fill(c);
      stroke(0);
      rectMode(CENTER);
      rect(x+offset,y+offset,sz,sz);
    }
  }
}
