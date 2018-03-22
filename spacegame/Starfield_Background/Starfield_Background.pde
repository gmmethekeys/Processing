
class Starbackground{
  int numfield=3;
  Starfield[] starfield = new Starfield[numfield];

  Starbackground(){
  }

  //-----------------------------CREATE OBJECTS----------------------------------
  void  set_background(){
    for(int i=0; i<numfield; i++){

      starfield[i]=new Starfield();

    }

    starfield[0].setfield(.05,.5,#666688);
    starfield[1].setfield(.1,.5,#5566bb);
    starfield[2].setfield(.2,0,#ffddff);
  }


  //-------------------------MATH

  void starbackground_MATH(){
    for (int d=0; d<numfield;d++){
      starfield[d].starfield_MATH(); 
    }
  }
  /////////-----------------------------RENDER
  void starbackground_RENDER(){
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
    void setfield(float speed,float radius, int col){

      for (int i=0; i<numstars; i++) {
        starellipse[i]= new Starellipse(speed,radius,col);
      }

    }
    //-------------------------MATH

    void starfield_MATH(){
      for (int d=0; d<numstars;d++){
        starellipse[d].star_MATH(); 
      }
    }
    /////////-----------------------------RENDER
    void starfield_RENDER(){
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
      void star_MATH(){
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
      void star_RENDER(){
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

