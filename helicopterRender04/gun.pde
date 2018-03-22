class Gunshot {
 float x;
 float y;
 boolean live;

 Gunshot( float newx, float newy ) {
   x = newx;
   y = newy;
   live = true;
 }

 void render() {
   fill(255);
   ellipse(x,y,5,5);
   x += 60.0;
   if (x > 800) {
     println("live = false");
     live = false;
   }
 }
}
