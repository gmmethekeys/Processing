import processing.video.*;
Capture video;
color trackColor;

void setup() {
  size(320,240);
  video = new Capture(this,320,240,30);
  trackColor = color (255,0,0,0);  
}

void draw() {
  if (video.available()) {
    video.read();
  }

  video.loadPixels();

  float closestValue = 500.0;
  float cX = 0;
  float cY = 0;

  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      
      int loc = x + y * video.width;
      color currentColor = video.pixels[loc];
      
      float r1 = red(currentColor);
      float b1 = blue(currentColor);
      float g1 = green(currentColor);
      
      float r2 = red(trackColor);
      float b2 = blue(trackColor);
      float g2 = green(trackColor);
      float distance = dist(r1,g1,b1,r2,g2,b2);
      
      if (distance < closestValue) { 
        closestValue = distance;
        cX = x;
        cY = y;
      }
    }

  }
  image(video,0,0);
  ellipseMode(CENTER);
  smooth();
  noFill();
  stroke(255);
  ellipse(cX,cY,20,20);
  line(cX-10,cY, cX+10,cY);
  line(cX,cY-10,cX,cY+10);

}
  
void mousePressed() {
  int loc = mouseX + mouseY * video.width;
  trackColor = video.pixels[loc];
}


