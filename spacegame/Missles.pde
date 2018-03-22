class Missles{
  int missle_r1=4;
  float missle_X=-10;
  float missle_Y=-10;
  float missle_SPEED=2;
  boolean fired=false;
  float frozen;
  boolean missle_UP=true;
  void missle_MATH(){  

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

  void  missle_RENDER(){
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

  void misslePressed(){
    if ((key=='f')||(key=='F')){
      fired=true;
    }
  }

  void missleReleased(){
    if ((key=='f')||(key=='F')){
      fired=false;
    }
  }
}
