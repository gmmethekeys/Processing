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

public class Ball_Lab extends PApplet {

Ball[] balls = new Ball[300];

public void setup() {
  size(800,800);
  smooth();
  int i = 0;
  while(i < 300) {
    balls[i] = new Ball(random(800),random(800),15);
    i += 1;
    noCursor();
  }    
}

public void draw() {
  background(175);
  float ballsize = random(100);
  for(int i = 0; i < balls.length; i++) {
    balls[i].move();
    balls[i].display();
    line(mouseX+5,mouseY,mouseX-5,mouseY);
    line(mouseX,mouseY+5,mouseX,mouseY-5); 
  }
  
}


 
class Ball { 
  float x;
  float y;
  float speed;
  float w;
  PVector dir;
  float a,b,c; 
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    dir = new PVector(0,0);
    a= random(255);
    b= random(255);
    c= random(255);
  } 
  
  public void move() {
   float d = dist(mouseX,mouseY,x,y);
   float v = 30;
     if(d < v) {
       PVector der = new PVector(x-mouseX,y-mouseY); 
       der.normalize();
       float m = map(d,0,v,1,0) * 40;
       dir.x += der.x*m;
       dir.y += der.y*m;
       
     }     
    x += dir.x;
    y += dir.y;
    if(x < 0) {
      x = 0;
      dir.x *= -0.9f;
    }
    else if(x > width) {
      x = width;
      dir.x *= -0.9f;
    }
    if(y < 0) {
      y = 0;
      dir.y *= -.9f;
    }
    else if(y > height) {
       y = height;
       dir.y *= -0.9f; 
    }
    
    dir.x *= .992f;
    dir.y *= .992f;
 }
  

public void display() {
  fill(a,b,c);
  stroke(0);
  ellipse(x,y,w,w);
}
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "Ball_Lab" });
  }
}
