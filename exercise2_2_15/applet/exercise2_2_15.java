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

public class exercise2_2_15 extends PApplet {

public void setup()
{
  size(400,400);
  //rectMode(CENTER); if desired
  
}

public void draw()
{ 
  background(64,187,91);
  fill(87,191,64);
  rectMode(CENTER);
  rect(mouseX,mouseY,40,40);
  line(mouseX,mouseY,200,200);  
}



  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "exercise2_2_15" });
  }
}
