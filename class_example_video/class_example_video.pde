import processing.video.*;

Capture video;

void setup() {
  size(320,240);
  video = new Capture(this,320,240,30);
  
}

void draw() {
  if (video.available()) {
    video.read();
  }
  loadPixels();
  video.loadPixels();
  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      int loc = x + y * video.width;
      float r = red(video.pixels[loc]);
      float g = green(video.pixels[loc]);
      float b = blue(video.pixels[loc]);
      float distance = dist(x,y,mouseX,mouseY);
      float adjustBrightness = (100-distance)/50;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      pixels[loc] = color (r,g,b);
    }
  }
  updatePixels();
  
}
