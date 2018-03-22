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

public class imagehw extends PApplet {

PImage img;

public void setup() {
  img = loadImage("Photo50.jpg");
  size(img.width,img.height);
  frameRate(30);

}

public void draw() {
  for( int i = 0; i < 200; i++) {

    int x = PApplet.parseInt(random(img.width));
    int y = PApplet.parseInt(random(img.height));
    int loc = x + y * img.width;

    img.loadPixels();
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);

    noStroke(); 
    fill(r,g,b,127);
    float w = random(20,50);
    float l = random(20,50);
    float d = dist(mouseX,mouseY,x,y);
    float v = 100;
    if( d > v) {
      rect(x,y,l,w);
    }
  }

  for( int i = 0; i < 1000; i++) {

    int x = PApplet.parseInt(random(mouseX-50,mouseX+50));
    int y = PApplet.parseInt(random(mouseY-50,mouseY+50));
    x = constrain(x,0,img.width-1);
    y = constrain(y,0,img.height-1);
    int loc = x + y * img.width;

    img.loadPixels();
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);

    noStroke(); 
    fill(r,g,b,127);
    float w = 1;
    float l = 1;
    rect(x,y,l,w);
  }
}



/* float d = dist(mouseX,mouseY,x,y);
 float v = 60;
 if(d < v) {
 int l=5;
 int w=5;
 rect(x,y,l,w);*/



  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "imagehw" });
  }
}
