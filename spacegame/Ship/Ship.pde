class SimpleShip {

  float x_locOne=height/2;
  float y_locOne=200;
  int r1 = 7;

  float x_speed;
  float y_speed;
  float acceleration=.4;
  float ease=1.10;
  float maxspeed=2;


  boolean up=false;
  boolean down=false;
  boolean left=false;
  boolean right=false;


  SimpleShip(){
  }

  //--------------MATH
  void ship_MATH(){
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
  void ship_ANIMATIONS(){
    fire_XX=x_locOne-5;
    fire_X=x_locOne-5;
    fire_Y=y_locOne;

    if(up){
      fire_Y=y_locOne-.8;
    }

    if(down){
      fire_Y=y_locOne+.8;
    }

    if(right){
      fire_X+=.4;
    }
    if(left){
      fire_X-=.4; 
    }
    fire_Y+=random(-.7,.7);
    fire_XX+=random(-.7,.7);
  }

  //-----------------------------RENDER

  void ship_RENDER(){
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

  void movePressed(){
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

  void moveReleased(){
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




