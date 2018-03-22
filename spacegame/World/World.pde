class  World{

  boolean pause;
  float speed=2;
  float max_speed=5;
  float step=.0005;
  int r2=9;
  int score;
  boolean hitt=false;

  ////--------------------------Settings-------------------------------

  void settings(){
    if (speed<max_speed){
      speed=speed+step;  
    }
    score++;
  }


  ////--------------------------Reset--------------------------------------
  void reset(){
    if ((key =='r')||(key =='R')){
      player.close();
      setup();
      loop(); 
      lastCheck=millis();     

    }    
  }
  ////--------------------------Pause--------------------------------------

  void pause(){
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

  void gameover_MATH(){

    boolean hit=system.crash();

    if (hit){
      hitt=true;

    } 

  }

  //          having trouble passing hit variable to gameover_render from gameover 
  void gameover_RENDER(){    

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
  void mute_MUSIC(){
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

