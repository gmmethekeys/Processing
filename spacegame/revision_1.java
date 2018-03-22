import processing.core.*; 
import processing.xml.*; 

import ddf.minim.*; 

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

public class revision_1 extends PApplet {

////AUDIO ON OFF//
boolean play=true; 
///////////IMAGES/////////////
PImage ship_IMAGE;
PImage rock_IMAGE;
PImage flames_IMAGE;
PImage flames_2_IMAGE;
//////////////////////////////
//////////IMAGES ARRAY FOR MISSLE SPRIT//////////////

int numFrames= 5;
int frame= 0;
PImage[] images= new PImage[numFrames];


/////////////////////////////////////////////////////
////////////AUDIO///////////////

Minim minim;
AudioSnippet player;

//////////////////////////////
/////////////BACKGROUND///////
Starbackground backg;
////////////////////////////
PFont font;
World world;
SimpleShip ship;
Rockfield one;
Missles missle;
Physics system;

public void setup(){
  //////////////GRAPHICS///////////////

  ship_IMAGE=loadImage("ship.png");
  rock_IMAGE=loadImage("astroid.png");
  flames_IMAGE=loadImage("flames.png");
  flames_2_IMAGE=loadImage("flames_2.png");


  ///////////GRAPHICS FOR FIRE BALL//////////////
  images[0] =loadImage("missles1.png");  
  images[1] =loadImage("missles2.png");  
  images[2] =loadImage("missles3.png");  
  images[3] =loadImage("missles4.png");  
  images[4] =loadImage("missles5.png");  



  ///////////////////////////////////
  /////////////AUDIO/////////
  minim = new Minim(this);

  // http://www.hexawe.net/ Thank you for the music!!!!!!!!
  player = minim.loadSnippet("a.wav");

  // play the file
  if (play){
    player.loop();
  }

  ///////////////////////////
  ////////MISSLES////////////
  missle=new Missles();
  //////////////////////////
  noStroke();
    backg = new Starbackground();
    backg.set_background();
  ship = new SimpleShip();
  one = new Rockfield();
  world=new World();
  system=new Physics();
  one.setrocks();

  smooth();
  size (700,350); 
  background(0);
  noCursor();
  frameRate(999);

  font=loadFont("Serif-48.vlw");
  textFont(font,25);
  textAlign(CENTER);

}

int lastCheck=0;
public void draw(){

  background(0);

  while ((millis()-lastCheck)>=10){
    lastCheck+=10;
        backg.starbackground_MATH();
    world.gameover_MATH();
    world.settings();
    missle.missle_MATH();
    ship.ship_MATH();
    one.rockfield_MATH();
    system.crash();
    system.missle();

    ship.ship_ANIMATIONS();
    println(system.destroyed);



  }
  /////background//////// 
   backg.starbackground_RENDER();
  ///////////////////////

  ship.ship_RENDER();
  one.rockfield_RENDER();
  missle.missle_RENDER();
  world.gameover_RENDER();



}

public void keyPressed(){
  world.reset();
  ship.movePressed();
  missle.misslePressed();
  world.pause();
  world.mute_MUSIC();
}
public void keyReleased(){
  ship.moveReleased();
  missle.missleReleased();
}

public void stop()
{
  // always close Minim audio classes when you are done with them
  //  player.close();
  // always stop Minim before exiting.
  minim.stop();

  super.stop();
}







class Rockfield {
  int numrocks=20;
  Rockellipse[] rockellipse=new  Rockellipse[numrocks];

  Rockfield(){
  }

  public void setrocks(){
    for (int i=0; i <numrocks; i++){
      rockellipse[i]= new Rockellipse ();
    }
  }
  public void  rockfield_MATH(){
    for (int d=0; d<numrocks;d++){
      rockellipse[d].rock_MATH(world.r2,world.speed);
    }
  }

  public void rockfield_RENDER(){
    for (int d=0; d<numrocks;d++){
      rockellipse[d].rock_RENDER();//// this is render rockellipse now
    }

  }


  class Rockellipse{
    // boolean hit=false;
    boolean  blownup=false;
    float y_locTwo=-2; /// y location of astroid
    float x_locTwo=-2; /// x location of astroid
    int r2;//radius of astroids
    Rockellipse(){
    }
    ///------------------------------------

    public void rock_MATH(int r2,float speed){
      this.r2=r2;
      if (x_locTwo==-2){
        x_locTwo=random(width,width+width); 
      }

      /////////////////////// asteroid destroyed /////////////////////////      moved over to collision class  ( not working any way )

      //  float missle_distance= dist(missle.missle_X,missle.missle_Y,x_locTwo,y_locTwo);
      //  if (missle_distance<missle.missle_radius+r2){
      //    destroyed=true;
      //  }
      /////////////////////////////////////////////////////////////////////

      x_locTwo-=speed;

      if (y_locTwo==-2){
        y_locTwo=random(0,height); 
      }
      if (x_locTwo<0){
        x_locTwo+=width; 
        y_locTwo=random(0,height);
      }   
    }


    public void rock_RENDER(){
      noFill();
      // ellipse(x_locTwo,y_locTwo,r2,r2);  
      imageMode(CENTER);
      if (!blownup){ 
        image(rock_IMAGE,x_locTwo,y_locTwo);
      }
    }

  }
}
class Missles{
  int missle_r1=4;
  float missle_X=-10;
  float missle_Y=-10;
  float missle_SPEED=2;
  boolean fired=false;
  float frozen;
  boolean missle_UP=true;
  public void missle_MATH(){  

    if(frozen<millis()){
      missle_UP=true; 
    }
    else
    {
      missle_UP=false; 
    }
    if (missle_UP){
      if (fired){
        missle_X=ship.x_locOne;
        missle_Y=ship.y_locOne;  
        frozen=millis()+3000;
      }
    }
    missle_X+=missle_SPEED;
  }

  public void  missle_RENDER(){
    pushStyle();
    frame++;
    if (frame == numFrames){
      frame=0;
    }
    pushStyle();
    noStroke();
    ellipseMode(RADIUS);
    image(images[frame],missle_X-7,missle_Y);
    fill(216,143,7,90);
    ellipse(missle_X,missle_Y,missle_r1,missle_r1);
    popStyle();
    // ellipse(missle_X,missle_Y,missle_r1,missle_r1);
    // popStyle();

    if (missle_UP){
      fill(250,0,0);
      ellipse(20,20,10,10);

    }   
    else {
      fill(255);
      ellipse(20,20,10,10);

    }

  }

  public void misslePressed(){
    if ((key=='f')||(key=='F')){
      fired=true;
    }
  }

  public void missleReleased(){
    if ((key=='f')||(key=='F')){
      fired=false;
    }
  }
}
class Physics{
  boolean hit;
  int destroyed=-1;

  Physics(){  
  }

  public boolean crash(){
    for (int i=0;i<one.numrocks;i++){

      float distance= dist(ship.x_locOne,ship.y_locOne,one.rockellipse[i].x_locTwo,one.rockellipse[i].y_locTwo);
      if (distance<ship.r1+one.rockellipse[i].r2){
        hit=true;
      }

    }
    return hit;
  }

  public void missle() {
    for (int i=0;i<one.numrocks;i++){
      float distance= dist(missle.missle_X,missle.missle_Y,one.rockellipse[i].x_locTwo,one.rockellipse[i].y_locTwo);
      if (distance<missle.missle_r1+one.rockellipse[i].r2){
        one.rockellipse[i].y_locTwo=height+70;
        missle.missle_Y=height+40;
      }
    }
  }
}
/////////////////////// asteroid destroyed //////////////////////////   
//
//  float missle_distance= dist(missle.missle_X,missle.missle_Y,x_locTwo,y_locTwo);
//  if (missle_distance<missle.missle_radius+r2){
//    destroyed=true;
//  }
/////////////////////////////////////////////////////////////////////






class SimpleShip {

  float x_locOne=height/2;
  float y_locOne=200;
  int r1 = 7;

  float x_speed;
  float y_speed;
  float acceleration=.4f;
  float ease=1.10f;
  float maxspeed=2;


  boolean up=false;
  boolean down=false;
  boolean left=false;
  boolean right=false;


  SimpleShip(){
  }

  //--------------MATH
  public void ship_MATH(){
    if(up){
      y_speed-=acceleration;
    }
    if(down){
      y_speed+=acceleration;
    }
    if(left){
      x_speed-=acceleration;
    }
    if(right){
      x_speed+=acceleration;
    }
    if ((!up)&&(!down)){
      y_speed=y_speed/ease;
    }
    if ((!left)&&(!right)){
      x_speed=x_speed/ease;
    }
    x_speed=constrain(x_speed,maxspeed*-1,maxspeed);
    y_speed=constrain(y_speed,maxspeed*-1,maxspeed);

    x_locOne=constrain(x_locOne,0+5,width-3);
    y_locOne=constrain(y_locOne,0+5,height-3);

    y_locOne+=y_speed; 
    x_locOne+=x_speed;

  }
  float fire_X;
  float fire_XX;
  float fire_Y;
  public void ship_ANIMATIONS(){
    fire_XX=x_locOne-5;
    fire_X=x_locOne-5;
    fire_Y=y_locOne;

    if(up){
      fire_Y=y_locOne-.8f;
    }

    if(down){
      fire_Y=y_locOne+.8f;
    }

    if(right){
      fire_X+=.4f;
    }
    if(left){
      fire_X-=.4f; 
    }
    fire_Y+=random(-.7f,.7f);
    fire_XX+=random(-.7f,.7f);
  }

  //-----------------------------RENDER

  public void ship_RENDER(){
    // noFill();
    // ellipseMode(RADIUS);
    //ellipse(x_locOne,y_locOne,r1,r1);
    // fill(255);
    imageMode(CENTER);
    image(flames_IMAGE,fire_X,fire_Y);
    image(flames_2_IMAGE,fire_XX,fire_Y);
    image(ship_IMAGE,x_locOne,y_locOne);
  }

  //-------------------------------------EVENTS

  public void movePressed(){
    switch(key){
    case'w':
    case'W':
      up=true;
      break;
    case's':
    case'S':
      down=true;
      break;
    case'a':
    case'A':
      left=true;
      break;
    case'd':
    case'D':
      right=true;
      break;
    }
  }

  public void moveReleased(){
    switch(key){
    case'w':
    case'W':
      up=false;
      break;
    case's':
    case'S':
      down=false;
      break;
    case'a':
    case'A':
      left=false;
      break;
    case'd':
    case'D':
      right=false;
      break;
    }
  }

}





class Starbackground{
  int numfield=3;
  Starfield[] starfield = new Starfield[numfield];

  Starbackground(){
  }

  //-----------------------------CREATE OBJECTS----------------------------------
  public void  set_background(){
    for(int i=0; i<numfield; i++){

      starfield[i]=new Starfield();

    }

    starfield[0].setfield(.05f,.5f,0xff666688);
    starfield[1].setfield(.1f,.5f,0xff5566bb);
    starfield[2].setfield(.2f,0,0xffffddff);
  }


  //-------------------------MATH

  public void starbackground_MATH(){
    for (int d=0; d<numfield;d++){
      starfield[d].starfield_MATH(); 
    }
  }
  /////////-----------------------------RENDER
  public void starbackground_RENDER(){
    for (int d=0; d<numfield;d++){
      starfield[d].starfield_RENDER(); 
    }
  }





  class Starfield{
    int numstars = 700; 
    Starellipse[] starellipse =new Starellipse[numstars] ;

    Starfield(){

    }
    //-------------------------CREATE OBJECTS-----------------------------------------
    public void setfield(float speed,float radius, int col){

      for (int i=0; i<numstars; i++) {
        starellipse[i]= new Starellipse(speed,radius,col);
      }

    }
    //-------------------------MATH

    public void starfield_MATH(){
      for (int d=0; d<numstars;d++){
        starellipse[d].star_MATH(); 
      }
    }
    /////////-----------------------------RENDER
    public void starfield_RENDER(){
      for (int d=0; d<numstars;d++){
        starellipse[d].star_RENDER(); 
      }
    }

    /////-----------------------------subclass of Starfield--------------------------------
    class Starellipse{

      float speed,star_Y=-2,z,star_X=-2,r1;
      int col;

      Starellipse(float speed,float r1,int col  ){
        this.speed=speed; 
        this.r1=r1; 
        this.col=col;
      }
      ///------------------------------------
      public void star_MATH(){
        if (star_Y==-2){

          star_Y=random(0,height); 

        }
        if (star_X==-2){

          star_X=random(0,width); 

        }
        star_X-=speed;
        //   ellipse(star_X,star_Y,r1,r1); 
        if (star_X<0){
          star_X=width;
        }
        if (star_X>width){
          star_X=0;
        }
      }
      public void star_RENDER(){
ellipseMode(RADIUS);
pushStyle();
noStroke();
fill(col);       
        ellipse(star_X,star_Y,r1,r1); 
popStyle();
      }    
    }
  }

}

class  World{

  boolean pause;
  float speed=2;
  float max_speed=5;
  float step=.0005f;
  int r2=9;
  int score;
  boolean hitt=false;

  ////--------------------------Settings-------------------------------

  public void settings(){
    if (speed<max_speed){
      speed=speed+step;  
    }
    score++;
  }


  ////--------------------------Reset--------------------------------------
  public void reset(){
    if ((key =='r')||(key =='R')){
      player.close();
      setup();
      loop(); 
      lastCheck=millis();     

    }    
  }
  ////--------------------------Pause--------------------------------------

  public void pause(){
    if ((key=='p')||(key=='P')){
      if (pause==false){
        pause=true;
        noLoop();
      }
      else
      {
        pause=false;
        loop();
        lastCheck=millis();
      }
    } 

  }



  ////--------------------------GameOver--------------------------------------

  public void gameover_MATH(){

    boolean hit=system.crash();

    if (hit){
      hitt=true;

    } 

  }

  //          having trouble passing hit variable to gameover_render from gameover 
  public void gameover_RENDER(){    

    if (hitt){
      background(0);
      fill(255);
      text("GAME OVER",width/2,height/2);
      text(score,width/2,height/2+20);
      score=0;
      hitt=false;
      noLoop();

    } 

  }



  boolean mute;
  ///----------------------------------------Pause Music-----------------------------------------
  public void mute_MUSIC(){
    if ((key=='m')||(key=='M')){
      if (mute==false){
        mute=true;
        player.mute();
      }
      else
      {
        mute=false;
        player.unmute();

      }
    } 

  }

}


  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#ffffff", "revision_1" });
  }
}
