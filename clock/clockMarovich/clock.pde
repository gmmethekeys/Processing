void draw() {

  
 background(255);
 float[] clock = new float[60];
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  
  fill(0);
  line(s,0,s,25);
  line(m,25,m,50);
  line(h,50,h,75);
  
  
  
  
//    ellipse(100, 100, 160, 160);
  //float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
 // float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
 // float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
 // stroke(255);
  //strokeWeight(1);
 // line(100, 100, cos(s) * 72 + 100, sin(s) * 72 + 100);
  //strokeWeight(2);
  //line(100, 100, cos(m) * 60 + 100, sin(m) * 60 + 100);
  //strokeWeight(4);
  //line(100, 100, cos(h) * 50 + 100, sin(h) * 50 + 100);
  
  
}
