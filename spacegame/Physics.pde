class Physics{
  boolean hit;
  int destroyed=-1;

  Physics(){  
  }

  boolean crash(){
    for (int i=0;i<one.numrocks;i++){

      float distance= dist(ship.x_locOne,ship.y_locOne,one.rockellipse[i].x_locTwo,one.rockellipse[i].y_locTwo);
      if (distance<ship.r1+one.rockellipse[i].r2){
        hit=true;
      }

    }
    return hit;
  }

  void missle() {
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






