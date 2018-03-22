import processing.core.*; 
import processing.xml.*; 

import processing.video.*; 

import java.applet.*; 
import java.awt.*; 
import java.awt.image.*; 
import java.awt.event.*; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class colorTrackvideo extends PApplet {


Capture video;
int trackColor;

RetroFlower flowerA;
RetroFlower flowerB;
RetroFlower flowerC;
RetroFlower flowerD;
RetroFlower flowerE;
boolean showFlower = false;

public void setup() {
  size(400,400);
  smooth();
  video = new Capture(this,320,240,30);
  trackColor = color (255,0,0,0); 
  flowerA = new RetroFlower(100,100,50);
  flowerB = new RetroFlower(300,100,50);
  flowerC = new RetroFlower(200,200,50);
  flowerD = new RetroFlower(100,300,50);
  flowerE = new RetroFlower(300,300,50);
}


public void draw() {

  if (video.available()) {
    video.read();
  }

  video.loadPixels();

  float closestValue = 500.0f;
  float cX = 0;
  float cY = 0;

  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      int loc = x + y * video.width;
      int currentColor = video.pixels[loc];
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
 
 if(showFlower == true) {

  background(255);
  line(200,200,200,180); 
  flowerA.s=map(cX,0,400,0,100  );
  flowerB.s=map(cX,0,400,0,100);
  flowerC.s=map(cX,0,400,0,100);
  flowerD.s=map(cX,0,400,0,100);
  flowerE.s=map(cX,0,400,0,100);
  flowerA.draw();
  flowerB.draw();
  flowerC.draw();
  flowerD.draw();
  flowerE.draw();
}

  else {
    image(video,0,0);
  }
}

public void mousePressed() {
  int loc = mouseX + mouseY * video.width;
  trackColor = video.pixels[loc];
  showFlower = true;
}

public void keyPressed() {
  showFlower = false;
}

class RetroFlower {
  
  float x;
  float y;
  float s;
  float rr;
  float gg;
  float bb;
  
  
RetroFlower(float newx, float newy, float news) {
  x = newx;
  y = newy;
  s = news;
  rr = random(255);
  gg = random(255);
  bb = random(255);
}
  
public void draw() {
 
 pushMatrix();
 translate(x,y);
 ellipseMode(CENTER);
 ellipse(0,0,75,75);
  
 float r = 0.0f;
 while(r < 365) {
   pushMatrix();
   rotate(radians(r));
   fill(rr,gg,bb);  
   ellipse(40,0,s,12);
   popMatrix();
   r += 36.0f;
 }
 fill(rr,gg,bb);  
 ellipse(0,0,20,20);
 
 popMatrix();
  
}
}


  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "colorTrackvideo" });
  }
}
