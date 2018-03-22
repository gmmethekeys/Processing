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
import ddf.minim.*;
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

void setup(){
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
void draw(){

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

void keyPressed(){
  world.reset();
  ship.movePressed();
  missle.misslePressed();
  world.pause();
  world.mute_MUSIC();
}
void keyReleased(){
  ship.moveReleased();
  missle.missleReleased();
}

void stop()
{
  // always close Minim audio classes when you are done with them
  //  player.close();
  // always stop Minim before exiting.
  minim.stop();

  super.stop();
}







