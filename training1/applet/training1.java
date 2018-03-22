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

public class training1 extends PApplet {

public void setup() {
  size (400, 400);
  stroke (255);
  
}

public void draw() {
  line(200, 200, mouseX, mouseY);
}

public void mousePressed() {
   background(192, 64, 0);
}


  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "training1" });
  }
}
