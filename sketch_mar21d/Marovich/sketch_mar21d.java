import processing.core.*; 
import processing.xml.*; 

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

public class sketch_mar21d extends PApplet {

RetroFlower flowerA;
RetroFlower flowerB;
RetroFlower flowerC;
RetroFlower flowerD;
RetroFlower flowerE;

public void setup() {
  size(400,400);
  smooth();
  flowerA = new RetroFlower(100,100,50);
  flowerB = new RetroFlower(300,100,50);
  flowerC = new RetroFlower(200,200,50);
  flowerD = new RetroFlower(100,300,50);
  flowerE = new RetroFlower(300,300,50);
}


public void draw() {
  background(255);
  line(200,200,200,180); 
  flowerA.s=map(mouseX,0,400,0,80);
  flowerB.s=map(mouseY,0,400,0,100);
  flowerC.s=map(mouseX,0,400,0,80);
  flowerD.s=map(mouseX, 0,400,0,100);
  flowerE.s=map(mouseY,0,400,0,100);
  flowerA.draw();
  flowerB.draw();
  flowerC.draw();
  flowerD.draw();
  flowerE.draw();
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
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "sketch_mar21d" });
  }
}
