import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample kick;
AudioSample snare;

void setup()
{
  size(512,200,P3D);
  minim = new Minim(this);
  kick = minim.loadSample("Cymbal.aif");
  snare = minim.loadSample("Snare3.aif");
  
  smooth();
}

void draw()
{
  background(0);
  stroke(255);
  for (int i = 0; i < kick.bufferSize() - 1; i++) {
    float x1 = map(i,0,kick.bufferSize(),0,width);
    float x2 = map(i+1,0,kick.bufferSize(),0,width);
    line(x1,50-kick.mix.get(i)*50,x2,50-kick.mix.get(i+1)*50);
    line(x1,150-snare.mix.get(i)*50,x2,150-snare.mix.get(i+1)*50);
  }
}

void keyPressed()
{
  if (key == 's') snare.trigger();
  if (key == 'k') kick.trigger();
}
 
 public void stop()
{
 snare.close();
 kick.close();
 minim.stop(); 
  
}

